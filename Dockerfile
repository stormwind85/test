FROM php:5.6-apache

RUN apt-get install -y python3

WORKDIR /var/www/html

COPY file.sh .

# Entrypoint
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["entrypoint.sh"]
