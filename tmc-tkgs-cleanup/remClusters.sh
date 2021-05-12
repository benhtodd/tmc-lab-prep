#!/bin/bash

provider=capacity-test
filename=clusters.txt
declare -a myArray
myArray=(`cat "$filename"`)

for (( i = 0 ; i < 9 ; i++))
do
    echo "Delete issued on: ${myArray[$i]} "
    tmc cluster delete ${myArray[$i]} -p $provider
done