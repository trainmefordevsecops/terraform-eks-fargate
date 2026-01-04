terraform {
  backend "s3" {
    bucket         = "tf-state-iac-demo"
    key            = "network/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    use_lockfile = true
  }
}

