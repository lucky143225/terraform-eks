# Networking Variables
region                     = "ap-south-1"
vpc_cidr_block             = "10.0.0.0/16"
private_subnet_cidr_blocks = ["10.0.0.0/24", "10.0.1.0/24"]
public_subnet_cidr_blocks  = ["10.0.2.0/24", "10.0.3.0/24"]
availability_zones         = ["ap-south-1a", "ap-south-1b"]

# EKS Variables
eks_cluster_name           = "lucky-eks-cluster"
eks_version                = "1.29"
endpoint_private_access    = false
endpoint_public_access     = true
ami_type                   = "AL2_x86_64"
capacity_type              = "ON_DEMAND"
disk_size                  = 20
instance_types             = ["t3.medium"]
pvt_desired_size           = 1
pvt_max_size               = 1
pvt_min_size               = 1
pblc_desired_size          = 1
pblc_max_size              = 1
pblc_min_size              = 1


