#!/usr/bin/env python3

with open("day2.txt") as f:
    lines = f.readlines()

total_area = 0
total_ribbon = 0
for line in lines:
    l, w, h = map(int, line.split('x'))
    side_areas = [l*w, w*h, h*l]
    total_area += 2 * sum(side_areas) + min(side_areas)

    total_ribbon += l * w * h
    sides = [l, w, h]
    sides.remove(max(sides))
    total_ribbon += sum(sides) * 2

print("Total area: %r, total ribbon: %r" % (total_area, total_ribbon,))
