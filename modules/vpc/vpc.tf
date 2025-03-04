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
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    IAC = true
    Name = "bridee_public_subnet"
  }
}

resource "aws_network_acl" "bridee_public_nacl"{
  vpc_id = aws_vpc.bridee_vpc.id
  subnet_ids = [aws_subnet.bridee_public_subnet.id]

  ingress{
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }

  egress{
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "bridee_public_nacl"
    IAC = true
  }
}

resource "aws_network_acl_association" "bridee_public_nacl_association"{
  network_acl_id = aws_network_acl.bridee_public_nacl.id
  subnet_id = aws_subnet.bridee_public_subnet.id
}

resource "aws_route_table" "bridee_public_route_table"{
  vpc_id = aws_vpc.bridee_vpc.id

  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bridee_internet_gateway.id
  }

  tags = {
    Name = "bridee_public_route_table"
    IAC = true
  }
}

resource "aws_route_table_association" "bridee_route_table_association"{
  subnet_id = aws_subnet.bridee_public_subnet.id
  route_table_id = aws_route_table.bridee_public_route_table.id
}

resource "aws_subnet" "bridee_private_subnet"{
  vpc_id = aws_vpc.bridee_vpc.id
  cidr_block = "10.0.1.0/28"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1b"

  tags = {
    IAC = true
    Name = "bridee_private_subnet"
  }
}

resource "aws_network_acl" "bridee_private_nacl"{
  vpc_id = aws_vpc.bridee_vpc.id
  subnet_ids = [aws_subnet.bridee_private_subnet.id]

  ingress{
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }

  egress{
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "bridee_private_nacl"
    IAC = true
  }
}

resource "aws_network_acl_association" "bridee_private_nacl_association"{
  network_acl_id = aws_network_acl.bridee_private_nacl.id
  subnet_id = aws_subnet.bridee_private_subnet.id
}

resource "aws_eip" "bridee_elastic_ip_nat"{
  domain = "vpc"
}

resource "aws_nat_gateway" "bridee_nat_gateway"{
  subnet_id = aws_subnet.bridee_public_subnet.id
  connectivity_type = "public"
  allocation_id = aws_eip.bridee_elastic_ip_nat.id

  tags = {
    IAC = true
  }
}

resource "aws_route_table" "bridee_private_route_table"{
  vpc_id = aws_vpc.bridee_vpc.id

  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.bridee_nat_gateway.id
  }

  tags = {
    Name = "bridee_private_route_table"
    IAC = true
  }
}

resource "aws_route_table_association" "bridee_private_route_table_association"{
  subnet_id = aws_subnet.bridee_private_subnet.id
  route_table_id = aws_route_table.bridee_private_route_table.id
}

resource "aws_internet_gateway" "bridee_internet_gateway" {
  vpc_id = aws_vpc.bridee_vpc.id

  tags = {
   IAC = true
   Name = "bridee_internet_gateway" 
  }
}