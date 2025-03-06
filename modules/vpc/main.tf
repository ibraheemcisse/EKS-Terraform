module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "eks-vpc"
  cidr = var.vpc_cidr

  azs             = var.availability_zones  # AZs are passed dynamically
  private_subnets = [cidrsubnet(var.vpc_cidr, 4, 1), cidrsubnet(var.vpc_cidr, 4, 2), cidrsubnet(var.vpc_cidr, 4, 3)]
  public_subnets  = [cidrsubnet(var.vpc_cidr, 4, 4), cidrsubnet(var.vpc_cidr, 4, 5), cidrsubnet(var.vpc_cidr, 4, 6)]

  enable_dns_hostnames = true
  enable_dns_support   = true
}


resource "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"

  tags = {
    Name = "eks-vpc"
  }
}

resource "aws_subnet" "private" {
  count = 2

  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(["172.31.1.0/24", "172.31.2.0/24"], count.index)
  availability_zone       = element(["us-east-1a", "us-east-1b"], count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "eks-private-subnet-${count.index}"
  }
}

resource "aws_security_group" "main" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-sg"
  }
}
