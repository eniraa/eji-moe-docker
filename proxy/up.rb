# create certificates
`mkdir -p /var/www/_letsencrypt`
`apk add certbot`
`certbot certonly --standalone -d eji.moe --email info@eji.moe -w /var/www/_letsencrypt -n --agree-tos --force-renewal`
`echo -e '#!/bin/sh\nnginx -t && rc-service nginx reload' | sudo tee /etc/letsencrypt/renewal-hooks/post/nginx-reload.sh`
`chmod a+x /etc/letsencrypt/renewal-hooks/post/nginx-reload.sh`

# start app
`docker-compose -f proxy/docker-compose.yml up --detach`
