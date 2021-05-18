#!/bin/bash

provider=observability
filename=clusters.txt
declare -a listArr
listArr=(`cat "$filename"`)
len=${#listArr[@]}

for (( i = 0 ; i < $len ; i++))
do
    echo "Delete issued on: ${listArr[$i]} "
    tmc cluster delete ${listArr[$i]} -p $provider
done