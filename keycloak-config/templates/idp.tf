resource "keycloak_oidc_identity_provider" "hey_prod_identity_provider" {
  realm              = keycloak_realm.hey-prod-realm.id
  alias              = "oidc"
  display_name       = "Hey Prod IDP"
  authorization_url  = "https://keycloak:8443/realms/hey-prod/protocol/openid-connect/auth"
  token_url          = "https://keycloak:8443/realms/hey-prod/protocol/openid-connect/token"
  logout_url         = "https://keycloak:8443/realms/hey-prod/protocol/openid-connect/logout"
  user_info_url      = "https://keycloak:8443/realms/hey-prod/protocol/openid-connect/userinfo"
  jwks_url           = "https://keycloak:8443/realms/hey-prod/protocol/openid-connect/certs"
  hide_on_login_page = true
  client_secret      = "rRPEZFMEdh4jrNZY4rlSRwCMrBPuhwCE"
  client_id          = "hey-prod-client"
  validate_signature = true
  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}
