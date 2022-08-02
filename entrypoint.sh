#!/bin/bash
cd /github/workspace
terraform init
terraform plan
sleep 5
terraform apply -auto-approve
