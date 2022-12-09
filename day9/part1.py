import sys


def part1():
    data = [line.strip().split() for line in sys.stdin]
    tailMoves = {
        (0, 2): (0, 1),
        (0, -2): (0, -1),
        (2, 0): (1, 0),
        (-2, 0): (-1, 0),
        (1, 2): (1, 1),
        (-1, 2): (-1, 1),
        (1, -2): (1, -1),
        (-1, -2): (-1, -1),
        (2, 1): (1, 1),
        (2, -1): (1, -1),
        (-2, 1): (-1, 1),
        (-2, -1): (-1, -1)
    }
    visited = set()
    hx = 0
    hy = 0
    tx = 0
    ty = 0
    for line in data:
        direction = line[0]
        steps = int(line[1])
        for _ in range(steps):
            if direction == "U":
                hy += 1
            elif direction == "D":
                hy -= 1
            elif direction == "L":
                hx -= 1
            elif direction == "R":
                hx += 1
            if (max(abs(hx-tx), abs(hy-ty)) > 1):
                key = (hx-tx, hy-ty)
                tx += tailMoves[key][0]
                ty += tailMoves[key][1]
            visited.add((tx, ty))
    print(len(visited))


if __name__ == "__main__":
    part1()
