resource "aws_eks_node_group" "node_group" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  instance_types = [var.instance_type]

  capacity_type = "ON_DEMAND"

  tags = {
    Name        = var.node_group_name
    Environment = var.environment
  }
}

# This  creates worker nodes for  EKS cluster.

# Flow:
# Terraform
#    ↓
# Creates EKS Cluster
#    ↓
# Nodegroup Module
#    ↓
# Creates EC2 Worker Nodes
#    ↓
# Nodes join Kubernetes cluster
#    ↓
# Pods run on these nodes