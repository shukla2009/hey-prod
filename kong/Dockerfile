
FROM kong:3.0.0-alpine

ENV OIDC_PLUGIN_VERSION=1.2.3-2
ENV JWT_PLUGIN_VERSION=1.1.0-1
ENV GIT_VERSION=2.24.4-r0
ENV UNZIP_VERSION=6.0-r7
ENV LUAROCKS_VERSION=2.4.4-r1

ARG SERVER_CRT
ARG SERVER_KEY
ARG KC_CLIENT_ID
ARG KC_CLIENT_PWD
ARG KC_JAEGER_CLIENT_ID
ARG KC_JAEGER_CLIENT_PWD
ARG KC_HOST
ARG KC_PORT
ARG KC_REALM

USER root
RUN apk update && apk add git unzip luarocks gettext
RUN luarocks install lua-resty-string
RUN luarocks install lua-resty-openidc

ENV KC_CLIENT_ID=${KC_CLIENT_ID}
ENV KC_CLIENT_PWD=${KC_CLIENT_PWD}
ENV KC_JAEGER_CLIENT_ID=${KC_JAEGER_CLIENT_ID}
ENV KC_JAEGER_CLIENT_PWD=${KC_JAEGER_CLIENT_PWD}
ENV KC_HOST=${KC_HOST}
ENV KC_PORT=${KC_PORT}
ENV KC_REALM=${KC_REALM}

COPY ./kong.tpl.yaml /kong.tpl.yaml
RUN envsubst < kong.tpl.yaml > kong.yaml
COPY ./${SERVER_CRT} /certs/
COPY ./${SERVER_KEY} /certs/
RUN mkdir -p /usr/local/kong-oidc/kong
COPY --chown=kong:root ./plugins /usr/local/kong-oidc/kong/plugins

USER kong