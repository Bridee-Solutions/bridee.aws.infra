resource "aws_vpc" "bridee_vpc"{
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    IAC = true
    Name = "bridee_vpc"
  }
}

resource "aws_subnet" "bridee_public_subnet"{
  vpc_id = aws_vpc.bridee_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    IAC = true
    Name = "bridee_public_subnet"
  }
}