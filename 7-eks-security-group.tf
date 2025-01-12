resource "aws_security_group" "eks_cluster_sg" {
  name        = "${var.eks_cluster_name}-cluster-sg"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.custom_vpc.id

  tags = {
    Name = "${var.eks_cluster_name}-cluster-sg"
  }
}

resource "aws_security_group_rule" "cluster_inbound" {
  description       = "Allow all inbound traffic from nodes security group"
  from_port         = -1
  to_port           = -1
  protocol          = "-1"
  security_group_id = aws_security_group.eks_cluster_sg.id
  type              = "ingress"
  source_security_group_id = aws_security_group.eks_nodes_sg.id
}

resource "aws_security_group_rule" "cluster_outbound" {
  description       = "Allow all outbound traffic to nodes security group"
  from_port         = -1
  to_port           = -1
  protocol          = "-1"
  security_group_id = aws_security_group.eks_cluster_sg.id
  type              = "egress"
  source_security_group_id = aws_security_group.eks_nodes_sg.id
}
