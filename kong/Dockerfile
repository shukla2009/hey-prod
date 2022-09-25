
FROM kong:3.0.0-alpine

ENV OIDC_PLUGIN_VERSION=1.2.3-2
ENV JWT_PLUGIN_VERSION=1.1.0-1
ENV GIT_VERSION=2.24.4-r0
ENV UNZIP_VERSION=6.0-r7
ENV LUAROCKS_VERSION=2.4.4-r1


USER root
RUN apk update && apk add git unzip luarocks
# RUN luarocks install kong-oidc-auth
# RUN luarocks install kong-plugin-jwt-keycloak
RUN luarocks install lua-resty-string
RUN luarocks install lua-resty-openidc 1.6.1-1

COPY ./kong.yaml /kong.yaml
COPY ./server.crt /certs/
COPY ./server.key /certs/
RUN mkdir -p /usr/local/kong-oidc/kong
COPY --chown=kong:root ./plugins /usr/local/kong-oidc/kong/plugins

USER kong