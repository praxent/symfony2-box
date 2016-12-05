FROM php:5.6.21-fpm
MAINTAINER John Lund <john@praxent.com>
#FROM php:5.6.21-fpm
#Installing Dependencies
RUN apt-get update && apt-get install -y \
    git \
    libssl-dev \
    zip \
    curl \
    nodejs \
    npm
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g bower && \
    npm install -g node-sass
RUN rm -rf /var/lib/apt/lists/*
RUN echo date.timezone="America/Chicago" >> /usr/local/etc/php/conf.d/php.ini
#Installing and setting up composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /bin/composer
