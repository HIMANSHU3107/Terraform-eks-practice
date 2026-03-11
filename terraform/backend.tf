# to store the terraform state locally
terraform {
  backend "s3" {
    bucket = "eks-terraform-state-bucket"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}