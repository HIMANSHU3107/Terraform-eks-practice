# to store the terraform state locally
terraform {
  backend "s3" {
    bucket = "terraform-eks-state"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}