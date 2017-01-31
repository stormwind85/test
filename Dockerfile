FROM php:5.6-apache

WORKDIR /var/www/html

COPY file.sh .

# Entrypoint
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["entrypoint.sh"]