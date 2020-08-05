FROM php:7.1.3-fpm

RUN apt update
RUN apt install -y libzip-dev
RUN docker-php-ext-install zip

# Install composer
RUN curl https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Delete the cache files.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

SHELL ["/bin/bash", "-c"]
EXPOSE 3000
