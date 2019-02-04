#!/bin/bash

# convert a pod and namespace to the instance_id of the node.

POD=$1
NAMESPACE=$2

cmd="kubectl get pod/$POD --namespace=$NAMESPACE  -o custom-columns=NODE:.spec.nodeName --no-headers"
INTERNAL_IP_NODE=$($cmd)

cmd="kubectl get node $INTERNAL_IP_NODE -o custom-columns=ADDR:.status.addresses[2].address --no-headers"
INSTANCE_ID=$($cmd)

echo $INSTANCE_ID
