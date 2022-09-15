resource "keycloak_openid_client" "openid_client" {
  realm_id            = keycloak_realm.hey-prod-realm.id
  client_id           = "hey-prod-client"
  name                = "Hey Prod Client"
  enabled             = true
  access_type         = "CONFIDENTIAL"
#   valid_redirect_uris = ["*"]
  login_theme         = "keycloak"
  extra_config = {
    "key1" = "value1"
    "key2" = "value2"
  }
}
