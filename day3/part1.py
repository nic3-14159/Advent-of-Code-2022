import sys
total = 0
for line in sys.stdin:
    priorities = [ord(c)-96 if c > 'Z' else ord(c)-64+26 for c in line.strip()]
    a = sorted(priorities[0:len(priorities)//2])
    b = sorted(priorities[len(priorities)//2:])
    bIndex = 0
    aIndex = 0
    while max(aIndex, bIndex) < len(a):
        if a[aIndex] == b[bIndex]:
            total += a[aIndex]
            break
        if a[aIndex] > b[bIndex]:
            bIndex += 1
        else:
            aIndex += 1
print(total)
