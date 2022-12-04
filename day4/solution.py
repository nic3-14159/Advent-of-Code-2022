import sys
count = 0
part2count = 0
data = [line.strip().split(",") for line in sys.stdin]
for pair in data:
    a = [int(i) for i in pair[0].split("-")]
    b = [int(i) for i in pair[1].split("-")]
    if (a[0] <= b[0] and b[1] <= a[1]):
        count += 1
    elif (b[0] <= a[0] and a[1] <= b[1]):
        count += 1
    if (b[0] <= a[1] and b[1] >= a[1]):
        part2count += 1
    elif (a[0] <= b[1] and a[1] >= b[1]):
        part2count += 1
print(count)
print(part2count)
