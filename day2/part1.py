import sys
moveValue = {"A": 1, "B": 2, "C": 3, "X": 1, "Y": 2, "Z": 3}
total = 0
for line in sys.stdin:
    score = 0
    opp, you = [moveValue[i] for i in line.split()]
    print(line[0], line[2], opp, you)
    score += you
    if not (you == 3 and opp == 1) and (you > opp) or (you == 1 and opp == 3):
        print("win")
        score += 6
    elif you == opp:
        print("draw")
        score += 3
    else:
        print("loss")
    print(score)
    total += score
print(total)
