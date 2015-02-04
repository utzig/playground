#include <IL/il.h>

#include <stdio.h>
#include <stdlib.h>

#define COLOR_RED    0
#define COLOR_GREEN  1
#define COLOR_BLUE   2

void usage(char *app)
{
  printf("Usage: %s <image> [central-weight] [neighbours] \n", app);
  printf("\t[central-weight]: if supplied will use value for central weight and 1 for neighbours\n");
  printf("\t[neighbours]: how many adjacent tiles to use (default is one)\n");
  printf("\n");
  printf("This program will output four files:\n");
  printf("\tred.png: image containing red channel information\n");
  printf("\tgreen.png: image containing green channel information\n");
  printf("\tblue.png: image containing blue channel information\n");
  printf("\tblur.png: image containing blur with weight 1 and 1 neighbour\n");
  printf("\tblur_weigth.png: option image containing blur with supplied weight and neighbour level\n");
  exit(0);
}

void filter_color(uint8_t color)
{
  ILubyte * pixels = ilGetData();
  ILuint width = ilGetInteger(IL_IMAGE_WIDTH);
  ILuint height = ilGetInteger(IL_IMAGE_HEIGHT);
  ILuint bpp = ilGetInteger(IL_IMAGE_BPP);

  uint8_t del1 = COLOR_RED, del2 = COLOR_RED;

  switch (color) {
  case COLOR_RED:
  default:
    del1 = COLOR_GREEN;
    del2 = COLOR_BLUE;
    break;
  case COLOR_GREEN:
    del1 = COLOR_RED;
    del2 = COLOR_BLUE;
    break;
  case COLOR_BLUE:
    del1 = COLOR_RED;
    del2 = COLOR_GREEN;
    break;
  }

  for (int h = 0; h < height; h++) {
    for (int w = 0; w < width; w++) {
      long cur = (w + h * width) * bpp;
      pixels[cur + del1] = 0;
      pixels[cur + del2] = 0;
    }
  }
}

void save_filtered(ILint image, int color, char *filename)
{
  ilBindImage(image);
  ILint new = ilCloneCurImage();
  ilBindImage(new);
  filter_color(color);
  ilSave(IL_PNG, filename);
}

/* Increments colors with values from pixels and returns weight */
/* FIXME: maybe should not know that there are 3 bytes! */
long add_colors_from_pixel(long *r,
                           long *g,
                           long *b,
                           uint8_t weight,
                           ILubyte *pixel)
{
  *r += pixel[0] * weight;
  *g += pixel[1] * weight;
  *b += pixel[2] * weight;
  return (long)weight;
}

void save_blur(ILint original,
               uint8_t neighbour_level,
               uint8_t central_weight,
               char *filename)
{
  ilBindImage(original);
  ILubyte *pixels = ilGetData();
  ILuint width = ilGetInteger(IL_IMAGE_WIDTH);
  ILuint height = ilGetInteger(IL_IMAGE_HEIGHT);
  ILuint bpp = ilGetInteger(IL_IMAGE_BPP);

  ILint new = ilCloneCurImage();
  ilBindImage(new);
  ILubyte *new_pixels = ilGetData();

  long cur, left, right, top, bottom;
  long r, g, b;
  long total;

  for (int h = 0; h < height; h++) {
    for (int w = 0; w < width; w++) {
      long x, y;

      r = g = b = 0;
      total = 0;

      left    = w - neighbour_level;
      right   = w + neighbour_level;

      top     = h - neighbour_level;
      bottom  = h + neighbour_level;

      for (y = top; y <= bottom; y += 1) {

        // Skip invalid coordinates
        if (y <= 0 || y >= height) continue;

        for (x = left; x <= right; x += 1) {
          // Skip invalid coordinates
          if (x <= 0 || x >= width) continue;

          long pos = (x + y * width) * bpp;
          if (x == w && y == h) {
            total += add_colors_from_pixel(&r, &g, &b, central_weight, &pixels[pos]);
          } else {
            total += add_colors_from_pixel(&r, &g, &b, 1, &pixels[pos]);
          }
        }
      }

      r /= total;
      g /= total;
      b /= total;

      cur = (w + h * width) * bpp;
      new_pixels[cur + 0] = (ILubyte) r;
      new_pixels[cur + 1] = (ILubyte) g;
      new_pixels[cur + 2] = (ILubyte) b;
    }
  }

  ilSave(IL_PNG, filename);
}

int main(int argc, char *argv[])
{
  int central_weight = 1;
  int neighbour_level = 1;

  if (argc < 2) {
    usage(argv[0]);
  }

  if (argc > 2) central_weight = atoi(argv[2]);
  if (argc > 3) neighbour_level = atoi(argv[3]);

  ilInit();
  ilEnable(IL_FILE_OVERWRITE);

  ILuint original = ilGenImage();
  ilBindImage(original);

  ILboolean rc = ilLoadImage(argv[1]);
  if (rc == IL_FALSE) {
    printf("Could not load: %s\n", argv[1]);
    usage(argv[0]);
  }

  save_filtered(original, COLOR_RED,   "red.png");
  save_filtered(original, COLOR_GREEN, "green.png");
  save_filtered(original, COLOR_BLUE,  "blue.png");

  save_blur(original, 1, 1, "blur.png");
  if (central_weight != 1 && neighbour_level != 1) {
    save_blur(original, neighbour_level, central_weight, "blur_weight.png");
  }

  ilShutDown();

  return 0;
}
