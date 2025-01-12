
#Private subnets
resource "aws_subnet" "private_subnet" {
  count = length(var.availability_zones)
  vpc_id = aws_vpc.custom_vpc.id
  cidr_block = element(var.private_subnet_cidr_blocks, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "${var.eks_cluster_name}-private-subnet}"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
    "kubernetes.io/role/internal-elb" = 1
  }
}

#Public subnets

resource "aws_subnet" "public_subnet" {
  count = length(var.availability_zones)
  vpc_id = "${aws_vpc.custom_vpc.id}"
  cidr_block = element(var.public_subnet_cidr_blocks, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "${var.eks_cluster_name}-public-subnet"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
    "kubernetes.io/role/elb" = 1
  }

  map_public_ip_on_launch = true
}
 