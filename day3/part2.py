import sys
total = 0
badge = set()
for i, line in enumerate(sys.stdin):
    if line == "\n":
        total += badge.pop()
        break
    priorities = [ord(c)-96 if c > 'Z' else ord(c)-64+26 for c in line.strip()]
    if i % 3 == 0:
        if i > 0:
            total += badge.pop()
        badge = set(priorities)
    badge = badge.intersection(set(priorities))
print(total)
