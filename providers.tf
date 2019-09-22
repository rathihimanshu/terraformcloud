provider "aws" {
  region = var.region
}
terraform {
  backend "remote" {
    organization = "terraformtestnew"
    workspaces {
      name = "terraformcloud"
    }
  }
  }