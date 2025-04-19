#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    SELECT 'CREATE DATABASE inertia_ssr_adapters_dev'
    WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'inertia_ssr_adapters_dev')\gexec

    SELECT 'CREATE DATABASE inertia_ssr_adapters_test'
    WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'inertia_ssr_adapters_test')\gexec

    SELECT 'CREATE DATABASE inertia_ssr_adapters_fake_production'
    WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'inertia_ssr_adapters_fake_production')\gexec
EOSQL

