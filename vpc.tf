resource "aws_vpc" "joohyun-vpc" {
  cidr_block           = "50.0.0.0/22"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "joohyun-vpc"
  }
}