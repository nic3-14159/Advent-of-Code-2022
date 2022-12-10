import sys


def draw_pixel(cycle, x):
    if abs(x - ((cycle - 1) % 40)) <= 1:
        print("#", end="")
    else:
        print(" ", end="")
    if cycle % 40 == 0:
        print("")


def main():
    data = [line.strip().split() for line in sys.stdin]
    cycleNum = 1
    x = 1
    for line in data:
        if line[0] == "noop":
            draw_pixel(cycleNum, x)
            cycleNum += 1
        elif line[0] == "addx":
            draw_pixel(cycleNum, x)
            cycleNum += 1
            draw_pixel(cycleNum, x)
            cycleNum += 1
            x += int(line[1])


if __name__ == "__main__":
    main()
