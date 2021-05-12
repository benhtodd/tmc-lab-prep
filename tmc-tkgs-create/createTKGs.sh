#!/bin/bash
# This scripts creates 2 sets of clusters using the tmc cli
# The Each set is named csuser-0Xa or b
# i.e. csuser-01a and csuser-01b
# 
#
 
### Hard coded variables ###
clusterNameBase="csuser"
#clusterNameBase="realylongnameherenow"
clusterGroupName="default"
k8sVersion="v1.18.15+vmware.1-tkg.1.600e412"
clusterCount=30  #Set 'clusterCount' to number of clusters to build.
num=01  #Set 'num' to starting/first cluster number, include padded 0s.  eg: 00013
numA=a
numB=b 
### Command line input options ###
read -p "How many students? (30) " clusterCount
read -p "Starting cluster number? 01 " num
 
### Do not change these variables ###
max=$(((10#$num)+clusterCount-1))
 
 
###
### Script Body
###
 
set -e
 
### Make sure Tanzu Mission Control CLI is installed
type tmc > /dev/null 2>&1
if [ $? -eq 1 ]; then
        echo "It does not look like you have Tanzu Mission Control CLI installed. This script requires 'tmc' to automate Tanzu Mission Control functionality."
        exit 1
fi
 
### Loop to create group of TMC clusters
for clusterNum in $(seq -w $num $max)
do
        clusterNameA="$clusterNameBase-$clusterNum$numA"
        tmc cluster create -t tkgs -n $clusterNameA -g $clusterGroupName --allowed-storage-classes vsphere-with-kubernetes --version $k8sVersion --storage-class vsphere-with-kubernetes --management-cluster-name livefire-cs-sv01 --provisioner-name capacity-test --worker-instance-type best-effort-xlarge --instance-type best-effort-small -q 1
        echo "$clusterNameA is provisioning..."

        clusterNameB="$clusterNameBase-$clusterNum$numB"
        tmc cluster create -t tkgs -n $clusterNameB -g $clusterGroupName --allowed-storage-classes vsphere-with-kubernetes --version $k8sVersion --storage-class vsphere-with-kubernetes --management-cluster-name livefire-cs-sv01 --provisioner-name capacity-test --worker-instance-type best-effort-xlarge --instance-type best-effort-small -q 1
        echo "$clusterNameB is provisioning..."
done
 
###
### Script End
###
