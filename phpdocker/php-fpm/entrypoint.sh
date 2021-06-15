#!/bin/bash
set -e

cat <<EOT > /application/.env
# The environment Craft is currently running in (dev, staging, production, etc.)
ENVIRONMENT=$ENVIRONMENT

# The application ID used to to uniquely store session and cache data, mutex locks, and more
APP_ID=$APP_ID

# The secure key Craft will use for hashing and encrypting data
SECURITY_KEY=$SECURITY_KEY

# The database driver that will be used (mysql or pgsql)
DB_DRIVER=$DB_DRIVER

# The database server name or IP address
DB_SERVER=$DB_SERVER

# The port to connect to the database with
DB_PORT=$DB_PORT

# The name of the database to select
DB_DATABASE=$DB_DATABASE

# The database username to connect with
DB_USER=$DB_USER

# The database password to connect with
DB_PASSWORD=$DB_PASSWORD

# The database schema that will be used (PostgreSQL only)
DB_SCHEMA=public

# The prefix that should be added to generated table names (only necessary if multiple things are sharing the same database)
DB_TABLE_PREFIX=

PRIMARY_SITE_URL=https://app.datatourisme.ma/

EOT


echo "Debug container started waiting for supervisor"

echo "Debug container starting supervisor"

supervisord -c /etc/supervisor/supervisord.conf
