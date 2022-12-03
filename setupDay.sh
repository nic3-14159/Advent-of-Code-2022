#!/usr/bin/env bash

dayDir="day$1"
mkdir $dayDir
cp template.py $dayDir/part1.py
curl --user-agent "github.com/nic3-14159/Advent-of-Code-2022/setupDay.sh by $(git config user.email)" \
	-b session=$(cat session.txt) https://adventofcode.com/2022/day/$1/input > $dayDir/input
cd $dayDir
vim -p part1.py input
