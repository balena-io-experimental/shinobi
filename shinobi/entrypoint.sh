#!/bin/bash
set -e

# set the super user account to either the configured details, or the default
ADMIN_EMAIL="${ADMIN_EMAIL:-admin@shinobi.video}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-admin}"
ADMIN_PASSWORD_MD5="$(echo -n "${ADMIN_PASSWORD}" | md5sum | sed -e 's/  -$//')"
jq '.[0].mail = $val' --arg val "${ADMIN_EMAIL}" ./super.sample.json > ./tmp.super.json
jq '.[0].pass = $val' --arg val "${ADMIN_PASSWORD_MD5}" ./tmp.super.json > /config/super.json
rm -f ./tmp.super.json

while ! mysqladmin ping -h"${DB_HOST}" 2>/dev/null
do
    echo "Waiting for connection to mysql server ${DB_HOST} ..."
    sleep 5
done

echo "Initializing database ..."

cat > /home/Shinobi/sql/user.sql <<EOSQL
CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}' ;
GRANT ALL PRIVILEGES ON ccio.* TO '${DB_USER}'@'%' ;
FLUSH PRIVILEGES ;
EOSQL

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -h"${DB_HOST}" -e "source /home/Shinobi/sql/user.sql" || true

/bin/bash /home/Shinobi/Docker/init.sh
exec "$@"