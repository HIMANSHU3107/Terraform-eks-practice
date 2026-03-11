module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
}

module "nodegroup" {
  source          = "./modules/nodegroup"
  cluster_name    = module.eks.cluster_name
  node_instance_type = var.node_instance_type
}