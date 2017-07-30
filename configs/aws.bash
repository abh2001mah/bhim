#!/bin/bash

function s3dp() {
  export AWS_DEFAULT_PROFILE="$1"
  echo $AWS_DEFAULT_PROFILE
}

function gbp() {
    if [[ $# -eq 0 ]] ; then
        echo 'gbp bucket-name'
        return
    fi
    aws s3api get-bucket-policy --bucket $1
}

function dbp() {
    if [[ $# -eq 0 ]] ; then
        echo 'dbp bucket-name'
        return
    fi
    aws s3api delete-bucket-policy --bucket $1
}

function pbp() {
    if [[ $# -eq 0 ]] ; then
        echo 'pbp bucket-name ~/scm/c26/server/cloudflare/bucket-policy/cube-and-cf-all.json'
        return
    fi
    rm -rf /tmp/bucket-policy.json
    sed "s/bucketname/$1/g" $2 > /tmp/bucket-policy.json
		region=`aws s3api get-bucket-location --bucket $1`
		echo "bucket=$1, region=$region"
    aws s3api put-bucket-policy --region $region --bucket $1 --policy file:///tmp/bucket-policy.json
}
