#!/bin/bash

users=($(ls ./Linux/Kernel/))

for index in "${!users[@]}"
do
	cp ./Linux/Vocabulary/${users[$index]}.vxl ./bin/temp/
	
	java -jar ./CharacterCollector2.jar -prop ./termsCounter.properties -vxl ./Linux/Vocabulary/${users[$index]}.vxl
done