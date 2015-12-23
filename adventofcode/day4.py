#!/usr/bin/env python2

from hashlib import md5

key = "bgvyzdsv"
n = 1
five = None
six = None
while True:
    m = md5(key + str(n))
    hexdigest = str(m.hexdigest())
    if hexdigest.startswith("00000") and five is None:
        five = n
    if hexdigest.startswith("000000") and six is None:
        six = n
    if five is not None and six is not None:
        break
    n += 1
print("Five: %r, Six: %r" % (five, six,))
