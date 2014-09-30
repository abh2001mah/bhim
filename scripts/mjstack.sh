#!/bin/bash

if [ $# -eq 0 ]; then
    echo >&2 "Usage: mjstack  [  [  ] ]"
    echo >&2 "    Defaults: count = 3, delay = 1 (seconds)"
    exit 1
fi

pid=$1          # required
count=${2:-3}  # defaults to 10 times
delay=${3:-1} # defaults to 1 second

while [ $count -gt 0 ]
do
    jstack $pid > $pid.$(date +%H-%M-%S.log)
    sleep $delay
    let count--
done


