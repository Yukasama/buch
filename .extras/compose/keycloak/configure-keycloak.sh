#!/bin/bash

# Keycloak server URL and admin credentials
KEYCLOAK_URL="http://localhost:8080"
ADMIN_USER="admin"
ADMIN_PASSWORD="p"
REALM_NAME="acme"
CLIENT_ID="buch-client"
USER_ADMIN="admin"
USER_PASSWORD="p"
USER_EMAIL="admin@acme.com"
USER="user"
USER_PASSWORD_USER="p"
USER_EMAIL_USER="user@acme.com"

# Authenticate with Keycloak
/opt/keycloak/bin/kcadm.sh config credentials --server $KEYCLOAK_URL --realm master --user $ADMIN_USER --password $ADMIN_PASSWORD

# Create a new realm
/opt/keycloak/bin/kcadm.sh create realms -s realm=$REALM_NAME -s enabled=true

# Configure realm settings (Sessions and Tokens)
/opt/keycloak/bin/kcadm.sh update realms/$REALM_NAME -s 'ssoSessionIdleTimeout=3600'
/opt/keycloak/bin/kcadm.sh update realms/$REALM_NAME -s 'accessTokenLifespan=1800'
/opt/keycloak/bin/kcadm.sh update realms/$REALM_NAME -s 'accessTokenLifespanForImplicitFlow=1800'

# Create a new client
/opt/keycloak/bin/kcadm.sh create clients -r $REALM_NAME -s clientId=$CLIENT_ID -s enabled=true -s 'redirectUris=["https://localhost:3000/*", "https://buch:3000", "https://oauth.pstmn.io/v1/callback"]' -s 'publicClient=false' -s 'directAccessGrantsEnabled=true' -s 'rootUrl=https://localhost:3000'

# Create roles for the client
/opt/keycloak/bin/kcadm.sh create clients/$CLIENT_ID/roles -r $REALM_NAME -s name=admin
/opt/keycloak/bin/kcadm.sh create clients/$CLIENT_ID/roles -r $REALM_NAME -s name=user

# Create realm roles
/opt/keycloak/bin/kcadm.sh create roles -r $REALM_NAME -s name=buch-admin
/opt/keycloak/bin/kcadm.sh create roles -r $REALM_NAME -s name=buch-user

# Associate client roles with realm roles
/opt/keycloak/bin/kcadm.sh add-roles -r $REALM_NAME --rolename buch-admin --cclientid $CLIENT_ID --rolename admin
/opt/keycloak/bin/kcadm.sh add-roles -r $REALM_NAME --rolename buch-user --cclientid $CLIENT_ID --rolename user

# Create users and assign roles
/opt/keycloak/bin/kcadm.sh create users -r $REALM_NAME -s username=$USER_ADMIN -s email=$USER_EMAIL -s enabled=true
/opt/keycloak/bin/kcadm.sh set-password -r $REALM_NAME --username $USER_ADMIN --new-password $USER_PASSWORD --temporary=false
/opt/keycloak/bin/kcadm.sh add-roles -r $REALM_NAME --uusername $USER_ADMIN --rolename buch-admin

/opt/keycloak/bin/kcadm.sh create users -r $REALM_NAME -s username=$USER -s email=$USER_EMAIL_USER -s enabled=true
/opt/keycloak/bin/kcadm.sh set-password -r $REALM_NAME --username $USER --new-password $USER_PASSWORD_USER --temporary=false
/opt/keycloak/bin/kcadm.sh add-roles -r $REALM_NAME --uusername $USER --rolename buch-user

echo "Keycloak configuration completed."
