FROM phpearth/php:7.4-cli

WORKDIR /app

COPY drupal-check /opt/drupal-check

RUN apk --no-cache add composer \
    && composer selfupdate \
    && echo "memory_limit=-1" >> /etc/php/7.4/php.ini \
    && cd /opt/drupal-check \
    && composer install \
    && ln -s /opt/drupal-check/vendor/bin/drupal-check /usr/local/bin/drupal-check

ENTRYPOINT ["drupal-check", "-da"]
