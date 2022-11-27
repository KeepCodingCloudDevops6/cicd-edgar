#!/bin/bash
BUCKET="kc-acme-antonio-prod"
GETSIZE="$(aws s3 ls s3://kc-acme-antonio-prod --recursive --summarize 2> /dev/null | grep Size | awk '{print $3}')"

echo "Tamaño de bucket:" $GETSIZE


if [ $GETSIZE > 20971520 ]
    then
        aws s3 rm s3://$BUCKET --recursive
    else
        echo "Tamaño de bucket es menor a 20Mb"
    fi




