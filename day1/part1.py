import sys
maxCal = 0
total = 0
elfCalories = list()
for line in sys.stdin:
    if line == "\n":
        elfCalories.append(total)
        total = 0
    else:
        total += int(line)
elfCalories.sort(reverse = True)
print(elfCalories[0])
print(sum(elfCalories[0:3]))
