variable "kc_host" {
  type = string
  default = "postgres"
}
variable "kc_port" {
  type = string
  default = "5432"
}
variable "kc_admin_username" {
  type = string
  default = "postgres"
}
variable "kc_admin_password" {
  type = string
}

variable "kc_client_id" {
  type = string
  default = "hey-prod"
}
variable "kc_client_pwd" {
  type = string
}

variable "kc_client_root_url" {
  type = string
}

variable "kc_realm_name" {
  type = string
}

variable "jaeger_client_id" {
  type = string
  default = "jaeger"
}
variable "jaeger_client_pwd" {
  type = string
}

variable "jaeger_client_root_url" {
  type = string
}
