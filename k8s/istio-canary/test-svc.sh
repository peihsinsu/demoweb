#!/bin/bash

export TOTAL=100

function run() {
for (( i=1; i<=$TOTAL; i++ ))
do
	curl -sS -H "Host: demoweb.arecord.us" http://$INGRESS_HOST:$INGRESS_PORT/test | json .version
	#sleep 0.5
done
}

echo "Start tset..."
export V1=`run | grep v1 | wc -l`

echo "Test Result:"
echo TOTAL: $TOTAL
echo V1 shows $V1
echo V2 shows `expr $TOTAL - $V1`
