
terraform {
  required_version = ">= 1.2.3"
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "3.11.0-rc.0"
    }
  }
}

provider "keycloak" {
  client_id                = "admin-cli"
  username                 = var.kc_admin_username
  password                 = var.kc_admin_password
  tls_insecure_skip_verify = true
  base_path                = ""
  url                      = "https://${var.kc_host}:${var.kc_port}"
}
