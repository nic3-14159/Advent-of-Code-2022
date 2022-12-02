import sys
moves = {
        "A": {"X": "Z", "Y": "X", "Z": "Y"},
        "B": {"X": "X", "Y": "Y", "Z": "Z"},
        "C": {"X": "Y", "Y": "Z", "Z": "X"},
         }

for line in sys.stdin:
    print(line[0], moves[line[0]][line[2]])
