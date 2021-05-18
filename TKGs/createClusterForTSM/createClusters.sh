#!/bin/bash
# This scripts creates 2 sets of clusters using the tmc cli
# The Each set is named csuser-0Xa or b
# i.e. csuser-01a and csuser-01b
# 
#
 
### Hard coded variables ###
clusterNameBase="tsm-tkgs"
provisioner="livefire"
management="livefire-cs-sv01"
#clusterNameBase="realylongnameherenow"
clusterGroupName="class-delivery-cg"
k8sVersion="v1.19.7+vmware.1-tkg.1.fc82c41"
frontEnd=fe-01
backEnd=be-01 
###
### Script Body
###
 
set -e
 
## Which Cluster Are we building
echo -n "Which cluster to deploy? (front or back) "
read whichCluster

### Make sure Tanzu Mission Control CLI is installed
type tmc > /dev/null 2>&1
if [ $? -eq 1 ]; then
        echo "It does not look like you have Tanzu Mission Control CLI installed. This script requires 'tmc' to automate Tanzu Mission Control functionality."
        exit 1
fi
 

case $whichCluster in 

    front)
        clusterNameA="$clusterNameBase-$frontEnd"
        #tmc cluster create -t tkgs -n $clusterNameA -g $clusterGroupName --allowed-storage-classes vsphere-with-kubernetes --version $k8sVersion --storage-class vsphere-with-kubernetes --management-cluster-name $management --provisioner-name $provisioner --worker-instance-type best-effort-xlarge --instance-type best-effort-small -q 1
        echo "$clusterNameA is provisioning...";;
    back)     

        clusterNameB="$clusterNameBase-$backEnd"
        #tmc cluster create -t tkgs -n $clusterNameB -g $clusterGroupName --allowed-storage-classes vsphere-with-kubernetes --version $k8sVersion --storage-class vsphere-with-kubernetes --management-cluster-name $management --provisioner-name $provisioner --worker-instance-type best-effort-xlarge --instance-type best-effort-small -q 1
        echo "$clusterNameB is provisioning...";;
    *)
        echo "Only 'front' or 'back' are acceptable: $whichCluster doesn't work try again";;
 esac
###
### Script End
###
