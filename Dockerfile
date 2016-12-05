FROM php:5.6.21-fpm
MAINTAINER John Lund <john@praxent.com>
#FROM php:5.6.21-fpm
#Installing Dependencies
RUN apt-get update && \
    apt-get install git libssl-dev zip curl nodejs npm -y && \
    npm install -g bower && \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    rm -rf /var/lib/apt/lists/*

#Installing and setting up composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /bin/composer

ONBUILD ARG TIMEZONE='date.timezone="America/Chicago"'
ONBUILD RUN echo $TIMEZONE >> /usr/local/etc/php/php.ini
