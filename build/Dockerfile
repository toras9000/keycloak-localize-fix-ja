ARG KEYCLOAK_VERSION=base-image-tag
FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION} AS original


FROM openjdk AS localizer

COPY ./assets/localize  /localize
ARG KEYCLOAK_VERSION
COPY --from=original  "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-account-ui-${KEYCLOAK_VERSION}.jar"  "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-account-ui-${KEYCLOAK_VERSION}.jar" 
COPY --from=original  "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-admin-ui-${KEYCLOAK_VERSION}.jar"    "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-admin-ui-${KEYCLOAK_VERSION}.jar" 
COPY --from=original  "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-themes-${KEYCLOAK_VERSION}.jar"      "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-themes-${KEYCLOAK_VERSION}.jar" 
RUN jar uf "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-account-ui-${KEYCLOAK_VERSION}.jar"  -C "/localize/lib/lib/main/org.keycloak.keycloak-account-ui-${KEYCLOAK_VERSION}"  theme
RUN jar uf "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-admin-ui-${KEYCLOAK_VERSION}.jar"    -C "/localize/lib/lib/main/org.keycloak.keycloak-admin-ui-${KEYCLOAK_VERSION}"    theme
RUN jar uf "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-themes-${KEYCLOAK_VERSION}.jar"      -C "/localize/lib/lib/main/org.keycloak.keycloak-themes-${KEYCLOAK_VERSION}"      theme


FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION}

ARG KEYCLOAK_VERSION
COPY --from=localizer  "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-account-ui-${KEYCLOAK_VERSION}.jar"  "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-account-ui-${KEYCLOAK_VERSION}.jar" 
COPY --from=localizer  "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-admin-ui-${KEYCLOAK_VERSION}.jar"    "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-admin-ui-${KEYCLOAK_VERSION}.jar" 
COPY --from=localizer  "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-themes-${KEYCLOAK_VERSION}.jar"      "/opt/keycloak/lib/lib/main/org.keycloak.keycloak-themes-${KEYCLOAK_VERSION}.jar" 
