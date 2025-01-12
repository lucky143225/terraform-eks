# Create IGW for the public subnets
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.custom_vpc.id}"

  tags = {
    Name = "${var.eks_cluster_name}-igw"
  }
}

# Create Elastic IP
resource "aws_eip" "main" {
  vpc = true
  tags = {
    Name = "${var.eks_cluster_name}-eip"
  }
  
}

# Create NAT Gateway
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.private_subnet[0].id

  tags = {
    Name = "${var.eks_cluster_name}-nat-gateway"
  }
  depends_on = [aws_internet_gateway.igw]
}
