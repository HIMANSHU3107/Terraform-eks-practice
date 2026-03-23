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
Description: Private API Gateway Custom Domain with VPC Endpoint Association

Parameters:
  DomainName:
    Type: String
    Description: Custom domain name (e.g., api.internal.example.com)

  CertificateArn:
    Type: String
    Description: ACM Certificate ARN (must be in same region)

  VpcEndpointId:
    Type: String
    Description: VPC Interface Endpoint ID (execute-api)

Resources:

  PrivateApiCustomDomain:
    Type: AWS::ApiGateway::DomainName
    Properties:
      DomainName: !Ref DomainName
      EndpointConfiguration:
        Types:
          - PRIVATE
      RegionalCertificateArn: !Ref CertificateArn
      SecurityPolicy: TLS_1_2

  DomainAccessAssociation:
    Type: AWS::ApiGateway::DomainNameAccessAssociation
    Properties:
      DomainNameArn: !GetAtt PrivateApiCustomDomain.DomainNameArn
      AccessAssociationSource: !Ref VpcEndpointId
      AccessAssociationSourceType: VPCE

Outputs:

  DomainNameArn:
    Description: ARN of the Private Custom Domain
    Value: !GetAtt PrivateApiCustomDomain.DomainNameArn

  DomainName:
    Description: Custom Domain Name
    Value: !Ref DomainName
