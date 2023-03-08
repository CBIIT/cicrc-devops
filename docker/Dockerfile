# Pull the base image from PHP-Apache
FROM php:8.1.12-apache-bullseye AS build
#FROM php:8.1.12-bullseye AS build
MAINTAINER ESI Devops Team

# Install Dependencies
RUN apt update && apt install -y zlib1g-dev libpng-dev git unzip && rm -rf /var/lib/apt/lists/* && docker-php-ext-install gd

# Get composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php --version=2.4.4 \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer

RUN composer global require drush/drush:11.3.2

COPY CICRC /var/www/html

RUN cd /var/www/html/ && composer update && composer install

#FROM php:8.1.12-apache-bullseye AS final

ENV APACHE_DOCUMENT_ROOT=/var/www/html

RUN rm -rf /etc/apache2/sites-enabled/000-default.conf
COPY default.conf /etc/apache2/sites-enabled

#COPY --chown=www-data:www-data --from=build /var/www/html/web /var/www/html/web
#COPY --chown=www-data:www-data --from=build /var/www/html/vendor /var/www/html/vendor
#COPY --chown=www-data:www-data --from=build /var/www/html/config /var/www/html/config

RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

EXPOSE 80