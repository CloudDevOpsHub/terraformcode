provider "aws" {
  region = "ap-south-1"
}

resource "aws_db_instance" "postgres" {
  identifier             = "prod-postgres"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "15"
  instance_class         = "db.t3.micro"

  username               = "admin"
  password               = "ChangeMe123!"

  publicly_accessible    = false
  skip_final_snapshot    = true

  backup_retention_period = 7

  tags = {
    Environment = "prod"
  }
}
