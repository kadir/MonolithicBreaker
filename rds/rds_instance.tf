resource "aws_db_instance" "rds_instance" {
  allocated_storage    = 100
  engine               = "mysql"
  instance_class       = "db.m5.large"
  multi_az             = true
  name                 = "bankdb"
  username             = "admin"
  password             = aws_secretsmanager_secret_version.rds_password.secret_string
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.sg_c.id]
}
