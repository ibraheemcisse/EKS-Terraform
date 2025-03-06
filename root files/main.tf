terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# IAM Module
module "iam" {
  source = "./modules/iam"
}

# VPC Module
module "vpc" {
  source   = "./modules/vpc"
  region   = var.region
  vpc_cidr = "172.31.0.0/16"
}

# EKS Module
module "eks" {
  source            = "./modules/eks"
  cluster_name      = "my-eks-cluster"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.private_subnets
  security_group_id = module.vpc.security_group_id
  role_arn          = module.iam.eks_role_arn
}

