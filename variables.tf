# Networking Variables

variable "region" {
  type = string
  description = "Region to deploy the cluster"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block range for vpc"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
  description = "CIDR block range for the private subnet"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
  description = "CIDR block range for the public subnet"
}


variable "availability_zones" {
  type  = list(string)
  default = ["us-west-2a", "us-west-2b"]
  description = "List of availability zones for the selected region"
}

# EKS Variables

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type = string
}


variable "endpoint_private_access" {
  type = bool
  default = true
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

variable "endpoint_public_access" {
  type = bool
  default = true
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
}

variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2_x86_64. Valid values: AL2_x86_64, AL2_x86_64_GPU."
  type = string 
  default = "AL2_x86_64"
}

variable "disk_size" {
  description = "Disk size in GiB for worker nodes. Defaults to 20."
  type = number
  default = 20
}

variable "instance_types" {
  type = list(string)
  default = ["t3.medium"]
  description = "Set of instance types associated with the EKS Node Group."
}

variable "pvt_desired_size" {
  description = "Desired number of worker nodes in private subnet"
  default = 1
  type = number
}

variable "pvt_max_size" {
  description = "Maximum number of worker nodes in private subnet."
  default = 1
  type = number
}

variable "pvt_min_size" {
  description = "Minimum number of worker nodes in private subnet."
  default = 1
  type = number
}

variable "pblc_desired_size" {
  description = "Desired number of worker nodes in public subnet"
  default = 1
  type = number
}

variable "pblc_max_size" {
  description = "Maximum number of worker nodes in public subnet."
  default = 1
  type = number
}

variable "pblc_min_size" {
  description = "Minimum number of worker nodes in public subnet."
  default = 1
  type = number
}

variable "eks_version" {
  description = "Version of eks cluster"
  type = string
}

variable "capacity_type" {
  description = "Version of eks cluster"
  type = string
}

