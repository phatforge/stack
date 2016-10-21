#!/bin/bash

latest_ubuntu=$( aws ec2 describe-images  \
        --filter Name=owner-id,Values=099720109477  \
        --query 'Images[? starts_with(ImageLocation, `099720109477/ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server`)] | sort_by(@, & ImageLocation) | [-1] | ImageId'  --out text
)

echo "Please update the source_ami in the packer/base/packer.yml file to upgrade the base amis. The run `make amis` (ensure correct region and profile is used.)"
echo $latest_ubuntu
