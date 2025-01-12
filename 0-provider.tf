provider "aws" {
  region = var.region
}

# terraform {
#   # backend "s3" {
#   #   bucket = "eccs-plts-mosaic-iscloud"
#   #   key    = "prod/cap-mosaic-alerts.tfstate"
#   #   region = "us-west-2"
#   #   profile= "dev"
#   # }
#   required_providers {
#     apple = {
#       source  = "terraform.apple.com/hybrid-cloud/apple"
#       version = "~> 1.21"
#     }
#   }
# }