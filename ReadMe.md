# Setup

## Setup db
1. Change populate: true in src/config/resources/app.yml
2. Create Neondb with extra user buch
3. Set ConnectionString from Neondb to .env on DATABASE_URL
4. Let the server run (so it creates the schema)
5. Change populate: false in src/config/resources/app.yml

## Build Docker Image
docker build --tag juergenzimmermann/buch:2024.04.0-bookworm

## Configure Keycloak
1. Start container with docker compose up in .extras/compose/keycloak
2. Configure keycloak on https://localhost:8443
3. Stop keycloak container with docker compose down

## Run both servers
1. Make sure youre in ~/home
2. Run sh start.sh
3. If you want to stop both servers, do Ctrl-C and sh stop.sh afterwards
