require 'securerandom'

# generate passwords
pg_password = SecureRandom.hex
`sed -i".bk" "s/{pg_password}/#{pg_password}/g" matrix/synapse/homeserver.yaml`
`sed -i".bk" "s/{pg_password}/#{pg_password}/g" matrix/postgres/init.sql`

# start app
`docker-compose -f matrix/docker-compose.yml up --detach`

# erase passwords
`mv matrix/synapse/homeserver.yaml.bk matrix/synapse/homeserver.yaml`
`mv matrix/postgres/init.sql.bk matrix/postgres/init.sql`
