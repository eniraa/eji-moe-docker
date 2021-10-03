require 'securerandom'

lava_password = SecureRandom.hex
p lava_password
`sed -i ".bk" "s/{lava_password}/#{lava_password}/g" sayonara/bot/.env`
`sed -i ".bk" "s/{lava_password}/#{lava_password}/g" sayonara/lavalink/application.yml`

`docker compose -f sayonara/docker-compose.yml up --detach`
