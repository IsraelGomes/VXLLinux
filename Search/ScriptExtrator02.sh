#!/bin/bash

users=($(ls ./Linux/Kernel/))

for index in "${!users[@]}"
do
	mkdir ./Linux/Extracted/${users[$index]}
	tar -vzxf ./Linux/Kernel/${users[$index]} -C ./Linux/Extracted/${users[$index]}
	find ./Linux/Extracted/${users[$index]} -name "*.h" -type f | wc -l >> tempos.txt
	find ./Linux/Extracted/${users[$index]} -name "*.c" -type f | wc -l >> tempos.txt
	
	rm -fr ./Linux/Extracted/${users[$index]}
done