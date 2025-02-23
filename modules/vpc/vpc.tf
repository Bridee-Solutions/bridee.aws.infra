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
  cidr_block = "10.0.0.0/24"

  tags = {
    IAC = true
    Name = "bridee_public_subnet"
  }
}

resource "aws_subnet" "bridee_private_subnet"{
  vpc_id = aws_vpc.bridee_vpc.id
  cidr_block = "10.0.1.0/28"
  map_public_ip_on_launch = "false"

  tags = {
    IAC = true
    Name = "bridee_private_subnet"
  }
}

resource "aws_internet_gateway" "bridee_internet_gateway" {
  vpc_id = aws_vpc.bridee_vpc.id

  tags = {
   IAC = true
   Name = "bridee_internet_gateway" 
  }
}