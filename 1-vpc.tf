resource "aws_vpc" "custom_vpc" {

  cidr_block       = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.eks_cluster_name}-vpc"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}