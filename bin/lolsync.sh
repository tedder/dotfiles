#!/bin/bash
aws --profile pjnet s3 sync /home/ted/Dropbox/pix/lols/ s3://tedder/lols/ --exclude "*.sh" --acl public-read --cache-control "max-age=3600,public"
