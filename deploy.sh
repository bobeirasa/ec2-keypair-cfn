#!/bin/sh
aws s3 cp template.yaml s3://freitasrtempfiles
aws s3api put-object-acl --bucket freitasrtempfiles --key template.yaml --acl public-read
sleep 5
aws cloudformation update-stack --stack-name a130945 --template-url 'https://s3.amazonaws.com/freitasrtempfiles/template.yaml' --capabilities 'CAPABILITY_IAM'
