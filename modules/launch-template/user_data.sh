#!/bin/bash

yum install -y httpd aws-cli
systemctl enable httpd
systemctl start httpd

aws s3 cp s3://${bucket}/index.html /var/www/html/index.html
