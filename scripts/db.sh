#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    create table users (
	id bigint generated always as identity (increment by 1) not null unique,
	email varchar(60) not null unique,
	password varchar(512) not null,
	username varchar(40),
	date_joined TIMESTAMP  DEFAULT current_timestamp not null,
	last_login TIMESTAMP  DEFAULT current_timestamp not null,
	is_admin boolean DEFAULT false  not null,
	is_active boolean DEFAULT false  not null,
	is_staff boolean default false  not null,
	is_superuser boolean default false not null,
	first_name varchar(40),
	last_name varchar(40),
	refresh_token varchar(250),
	primary key(id, email)
);
EOSQL