FROM tiangolo/nginx-rtmp

COPY server/nginx.conf /etc/nginx/nginx.conf
COPY client/ /data/www/listen