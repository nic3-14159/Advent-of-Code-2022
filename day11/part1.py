import sys
import re

def part1():
    monkeys = list()
    data = [line.strip() for line in sys.stdin]
    monkeyIndex = 0
    for i, line in enumerate(data):
        match i % 7:
            case 0:
                monkeys.append(dict())
                monkeys[monkeyIndex]["inspected"] = 0
            case 1:
                _, items = line.split(":")
                monkeys[monkeyIndex]["items"] = [int(item.strip()) for item in items.split(",")]
            case 2:
                match = re.search("([+\-\*/]) (\d+)", line)
                if match is not None:
                    monkeys[monkeyIndex]["op"] = match[1]
                    monkeys[monkeyIndex]["num"] = int(match[2])
                else:
                    match = re.search("([+\-\*/]) old", line)
                    monkeys[monkeyIndex]["op"] = match[1]
                    monkeys[monkeyIndex]["num"] = "old"
            case 3:
                match = re.search("(\d+)", line)
                monkeys[monkeyIndex]["divtest"] = int(match[0])
            case 4:
                match = re.search("(\d+)", line)
                monkeys[monkeyIndex]["tMonkey"] = int(match[0])
            case 5:
                match = re.search("(\d+)", line)
                monkeys[monkeyIndex]["fMonkey"] = int(match[0])
            case 6:
                monkeyIndex += 1
    for roundNum in range(20):
        for i, monkey in enumerate(monkeys):
            newWorry = 0
            for item in monkey["items"]:
                match monkey["op"]:
                    case "+":
                        if monkey["num"] == "old":
                            newWorry = item + item
                        else:
                            newWorry = item + monkey["num"]
                    case "-":
                        if monkey["num"] == "old":
                            newWorry = item - item
                        else:
                            newWorry = item - monkey["num"]
                    case "*":
                        if monkey["num"] == "old":
                            newWorry = item * item
                        else:
                            newWorry = item * monkey["num"]
                    case "/":
                        if monkey["num"] == "old":
                            newWorry = item / item
                        else:
                            newWorry = item / monkey["num"]
                newWorry = newWorry // 3
                if newWorry % monkey["divtest"] == 0:
                    monkeys[monkey["tMonkey"]]["items"].append(newWorry)
                else:
                    monkeys[monkey["fMonkey"]]["items"].append(newWorry)
                monkey["inspected"] += 1
            monkey["items"] = list()
    inspected = sorted([monkey["inspected"] for monkey in monkeys], reverse=True)
    print(inspected[0] * inspected[1])


if __name__ == "__main__":
    part1()
