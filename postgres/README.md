# guard-db

Сommon solution for Postgre SQL database

# Enviroments

## Postgre Service

|name|type|description|
|-|-|-|
|POSTGRES_DB|string|Default database name|
|POSTGRES_PORT|string|Default port of postgres service|
|POSTGRES_USER|string|Default database user|
|POSTGRES_PASSWORD|string|Default database user password|

## PGAdmin

|name|type|description|
|-|-|-|
|PGADMIN_DEFAULT_EMAIL|string|User email of PGAdmin account|
|PGADMIN_DEFAULT_PASSWORD|string|Password of PGAdmin account|

# How to start

For start serve PostrgeSQL server and PG Admin run command `docker-compose up`.

# Backup

For backup data run next command:
```
docker exec -it postgres_container pg_dump -Uadmin --column-inserts --data-only postgres > .\data\backup\<data>.sql
```
