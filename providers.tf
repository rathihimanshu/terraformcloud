provider "aws" {
  region = var.region
  access_key = var.access
  secret_key = var.secret
}
terraform {
  backend "remote" {
    organization = "terraformtestnew"
    workspaces {
      name = "terraformcloud"
    }
  }
  }