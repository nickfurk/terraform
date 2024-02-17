resource "aws_db_instance" "rds" {
  allocated_storage      = 10
  db_name                = "terraformTestDB"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  username               = "admin"
  password               = "password"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
  db_subnet_group_name   =  aws_db_subnet_group.db_subnet_group.name
  multi_az               = false
}


resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "main"
  subnet_ids = [aws_subnet.subnet_private_db.id, aws_subnet.subnet_private.id]

  tags = {
    Name = "DB subnet group"
  }
}