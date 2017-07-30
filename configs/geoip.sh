#!/bin/bash
if [[ $# -eq 0 ]] ; then
    echo 'geoip sample.log 0.01'
    exit 1
fi
if [[ $2 == "" ]] ; then
    echo 'geoip sample.log 0.01'
    exit 1
fi
while read p; do
    data=`echo $p | sed 's/product=ta&//g' | awk -F '[ =&]' '{split($10,a,",");split(a[1],b,"%");split(b[1],c,"+"); print c[1]","$14","$16","$2;}'`
    echo $data
#    IFS=','
#    read -ra ADDR <<< "$data"
#        ipaddr="${ADDR[3]}"
#        country=`curl http://geoip.nekudo.com/api/"$ipaddr" | jq -r '.country.name'`;echo "${ADDR[0]},${ADDR[1]},${ADDR[2]},$country"
#        echo "${ADDR[0]},${ADDR[1]},${ADDR[2]},$ipaddr"
#        sleep $2
done < $1
