#!/bin/bash
source env.sh
mkdir keycloak-db
mkdir data
docker-compose pull
docker-compose down
docker-compose up -d --remove-orphans
