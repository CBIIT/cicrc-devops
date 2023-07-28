# Pull the base image from PHP
FROM php:8.1.19-bullseye AS build

# Install Dependencies
RUN apt update && apt install -y zlib1g-dev libpng-dev git unzip && rm -rf /var/lib/apt/lists/* && docker-php-ext-install gd

# Get composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php --version=2.4.4 \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer

RUN composer global require drush/drush:11.3.2

COPY CICRC /var/www/html

RUN cd /var/www/html/ && composer install

# Pull the prod image from PHP
FROM php:8.1.19-apache-bullseye AS final

# Install php extensions
RUN apt update && apt install -y libpng-dev && rm -rf /var/lib/apt/lists/* && docker-php-ext-install pdo_mysql gd

#################    DEBUG    ######################
# Enable apache rewrite module
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod socache_shmcb
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod authz_groupfile

RUN apt update && apt install -y vim

#################    DEBUG    ######################

# Copy code
COPY --chown=www-data:www-data --from=build /var/www/html/composer.json /var/www/html/composer.json
COPY --chown=www-data:www-data --from=build /var/www/html/web /var/www/html/web
COPY --chown=www-data:www-data --from=build /var/www/html/vendor /var/www/html/vendor
COPY --chown=www-data:www-data --from=build /var/www/html/config /var/www/html/config

# Copy required config files 
RUN rm -rf /etc/apache2/sites-enabled/000-default.conf
COPY default.conf /etc/apache2/sites-enabled
COPY --chown=www-data:www-data --chmod=0755 cicrc-entrypoint.sh /var/www/html/cicrc-entrypoint.sh

ENV APACHE_LOG_DIR=/var/log/apache2
ENV APACHE_DOCUMENT_ROOT=/var/www/html
WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT [ "/bin/sh", "-c", "/var/www/html/cicrc-entrypoint.sh && apache2-foreground" ]