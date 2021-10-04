FROM nginx:1-alpine

WORKDIR /etc/nginx

EXPOSE 80
EXPOSE 443

COPY config /etc/nginx/

RUN mkdir -p /var/www/_letsencrypt && \
    chown nginx /var/www/_letsencrypt && \
    apk add --no-cache certbot && \
    certbot certonly --standalone -d eji.moe --email info@eji.moe -w /var/www/_letsencrypt -n --agree-tos --force-renewal && \
    echo -e '#!/bin/bash\nnginx -t && rc-service nginx reload' | sudo tee /etc/letsencrypt/renewal-hooks/post/nginx-reload.sh && \
    chmod a+x /etc/letsencrypt/renewal-hooks/post/nginx-reload.sh && \
    nginx -t && rc-service nginx start
