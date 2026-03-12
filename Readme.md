# EKS Terraform Microservice Deployment

This repository is a learning exercise created to practice Terraform structure for EKS/Kubernetes deployments.

## Architecture

Terraform provisions:

- VPC
- Subnets
- EKS cluster
- Managed node group

Kubernetes deploys:

- Namespace
- Application Deployment
- Service (LoadBalancer)
- Ingress

## Tech Stack

- AWS EKS
- Terraform
- Kubernetes
- Docker

## Project Structure

terraform/ -> Infrastructure as Code
kubernetes/ -> Kubernetes manifests
app/ -> Sample containerized application
scripts/ -> Deployment scripts

## Deployment Steps

1. Initialize Terraform

terraform init

2. Plan Infrastructure
terraform plan

3. Apply Infrastructure
terraform apply

4. Deploy application
kubectl apply -f kubernetes/


## Outcome

Application will be accessible via AWS LoadBalancer created by Kubernetes service.


Folder structure

```
Terraform-eks-practice
│
├── README.md
├── .gitignore
│
├── terraform
│   ├── backend.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── main.tf
│   ├── terraform.tfvars
│
│   ├── modules
│   │   ├── vpc
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   └── outputs.tf
│   │   │
│   │   ├── eks
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   └── outputs.tf
│   │   │
│   │   └── nodegroup
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       └── outputs.tf
│
├── kubernetes
│   ├── namespace.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│
├── app
│   ├── Dockerfile
│   ├── package.json
│   └── server.js
│
└── scripts
    ├── deploy.sh
    └── destroy.sh
```
