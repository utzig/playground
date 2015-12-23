#!/usr/bin/env python3

import re

must_not_have = ("ab", "cd", "pq", "xy")
vowels = ("a", "e", "i", "o", "u")

with open("day5.txt") as f:
    lines = f.readlines()

# Initial criteria

total_nice = 0
for line in lines:
    nice = True

    for s in must_not_have:
        if s in line:
            nice = False
            break

    if nice:
        number_of_vowels = 0
        for vowel in vowels:
            number_of_vowels += line.count(vowel)
        if number_of_vowels < 3:
            nice = False

    if nice:
        if re.search(r"([a-z])\1+", line) is None:
            nice = False

    if nice:
        total_nice += 1

print("Total nice with initial criteria: %r" % (total_nice,))

# New criteria

total_nice = 0
for line in lines:
    nice = True

    if re.search(r"([a-z][a-z]).*\1+", line) is None:
        nice = False

    if nice:
        if re.search(r"([a-z])[a-z]\1+", line) is None:
            nice = False

    if nice:
        total_nice += 1

print("Total nice with new criteria: %r" % (total_nice,))
