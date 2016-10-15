
# NOTE Use nginx:alpine after development and testing. Alpine is much smaller.
# FROM nginx:alpine

FROM nginx

COPY ./index.html /usr/share/nginx/html
COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/f22.conf /etc/nginx/conf.d/

