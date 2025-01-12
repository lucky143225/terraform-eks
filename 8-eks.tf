resource "aws_eks_cluster" "main" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_role.arn
  version  = var.eks_version
  enabled_cluster_log_types = ["api", "audit"]
  

  vpc_config {
    security_group_ids      = [aws_security_group.eks_cluster_sg.id, aws_security_group.eks_nodes_sg.id]
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    subnet_ids = tolist(concat(aws_subnet.private_subnet[*].id))
  }

  # access_config {
  #   authentication_mode                         = "API_AND_CONFIG_MAP"
  #   bootstrap_cluster_creator_admin_permissions = true
  # }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy_attachment,
    aws_iam_role_policy_attachment.eks_service_policy_attachment,
    aws_iam_role_policy_attachment.eks_autoscaler_policy_attachment,
    aws_cloudwatch_log_group.cluster_log
  ]
}

resource "aws_cloudwatch_log_group" "cluster_log" {
  name              = "/aws/eks/${var.eks_cluster_name}/cluster"
  retention_in_days = 7
}
