#!/bin/bash

aws --profile pjnet --region us-east-1 ec2 authorize-security-group-ingress --group-id sg-41671109 --protocol tcp --port 22 --cidr $(curl --silent https://api.ipify.org)/32
aws --profile pjnet --region us-east-1 ec2 authorize-security-group-ingress --group-id sg-41671109 --protocol udp --port 60000-61000 --cidr $(curl --silent https://api.ipify.org)/32

