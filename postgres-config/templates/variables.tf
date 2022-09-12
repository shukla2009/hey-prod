variable "db_host" {
  type = string
  default = "postgres"
}
variable "db_port" {
  type = string
  default = "5432"
}
variable "db_admin_username" {
  type = string
  default = "postgres"
}
variable "db_admin_password" {
  type = string
}
variable "db_keycloak_password" {
  type = string
}
