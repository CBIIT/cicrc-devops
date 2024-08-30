# Pull the base image from PHP
FROM php:8.1.29-bullseye AS build


# Install Dependencies
RUN apt update && apt install -y zlib1g-dev libpng-dev git unzip && rm -rf /var/lib/apt/lists/* && docker-php-ext-install gd

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    openssl

# Install PHP zip extension
RUN docker-php-ext-install zip

# Install other PHP extensions or dependencies as needed
RUN docker-php-ext-install gd

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY CRCR /var/www/html

RUN curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer \
  && export PATH=$HOME/.composer/vendor/bin:$PATH

RUN composer require drush/drush:12.5.1 -n 

RUN cd /var/www/html/ && composer install

# Pull the prod image from PHP
FROM php:8.1.29-apache-bullseye AS final

# Install php extensions
RUN apt update && apt install -y apache2 libpng-dev && rm -rf /var/lib/apt/lists/* && docker-php-ext-install pdo_mysql gd

#RUN curl -L https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar -o drush.phar \
#  && chmod +x drush.phar \
#  && mv drush.phar /usr/local/bin/drush

# Copy code
COPY --chown=www-data:www-data --from=build /var/www/html /var/www/html

RUN mkdir /usr/local/share/ca-certificates/splunk-ca
COPY *.crt /usr/local/share/ca-certificates/splunk-ca
RUN update-ca-certificates

# config apache http server
COPY default.conf /etc/apache2/sites-available/crcr.conf
RUN a2ensite crcr
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Set PHP memory limit
RUN echo 'memory_limit = 256M' >> /usr/local/etc/php/conf.d/custom-php.ini

# Set environment variables and working directory
ENV APACHE_LOG_DIR=/var/log/apache2
ENV APACHE_DOCUMENT_ROOT=/var/www/html/
WORKDIR /var/www/html/

# Expose port 80
EXPOSE 80

ENTRYPOINT [ "/bin/sh", "-c", "/var/www/html/crcr-entrypoint.sh && apache2-foreground" ]
