FROM php:5.6-apache

# Entrypoint
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["entrypoint.sh"]