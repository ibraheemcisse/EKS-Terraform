variable "vpc_cidr_block" {}
variable "subnet_1_cidr" {}
variable "subnet_2_cidr" {}
variable "availability_zone_1" {}
variable "availability_zone_2" {}
variable "cluster_name" {}
variable "tags" {
  type = map(string)
}

variable "region" {
  description = "AWS region for the infrastructure"
  type        = string
  default     = "us-east-1"
}
