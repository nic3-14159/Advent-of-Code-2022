import sys

cycles = [20, 60, 100, 140, 180, 220]
total = 0
data = [line.strip().split() for line in sys.stdin]
cycleNum = 1
x = 1
for line in data:
    if line[0] == "noop":
        if cycleNum in cycles:
            total += cycleNum * x
        cycleNum += 1
    elif line[0] == "addx":
        if cycleNum in cycles:
            total += cycleNum * x
        cycleNum += 1
        if cycleNum in cycles:
            total += cycleNum * x
        cycleNum += 1
        x += int(line[1])
print(total)
