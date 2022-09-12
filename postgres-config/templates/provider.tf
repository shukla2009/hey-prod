
terraform {
  required_version = ">= 1.2.3"
  required_providers {
    postgresql = { # This line is what needs to change.
      source = "cyrilgdn/postgresql"
      version = "1.17.1"
    }
  }
}

provider "postgresql" {
  host            = var.db_host
  port            = var.db_port
  database        = "postgres"
  username        = var.db_admin_username
  password        = var.db_admin_password
  sslmode         = "disable"
  connect_timeout = 15
}