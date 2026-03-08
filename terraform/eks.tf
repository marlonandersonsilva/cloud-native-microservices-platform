module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  vpc_id = aws_vpc.main_vpc.id

  subnet_ids = [
    aws_subnet.subnet_a.id,
    aws_subnet.subnet_b.id
  ]
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = false


  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {

    default = {

      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t3.small"]

    }

  }

}
