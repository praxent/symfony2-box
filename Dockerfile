FROM php:5.6.21-fpm
#Installing Dependencies
RUN apt-get update && \
    apt-get install git libssl-dev zip curl -y && \
    rm -rf /var/lib/apt/lists/*

#Installing and setting up composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /bin/composer

ONBUILD ARG TIMEZONE='date.timezone="America/Chicago"'
ONBUILD RUN echo $TIMEZONE >> /usr/local/etc/php/php.ini
