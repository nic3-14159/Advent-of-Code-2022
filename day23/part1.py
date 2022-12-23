import sys

def solve():
    adjacent = [
        [[-1, -1], [-1, 0], [-1, 1]],
        [[1, -1], [1, 0], [1, 1]],
        [[-1, -1], [0, -1], [1, -1]],
        [[-1, 1], [0, 1], [1, 1]],
    ]
    moves = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    elves = set()
    data = [line for line in sys.stdin]
    for row, line in enumerate(data):
        for col, c in enumerate(line):
            if c == "#":
                elves.add((row, col))

    for i in range(10):
        proposed = dict()
        for elf in elves:
            canMove = [1, 1, 1, 1]
            for j in range(i, i+4):
                for a in adjacent[j % 4]:
                    if (elf[0]+a[0], elf[1]+a[1]) in elves:
                        canMove[j % 4] = 0
            if all(canMove) or not any(canMove):
                proposed[elf] = elf
            else:
                for j in range(i, i+4):
                    if canMove[j % 4] == 1:
                        proposed[elf] = ((elf[0]+moves[j % 4][0], elf[1]+moves[j % 4][1]))
                        break
        elves = set()
        for elf in proposed:
            spot = tuple()
            if list(proposed.values()).count(proposed[elf]) == 1:
                spot = proposed[elf]
            else:
                spot = elf
            elves.add(spot)
    mincoord = (1000000, 10000000)
    maxcoord = (-1000000, -1000000)
    for elf in elves:
        mincoord = (min(mincoord[0], elf[0]), min(mincoord[1], elf[1]))
        maxcoord = (max(maxcoord[0], elf[0]), max(maxcoord[1], elf[1]))
    print((maxcoord[0]-mincoord[0]+1) * (maxcoord[1]-mincoord[1]+1) - len(elves))


if __name__ == "__main__":
    solve()
