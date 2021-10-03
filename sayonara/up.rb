require 'securerandom'

# generate passwords
lava_password = SecureRandom.hex
`sed -i".bk" "s/{lava_password}/#{lava_password}/g" sayonara/bot/.env`
`sed -i".bk" "s/{lava_password}/#{lava_password}/g" sayonara/lavalink/application.yml`

# start app
`docker compose -f sayonara/docker-compose.yml up --detach`

# erase passwords
`mv sayonara/bot/.env.bk sayonara/bot/.env`
`mv sayonara/lavalink/application.yml.bk sayonara/lavalink/application.yml`
