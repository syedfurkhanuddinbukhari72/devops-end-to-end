terraform {
  backend "s3" {
    bucket = "syed-devops-tfstate-001"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
