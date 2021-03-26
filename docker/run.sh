source env.sh
mkdir keycloak-db
mdkir data
docker-compose pull
docker-compose down
docker-compose up -d --remove-orphans