Get "clean" list of clusters to delete exported to a txt file.

```
tmc cluster list -o json -p capacity-test | jq ".clusters[].fullName.name" | sed 's/"//g' > clusters.txt
```

```
tmc clustergroup list -o json | jq ".clusterGroups[].fullName.name" | sed 's/"//g' > clusterGrps.txt
```


```
tmc workspace list -o json | jq ".workspaces[].fullName.name" | sed 's/"//g' > workspaces.txt
```

Get a list of any PVCs left behind

```
k get pvc -o json -n observability | jq ".items[].metadata.name" | sed 's/"//g' > observePVC.txt

```




```
tmc clustergroup list -o json | jq ".clusterGroups[].fullName.name | select (.clusterGroups[].meta.labels.class=bespin)"
```

