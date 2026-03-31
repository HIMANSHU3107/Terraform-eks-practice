module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source = "./modules/eks"

  cluster_name = var.cluster_name
  subnet_ids   = module.vpc.private_subnets
}

module "nodegroup" {
  source = "./modules/nodegroup"

  cluster_name    = module.eks.cluster_name
  node_group_name = "demo-node-group"
  node_role_arn   = aws_iam_role.node_role.arn
  subnet_ids      = module.vpc.private_subnets

  instance_type = "t3.medium"

  desired_size = 2
  min_size     = 1
  max_size     = 3
}



AWSTemplateFormatVersion: '2010-09-09'
Description: Private Custom Domain for API Gateway HTTP API

Parameters:
  DomainName:
    Type: String
    Description: Custom domain name

  CertificateArn:
    Type: String
    Description: ACM Certificate ARN

Resources:

  PrivateDomain:
    Type: AWS::ApiGatewayV2::DomainName
    Properties:
      DomainName: !Ref DomainName

      IpAddressType: dualstack

      DomainNameConfigurations:
        - CertificateArn: !Ref CertificateArn
          EndpointType: PRIVATE
          SecurityPolicy: TLS_1_2   # safer default

Outputs:
  DomainName:
    Value: !Ref PrivateDomain
