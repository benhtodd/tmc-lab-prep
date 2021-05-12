#!/bin/bash

rm ./cluster.txt

tmc cluster list -o json -p capacity-test | jq ".clusters[].fullName.name" | sed 's/"//g' > clusters.txt