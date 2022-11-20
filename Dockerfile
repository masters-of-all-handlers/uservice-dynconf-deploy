FROM yobasystems/alpine-nginx:latest
COPY route-configs/nginx.conf /etc/nginx/nginx.conf
RUN chmod -R a+r /etc/nginx
