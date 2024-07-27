#!/bin/bash

# Stop NestJS Server
cd ~/buch
docker-compose down

if [ $? -eq 0 ]; then
  echo "[SUCCESS] NestJS container stopped successfully."
else
  echo "[ERROR] Failed to stop NestJS container."
  exit 1
fi

# Stop Keycloak
cd ~/buch/.extras/compose/keycloak
docker-compose down

if [ $? -eq 0 ]; then
  echo "[SUCCESS] Keycloak container stopped successfully."
else
  echo "[ERROR] Failed to stop Keycloak container."
  exit 1
fi
