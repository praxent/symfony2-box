FROM php:5.6.21-fpm
#Installing Dependencies
RUN apt-get update && \
    apt-get install git libssl-dev zip curl -y && \
    rm -rf /var/lib/apt/lists/*

#Installing and setting up composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /bin/composer

#Installing and setting up Symfony2
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

#Installing PHP Extensions
ONBUILD ARG PECL_EXTENSIONS
ONBUILD RUN pecl install $(echo $PECL_EXTENSIONS | tr ',' ' ') && \
    docker-php-ext-enable $(echo $PECL_EXTENSIONS | tr ',' ' ')

ONBUILD ARG TIMEZONE='date.timezone="Europe/Lisbon"'
ONBUILD RUN echo $TIMEZONE >> /usr/local/etc/php/php.ini
