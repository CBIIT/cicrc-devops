# move default config file
mv web/sites/default/settings.php web/sites/default/settings.php.bak

# update the db credentials in the config file
cp web/sites/default/settings.php.template web/sites/default/settings.php \
 && sed -i "s/{{db_name}}/$DB_NAME/g" web/sites/default/settings.php \
 && sed -i "s/{{db_user}}/$DB_USER/g" web/sites/default/settings.php \
 && sed -i "s/{{db_pass}}/$DB_PASS/g" web/sites/default/settings.php \
 && sed -i "s/{{db_host}}/$DB_HOST/g" web/sites/default/settings.php

##################  DEBUG  ##############################
sed -i 's|LogLevel warn|LogLevel debug|g' /etc/apache2/apache2.conf
sed -i 's|ErrorLog ${APACHE_LOG_DIR}/error.log|ErrorLog ${APACHE_LOG_DIR}/test.log|g' /etc/apache2/apache2.conf
#########################################################

chown www-data:www-data web/sites/default/settings.php

# Run drush commands
vendor/bin/drush cr \
 && vendor/bin/drush cim -y \
 && vendor/bin/drush cr \
 && vendor/bin/drush updb -y \
 && vendor/bin/drush cr