import sys

dirs = [
    [1, 0, 0], [-1, 0, 0],
    [0, 1, 0], [0, -1, 0],
    [0, 0, 1], [0, 0, -1],
]


def in_bounds(coords, lower, upper):
    return all([lower[i] <= coords[i] <= upper[i] for i in range(3)])


def solve():
    space = set()
    sa = 0
    lower = (10000, 10000, 10000)
    upper = (-10000, -10000, -10000)
    data = [tuple(map(int, line.strip().split(","))) for line in sys.stdin]
    for cube in data:
        sa += 6
        lower = tuple([min(lower[i], cube[i]) for i in range(3)])
        upper = tuple([max(upper[i], cube[i]) for i in range(3)])
        for d in dirs:
            if (cube[0]+d[0], cube[1]+d[1], cube[2]+d[2]) in space:
                sa -= 2
        space.add(cube)
    print(sa)
    print(lower, upper)
    sa = 0
    lower = tuple([lower[i]-1 for i in range(3)])
    upper = tuple([upper[i]+1 for i in range(3)])
    visited = set()
    queue = [lower]
    visited.add(lower)
    while (len(queue) > 0):
        cube = queue.pop(0)
        for d in dirs:
            neighbor = tuple([cube[0]+d[0], cube[1]+d[1], cube[2]+d[2]])
            if neighbor not in space and neighbor not in visited and \
                    in_bounds(neighbor, lower, upper):
                queue.append(neighbor)
                visited.add(neighbor)
            elif neighbor in space:
                sa += 1
    print(sa)


if __name__ == "__main__":
    solve() 
