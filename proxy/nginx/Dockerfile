FROM nginx:1-alpine

WORKDIR /etc/nginx

EXPOSE 80
EXPOSE 443

COPY config /etc/nginx/

# RUN nginx -t && rc-service nginx start
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
