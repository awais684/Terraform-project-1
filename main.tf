resource "aws_s3_bucket" "example" {
  bucket = "my-unique-bucket-name-12345"  # change this to a unique name
  acl    = "private"

  versioning {
    enabled = true
  }

  # Block public access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

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
