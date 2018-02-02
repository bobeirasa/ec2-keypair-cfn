#!/bin/sh
aws s3 cp template.yaml s3://freitasrtempfiles
aws s3api put-object-acl --bucket freitasrtempfiles --key template.yaml --acl public-read
sleep 3
aws cloudformation create-stack --stack-name $(pwgen 8 1) --template-url 'https://s3.amazonaws.com/freitasrtempfiles/template.yaml' --capabilities 'CAPABILITY_IAM'
