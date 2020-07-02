FROM phpearth/php:7.4-cli

WORKDIR /app

RUN apk add composer \
    && composer selfupdate \
    && composer global require mglaman/drupal-check \
    && ln -s /root/.composer/vendor/bin/drupal-check /usr/local/bin/drupal-check \
    && echo "memory_limit=-1" >> /etc/php/7.4/php.ini

ENTRYPOINT ["drupal-check", "-da"]
