#!/bin/bash

users=($(ls ./Linux/Kernel/))

for index in "${!users[@]}"
do
	cp ./Linux/Vocabulary/${users[$index]}.vxl ./bin/temp/
	python XML_breaker.py ./bin/temp/${users[$index]}.vxl c-file 200
	rm -f ./bin/temp/${users[$index]}.vxl
	./TermsCounter -prop ./termsCounter.properties -vxl "./Linux/Vocabulary/${users[$index]}.vxl" -csv "./Linux/TermsCounter/${users[$index]}.csv" -txt "./Linux/TermsCounter/${users[$index]}.txt"
	
	cp ./Linux/Vocabulary/${users[$index]}.vxl ./bin/temp/
	python XML_breaker.py ./bin/temp/${users[$index]}.vxl c-file 200
	rm -f ./bin/temp/${users[$index]}.vxl
	
	./TermsCounter -prop ./termsCounterComments.properties -vxl "./Linux/Vocabulary/${users[$index]}.vxl" -csv "./Linux/TermsCounter/${users[$index]}comments.csv" -txt "./Linux/TermsCounter/${users[$index]}comments.txt"
	
	cp ./Linux/Vocabulary/${users[$index]}.vxl ./bin/temp/
	python XML_breaker.py ./bin/temp/${users[$index]}.vxl c-file 200
	rm -f ./bin/temp/${users[$index]}.vxl
	./TermsCounter -prop ./termsCounterClean.properties -vxl "./Linux/Vocabulary/${users[$index]}.vxl" -csv "./Linux/TermsCounter/${users[$index]}clean.csv" -txt "./Linux/TermsCounter/${users[$index]}clean.txt"

	cp ./Linux/Vocabulary/${users[$index]}.vxl ./bin/temp/
	python XML_breaker.py ./bin/temp/${users[$index]}.vxl c-file 200
	rm -f ./bin/temp/${users[$index]}.vxl
	./TermsCounter -prop ./termsCounterNoCall.properties -vxl "./Linux/Vocabulary/${users[$index]}.vxl" -csv "./Linux/TermsCounter/${users[$index]}NoCall.csv" -txt "./Linux/TermsCounter/${users[$index]}NoCall.txt"

done