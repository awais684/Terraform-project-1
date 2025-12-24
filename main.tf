

data "aws_secretsmanager_secret_version" "database_password" {
  secret_id = "my-database-password-johndoe"
}

resource "aws_db_instance" "my_secret_db" {
  identifier        = "rds-db-instance"
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "8.0.43"
  instance_class    = "db.t3.micro"
  username          = "admin"
  password          = data.aws_secretsmanager_secret_version.database_password.secret_string  # Using the retrieved secret value
}