resource "keycloak_openid_client" "openid_client" {
  realm_id              = keycloak_realm.hey-prod-realm.id
  client_id             = "hey-prod-client"
  name                  = "Hey Prod Client"
  enabled               = true
  access_type           = "CONFIDENTIAL"
  web_origins           = ["*"]
  admin_url             = "/admin"
  valid_redirect_uris   = ["/*"]
  root_url              = "https://kong:9443"
  login_theme           = "keycloak"
  standard_flow_enabled = true
  client_secret         = "rRPEZFMEdh4jrNZY4rlSRwCMrBPuhwCE"
  extra_config = {
    "key1" = "value1"
    "key2" = "value2"
  }
}
