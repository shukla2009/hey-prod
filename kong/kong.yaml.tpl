_format_version: "3.0"
_transform: true

services:
- name: hey-prod-service
  url: https://example.com
  tags:
  - hey-prod
  routes:
  - name: default-route
    paths:
    - /*
  # plugins:
  # - name: oidc
  # - name: key-auth

routes:
- name: default-route
  service: hey-prod-service
  hosts: ["localhost","kong"]

# consumers:
# - username: hey-prod-user
#   keyauth_credentials:
#   - key: hey-prod-user-key
#   plugins:
#   - name: rate-limiting
#     _comment: "these are default rate-limits for user example-user"
#     config:
#       policy: local
#       second: 5
#       hour: 10

plugins:
- name: rate-limiting
  service: hey-prod-service
  _comment: "example-user is extra limited when using another-service"
  config:
    minute: 10
    limit_by: ip
- name: oidc
  service: hey-prod-service
  config:
    client_id: ${KC_CLIENT_ID}
    client_secret: ${KC_CLIENT_PWD}
    realm: ${KC_REALM}
    discovery: https://${KC_HOST}:${KC_PORT}/realms/${KC_REALM}/.well-known/openid-configuration # OpenID Endpoint Configuration Copied
    scope: openid
- name: opentelemetry
  config: 
    endpoint: http://otel:4318/v1/traces