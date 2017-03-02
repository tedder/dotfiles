#!/bin/bash

aws --profile pjnet --region us-west-2 ec2 authorize-security-group-ingress --group-id sg-eb3d3e8e --protocol tcp --port 22 --cidr $(curl --silent https://api.ipify.org)/32
aws --profile pjnet --region us-west-2 ec2 authorize-security-group-ingress --group-id sg-eb3d3e8e --protocol udp --port 60000-61000 --cidr $(curl --silent https://api.ipify.org)/32

