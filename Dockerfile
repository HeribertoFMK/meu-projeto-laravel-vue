FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    zip unzip git curl \
    libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-install pdo_mysql gd

WORKDIR /var/www

COPY . .

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install

CMD ["php-fpm"]
