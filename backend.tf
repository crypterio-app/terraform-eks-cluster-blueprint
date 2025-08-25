
terraform {
  backend "s3" {
    bucket = "eks-cluster-dev01" # Specify the name of the S3 bucket to store the state file
    region = "us-west-2"
    key = "eks/terraform.tfstate"
  }
}

