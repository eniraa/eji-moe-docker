FROM nginx:1-alpine

WORKDIR /etc/nginx

EXPOSE 80
EXPOSE 443

COPY config /etc/nginx/
COPY /var/www/_letsencrypt /var/www/_letsencrypt

RUN chown nginx /var/www/_letsencrypt && \
    nginx -t && rc-service nginx start
