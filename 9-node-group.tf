# Nodes in private subnets
resource "aws_eks_node_group" "private" {
  cluster_name    = aws_eks_cluster.main.id
  version         = var.eks_version
  node_group_name = "${var.eks_cluster_name}-node-private"
  node_role_arn   = aws_iam_role.eks_nodes.arn 
  subnet_ids      = [for subnet in aws_subnet.private_subnet : subnet.id]

  ami_type       = var.ami_type
  disk_size      = var.disk_size
  instance_types = var.instance_types
  capacity_type  = var.capacity_type

  scaling_config {
    desired_size = var.pvt_desired_size
    max_size     = var.pvt_max_size
    min_size     = var.pvt_min_size
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
    Name = "${var.eks_cluster_name}-node-private"
  }

  labels = {
    role = "eks-nodes-${var.eks_cluster_name}"
  }

  depends_on = [
    aws_iam_role_policy_attachment.aws_eks_worker_node_policy,
    aws_iam_role_policy_attachment.aws_eks_cni_policy,
    aws_iam_role_policy_attachment.ec2_ecr,
    aws_iam_role_policy_attachment.ebs_access
  ]
}

# Nodes in public subnet
# resource "aws_eks_node_group" "public" {
#   cluster_name    = aws_eks_cluster.main.id
#   version         = var.eks_version
#   node_group_name = "${var.eks_cluster_name}-node-public"
#   node_role_arn   = aws_iam_role.eks_nodes.arn  
#   subnet_ids      = [for subnet in aws_subnet.public_subnet : subnet.id]

#   ami_type       = var.ami_type
#   disk_size      = var.disk_size
#   instance_types = var.instance_types
#   capacity_type  = var.capacity_type

#   scaling_config {
#     desired_size = var.pblc_desired_size
#     max_size     = var.pblc_max_size
#     min_size     = var.pblc_min_size
#   }
 
#   update_config {
#     max_unavailable = 1
#   } 

#   tags = {
#     Name = "${var.eks_cluster_name}-node-public"
#   }
  
#   labels = {
#     role = "eks-nodes-${var.eks_cluster_name}"
#   }

#   depends_on = [
#     aws_iam_role_policy_attachment.aws_eks_worker_node_policy,
#     aws_iam_role_policy_attachment.aws_eks_cni_policy,
#     aws_iam_role_policy_attachment.ec2_read_only,
#     aws_iam_role_policy_attachment.ebs_access
#   ]
# }
