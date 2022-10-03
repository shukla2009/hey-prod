FROM quay.io/keycloak/keycloak:latest as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_FEATURES=token-exchange
ENV KC_DB=postgres
# Install custom providers
RUN curl -sL https://github.com/aerogear/keycloak-metrics-spi/releases/download/2.5.3/keycloak-metrics-spi-2.5.3.jar -o /opt/keycloak/providers/keycloak-metrics-spi-2.5.3.jar
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak
ARG SERVER_P12
ARG SERVER_P12_PWD
ARG CA_ROOT
RUN curl -L https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar \
  -o /tmp/opentelemetry-javaagent.jar

COPY $SERVER_P12 .
COPY $CA_ROOT .
# for demonstration purposes only, please make sure to use proper certificates in production instead
# RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1,DNS:keycloak" -keystore conf/server.keystore
# change these values to point to a running postgres instance
RUN keytool -importkeystore \
    -deststorepass password \
    -destkeypass password \
    -destkeystore conf/server.keystore \
    -srckeystore $SERVER_P12 \
    -srcstoretype PKCS12 \
    -srcstorepass $SERVER_P12_PWD \
    -alias server

USER root
RUN keytool -import -alias rootca \
    -cacerts \
    -storepass changeit \
    -file $CA_ROOT \
    -noprompt
USER keycloak


ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
