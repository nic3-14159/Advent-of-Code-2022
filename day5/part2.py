import sys
import re
moves = list()
stacks = [list() for i in range(0, 9)]
columns = [1, 5, 9, 13, 17, 21, 25, 29, 33]
for line in sys.stdin:
    if line == "\n":
        break
    for i, col in enumerate(columns):
        if line[col].isdigit():
            break
        if line[col] != " ":
            stacks[i].insert(0, line[col])
for move in sys.stdin:
    match = re.match('move ([0-9]*) from ([0-9]*) to ([0-9]*)', move)
    num = int(match[1])
    src = int(match[2])-1
    dest = int(match[3])-1
    for crate in stacks[src][-num:]:
        stacks[dest].append(crate)
    stacks[src] = stacks[src][0:-num]
for i in range(0, 3):
    print(stacks[i].pop(), end="")
print()


