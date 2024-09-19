resource "aws_secretsmanager_secret" "rds_password" {
  name = "rds-db-password"
}

resource "aws_secretsmanager_secret_version" "rds_password" {
  secret_id     = aws_secretsmanager_secret.rds_password.id
  secret_string = "YourSecurePassword"
}
