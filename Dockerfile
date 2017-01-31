FROM php:5.6-apache

COPY file.sh .

# Entrypoint
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["entrypoint.sh"]