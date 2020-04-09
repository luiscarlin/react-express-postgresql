#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER $db_user WITH ENCRYPTED PASSWORD '$db_password';
    CREATE DATABASE $db_name;
    GRANT ALL PRIVILEGES ON DATABASE $dbname TO $db_user
EOSQL

psql -v ON_ERROR_STOP=1 --username $db_user --dbname $db_name <<-EOSQL
    CREATE TABLE person (
      id serial unique primary key,
      name text,
    );
EOSQL