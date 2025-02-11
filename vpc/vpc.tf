resource "aws_vpc" "bridee_vpc"{
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    IAC = true
    Name = "bridee_vpc"
  }
}