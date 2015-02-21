#!/bin/bash
aws --profile pjnet s3 sync ~/Downloads/lols/ s3://tedder/lols/ --recursive --exclude "*.sh" --acl public-read --cache-control "max-age=3600,public"
