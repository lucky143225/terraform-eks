output "vpc" {
  value = aws_vpc.custom_vpc.id
}

output "nat-id" {
  value = aws_nat_gateway.main.id
}

output "IGW-id" {
  value = aws_internet_gateway.igw.id
}

output "eip-id" {
  value = aws_eip.main.id
}

output "public-subnets-ids" {
  value = tolist(aws_subnet.public_subnet[*].id)
}

output "private-subnets-ids" {
  value = tolist(aws_subnet.private_subnet[*].id)
}

output "public_rt-id" {
  value = aws_route_table.public_rt.id
}

output "private_rt" {
  value = aws_route_table.private_rt.id
}

output "node_iam_role" {
  value = aws_iam_role.eks_nodes
}

output "cluster_role" {
  value = aws_iam_role.eks_role.id
}

output "eks_cluster_name" {
  value = aws_eks_cluster.main.name
}

output "eks_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}

output "private_node_group" {
  value = aws_eks_node_group.private.id
}

# output "public_node_group" {
#   value = aws_eks_node_group.public.id
# }

output "eks-sg-id" {
  value = aws_security_group.eks_cluster_sg
}

output "node-sg-id" {
  value = aws_security_group.eks_nodes_sg
}

