#!/bin/bash

# Start Keycloak
cd ~/buch/.extras/compose/keycloak
docker-compose up -d

if [ $? -eq 0 ]; then
  echo "[SUCCESS] Keycloak container started successfully."
else
  echo "[ERROR] Failed to start Keycloak container."
  exit 1
fi

# Start NestJS Server
cd ~/buch
docker-compose up

if [ $? -eq 0 ]; then
  echo "[SUCCESS] NestJS container started successfully."
else
  echo "[ERROR] Failed to start NestJS server."
  exit 1
fi
