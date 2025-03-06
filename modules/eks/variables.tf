variable "cluster_name" {}
variable "vpc_id" {}
variable "subnet_ids" { type = list(string) }  # Changed from subnet_1_id and subnet_2_id
variable "security_group_id" {}
variable "role_arn" {}

