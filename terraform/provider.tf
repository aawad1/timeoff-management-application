terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.97.0"
        }
    }
}

provider "aws" {
    region = var.aws_region
    # profile izostavljam (default) jer svakako uzima da je defaultni ako nema nista
}