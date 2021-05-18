#!/bin/bash

rm ./clusters.txt

tmc cluster list -o json -p observability | jq ".clusters[].fullName.name" | sed 's/"//g' > clusters.txt