
module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 20.0"
    cluster_name = var.cluster_name
    cluster_version = var.cluster_version

    cluster_endpoint_public_access  = true

    vpc_id = module.my-vpc.vpc_id
    subnet_ids = module.my-vpc.private_subnets

    tags = {
        environment = "development"
        application = "nginx-app"
    }

    eks_managed_node_groups = {
        dev = {
            min_size = 2
            max_size = 6
            desired_size = 2
            instance_types = ["t2.small"]

    }
        prod = {
        min_size       = 2
        desired_size   = 2
        max_size       = 3               
        instance_types = ["t3.medium"]
    }
  }
}
