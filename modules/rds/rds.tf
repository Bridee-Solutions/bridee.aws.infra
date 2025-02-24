resource "aws_db_instance" "bridee_db"{
  instance_class = "db.t3.micro"
  engine = "mysql"
  allocated_storage = 10
  username = var.db_username
  password = var.db_password
}