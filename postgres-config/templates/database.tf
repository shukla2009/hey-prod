resource "postgresql_database" "keycloak" {
  name              = "keycloak"
  owner             = "keycloak"
  template          = "template0"
  lc_collate        = "C"
  connection_limit  = -1
  allow_connections = true
}