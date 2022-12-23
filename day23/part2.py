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

    i = 0
    while True:
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
        noMove = 0
        for elf in proposed:
            spot = tuple()
            if list(proposed.values()).count(proposed[elf]) == 1:
                spot = proposed[elf]
            else:
                spot = elf
            elves.add(spot)
            if spot == elf:
                noMove += 1
        i += 1
        if noMove == len(elves):
            break
    print(i)

if __name__ == "__main__":
    solve()
