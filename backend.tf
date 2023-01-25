provider "aws" {
   region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraformprj1"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}