resource "aws_db_instance" "bridee_db"{
  instance_class = "db.t3.micro"
  engine = "mysql"
  allocated_storage = 10
  username = var.db_username
  password = var.db_password
  engine_version = "8.4"
  identifier = "bridee"
  storage_type = "gp2"
  
  //todo: associar ao security group
  db_subnet_group_name = aws_db_subnet_group.bridee_db_subnet_group.name

  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "bridee_db_subnet_group"{
  name = "bridee_db_subnet_group"
  subnet_ids = [var.private_subnet_id, var.public_subnet_id]

  tags = {
    Name = "bridee_db_subnet_group",
    IAC = true
  }
}

