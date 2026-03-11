#!/bin/bash

terraform init
terraform plan
terraform apply -auto-approve

kubectl apply -f kubernetes/