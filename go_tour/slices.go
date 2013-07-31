// Go Tour
// Exercise: Slices

package main

import "code.google.com/p/go-tour/pic"

func Pic(dx, dy int) [][]uint8 {
    sl := make([][]uint8, dy)
    for i := 0; i < dy; i++ {
        sl[i] = make([]uint8, dx)
    }
    for y := 0; y < dy; y++ {
        for x := 0; x < dx; x++ {
            //sl[y][x] = uint8(x^y);
            sl[y][x] = uint8((x+y)/2);
            //sl[y][x] = uint8(x*y);
        }
    }
    return sl
}

func main() {
    pic.Show(Pic)
}
