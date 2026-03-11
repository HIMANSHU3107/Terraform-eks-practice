variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "node_group_name" {
  description = "Name of node group"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role for worker nodes"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets where nodes will run"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type for nodes"
  type        = string
  default     = "t3.medium"
}

variable "desired_size" {
  default = 2
}

variable "min_size" {
  default = 1
}

variable "max_size" {
  default = 3
}

variable "environment" {
  default = "dev"
}