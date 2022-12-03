import sys
total = 0
for line in sys.stdin:
    a, b = [set(line.strip()[0:len(line.strip())//2]), set(line.strip()[len(line.strip())//2:])]
    c = a.intersection(b).pop()
    total += ord(c)-96 if c > 'Z' else ord(c)-64+26
print(total)
