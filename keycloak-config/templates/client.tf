resource "keycloak_openid_client" "openid_client" {
  realm_id              = keycloak_realm.hey-prod-realm.id
  client_id             = var.kc_client_id
  name                  = "Hey Prod Client"
  enabled               = true
  access_type           = "CONFIDENTIAL"
  web_origins           = ["*"]
  admin_url             = "/admin"
  valid_redirect_uris   = ["/*"]
  root_url              = var.kc_client_root_url
  login_theme           = "keycloak"
  standard_flow_enabled = true
  client_secret         = var.kc_client_pwd
}
resource "keycloak_openid_client" "jaeger_openid_client" {
  realm_id              = keycloak_realm.hey-prod-realm.id
  client_id             = var.jaeger_client_id
  name                  = "Jaeger"
  enabled               = true
  access_type           = "CONFIDENTIAL"
  web_origins           = ["*"]
  admin_url             = "/search"
  valid_redirect_uris   = ["/*"]
  root_url              = var.jaeger_client_root_url
  login_theme           = "keycloak"
  standard_flow_enabled = true
  client_secret         = var.jaeger_client_pwd
}
