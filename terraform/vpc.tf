resource "aws_vpc" "awad-vpc-tf" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"

    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = "Awad-vpc-tf"
    }
}