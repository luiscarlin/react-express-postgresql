#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER $DB_USER WITH ENCRYPTED PASSWORD '$DB_PASSWORD';
    CREATE DATABASE $DB_NAME;
    GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER
EOSQL

psql -v ON_ERROR_STOP=1 --username $DB_USER --dbname $DB_NAME <<-EOSQL
    CREATE TABLE person (
      id serial unique primary key,
      name text
    );
EOSQL