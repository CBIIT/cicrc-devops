# move default config file
mv web/sites/default/settings.php web/sites/default/settings.php.bak

# update the db credentials in the config file
cp web/sites/default/settings.php.template web/sites/default/settings.php \
 && sed -i "s/{{db_name}}/$DB_NAME/g" web/sites/default/settings.php \
 && sed -i "s/{{db_user}}/$DB_USER/g" web/sites/default/settings.php \
 && sed -i "s/{{db_pass}}/$DB_PASS/g" web/sites/default/settings.php \
 && sed -i "s/{{db_host}}/$DB_HOST/g" web/sites/default/settings.php

chown www-data:www-data web/sites/default/settings.php

# Set the Drupal root
DRUPAL_ROOT="/var/www/html/web"

# Run drush commands
vendor/bin/drush --root="$DRUPAL_ROOT" cr \
 && vendor/bin/drush --root="$DRUPAL_ROOT" cim -y \
 && vendor/bin/drush --root="$DRUPAL_ROOT" cr \
 && vendor/bin/drush --root="$DRUPAL_ROOT" updb -y \
 && vendor/bin/drush --root="$DRUPAL_ROOT" cr \
 && vendor/bin/drush --root="$DRUPAL_ROOT" cim -y \
 && vendor/bin/drush --root="$DRUPAL_ROOT" cr \
 && vendor/bin/drush --root="$DRUPAL_ROOT" sapi-c -y \
 && vendor/bin/drush --root="$DRUPAL_ROOT" sapi-i -y \
 && vendor/bin/drush --root="$DRUPAL_ROOT" cr