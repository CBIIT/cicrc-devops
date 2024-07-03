# Pull the base image from PHP
FROM php:8.1.19-bullseye AS build

# Install Dependencies
RUN apt update && apt install -y zlib1g-dev libpng-dev git unzip && rm -rf /var/lib/apt/lists/* && docker-php-ext-install gd

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip

# Install PHP zip extension
RUN docker-php-ext-install zip

# Install other PHP extensions or dependencies as needed
RUN docker-php-ext-install gd

# Get composer
#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
#  && php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
#  && php composer-setup.php --version=2.4.4 \
#  && php -r "unlink('composer-setup.php');" \
#  && mv composer.phar /usr/local/bin/composer

RUN curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer \
  && export PATH=$HOME/.composer/vendor/bin:$PATH

COPY CRCR /var/www/html

RUN composer global require drush/drush:12.5.1 -n 

RUN cd /var/www/html/ && composer install

RUN ls /var/www/html/vendor/bin \
  && ls -al /var/www/html/ 

# Pull the prod image from PHP
FROM php:8.1.19-apache-bullseye AS final

# Install php extensions
RUN apt update && apt install -y libpng-dev && rm -rf /var/lib/apt/lists/* && docker-php-ext-install pdo_mysql gd

RUN wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar \
  && chmod +x drush.phar \
  && sudo mv drush.phar /usr/local/bin/drush 

# Copy code
COPY --chown=www-data:www-data --from=build /var/www/html /var/www/html

RUN ls -ltr /var/www/html/vendor/bin

RUN /usr/local/bin/drush status

# Copy code
# COPY --chown=www-data:www-data --from=build /var/www/html/composer.json /var/www/html/composer.json
# COPY --chown=www-data:www-data --from=build /var/www/html/web /var/www/html/web
# COPY --chown=www-data:www-data --from=build /var/www/html/vendor /var/www/html/vendor
# COPY --chown=www-data:www-data --from=build /var/www/html/config /var/www/html/config

# Copy required config files 
RUN rm -rf /etc/apache2/sites-enabled/000-default.conf
COPY default.conf /etc/apache2/sites-enabled
COPY --chown=www-data:www-data --chmod=0755 crcr-entrypoint.sh /var/www/html/crcr-entrypoint.sh

ENV APACHE_LOG_DIR=/var/log/apache2
ENV APACHE_DOCUMENT_ROOT=/var/www/html/
WORKDIR /var/www/html/

EXPOSE 80

ENTRYPOINT [ "/bin/sh", "-c", "/var/www/html/crcr-entrypoint.sh && apache2-foreground" ]
