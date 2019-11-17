#!/bin/bash

export SVC_IP=34.92.99.157
export TOTAL=100

function run() {
for (( i=1; i<=$TOTAL; i++ ))
do
	curl ${SVC_IP}/test -sS | json .version
	sleep 0.05
done
}

export V1=`run | grep v1 | wc -l`

echo Current deployment: 
kubectl -n test get deploy

echo ""
echo TOTAL: $TOTAL
echo V1 shows $V1
echo V2 shows `expr $TOTAL - $V1`
