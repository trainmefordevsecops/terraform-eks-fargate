locals {
  project_name            = "myekscluster"
  cluster_version         = "1.31"
  aws_region              = "ap-southeast-1"

  vpc_id     = data.terraform_remote_state.network.outputs.vpc_id
  private_subnet_ids = data.terraform_remote_state.network.outputs.private_subnets

  tags = {
    Project    = local.project_name
    GithubRepo = "terraform-aws-eks"
    GithubOrg  = "terraform-aws-modules"
  }
}

################################################################################
# Remote State of Network
################################################################################

data "terraform_remote_state" "network" {
  backend = "local"
  config = {
    path = "../vpc/terraform.tfstate"
  }
}

