resource "postgresql_role" "keycloak" {
  name             = "keycloak"
  replication      = true
  login            = true
  connection_limit = 3
  password         = var.db_keycloak_password
}