FROM php:7.1-fpm-alpine

COPY start-script.sh /var/www/docker/start-script.sh

RUN apk add --no-cache libpng libpng-dev && docker-php-ext-install gd && docker-php-ext-install zip && apk del libpng-dev

RUN apk add --update \
    libjpeg-turbo-dev \
    libwebp-dev \
    zlib-dev \ 
    libxpm-dev \
    bash \ 
    git \
    php7 \
    php7-fpm \
    php7-pdo \
    php7-pdo_mysql \
    php7-mcrypt \
    php7-mbstring \
    php7-xml \
    php7-openssl \
    php7-json \
    php7-phar \
    php7-zip \
    php7-dom \
    php7-session \
    php7-zlib && \
    php7 -r "copy('http://getcomposer.org/installer', 'composer-setup.php');" && \
    php7 composer-setup.php --install-dir=/usr/bin --filename=composer && \
    php7 -r "unlink('composer-setup.php');" 

WORKDIR /var/www/

RUN composer global require "laravel/installer"

CMD chmod 777 ./docker/start-script.sh && sed -i 's/\r$//' ./docker/start-script.sh && bash ./docker/start-script.sh

##CMD exec /bin/bash -c "trap : TERM INT; sleep 100000 & wait"








