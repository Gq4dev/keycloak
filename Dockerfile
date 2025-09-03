# Keycloak 20.x for Render.com (pinned to 20.0.5)
FROM quay.io/keycloak/keycloak:20.0.5

# Copy realm to auto-import on first boot
COPY realm-export.json /opt/keycloak/data/import/realm-export.json

# Environment variables must be provided by Render:
# - KEYCLOAK_ADMIN, KEYCLOAK_ADMIN_PASSWORD
# - KC_DB=postgres
# - KC_DB_URL=jdbc:postgresql://<host>:<port>/<db>
# - KC_DB_USERNAME=<user>
# - KC_DB_PASSWORD=<password>
# - KC_HTTP_ENABLED=true
# - KC_HTTP_PORT=${PORT}
# - KC_PROXY=edge
# Optional after first deploy:
# - KC_HOSTNAME=<your-domain>
# NOTE: In 20.x the 'kc.sh' CLI is already used (Quarkus).
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--import-realm"]
