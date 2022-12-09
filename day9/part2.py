import sys


def part1():
    data = [line.strip().split() for line in sys.stdin]
    knotMoves = {
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
        (-2, -1): (-1, -1),
        (2, 2): (1, 1),
        (2, -2): (1, -1),
        (-2, 2): (-1, 1),
        (-2, -2): (-1, -1)
    }
    visited = set()
    knotPos = [(0, 0) for _ in range(10)]
    for line in data:
        print(line)
        direction = line[0]
        steps = int(line[1])
        for _ in range(steps):
            if direction == "U":
                knotPos[0] = (knotPos[0][0], knotPos[0][1]+1)
            elif direction == "D":
                knotPos[0] = (knotPos[0][0], knotPos[0][1]-1)
            elif direction == "L":
                knotPos[0] = (knotPos[0][0]-1, knotPos[0][1])
            elif direction == "R":
                knotPos[0] = (knotPos[0][0]+1, knotPos[0][1])
            for i in range(1, 10):
                if (max(abs(knotPos[i-1][0]-knotPos[i][0]), abs(knotPos[i-1][1]-knotPos[i][1])) > 1):
                    key = (knotPos[i-1][0]-knotPos[i][0], knotPos[i-1][1]-knotPos[i][1])
                    knotPos[i] = (knotPos[i][0] + knotMoves[key][0], knotPos[i][1] + knotMoves[key][1])
            visited.add(knotPos[9])
    print(len(visited))

if __name__ == "__main__":
    part1()

