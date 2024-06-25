# move default config file
mv sites/default/settings.php sites/default/settings.php.bak

# update the db credentials in the config file
cp sites/default/settings.php.template sites/default/settings.php \
 && sed -i "s/{{db_name}}/$DB_NAME/g" sites/default/settings.php \
 && sed -i "s/{{db_user}}/$DB_USER/g" sites/default/settings.php \
 && sed -i "s/{{db_pass}}/$DB_PASS/g" sites/default/settings.php \
 && sed -i "s/{{db_host}}/$DB_HOST/g" sites/default/settings.php

chown www-data:www-data sites/default/settings.php

# Run drush commands
../vendor/bin/drush cr \
 && ../vendor/bin/drush cim -y \
 && ../vendor/bin/drush cr \
 && ../vendor/bin/drush updb -y \
 && ../vendor/bin/drush cr \
 && ../vendor/bin/drush cim -y \
 && ../vendor/bin/drush cr \
 && ../vendor/bin/drush sapi-c -y \
 && ../vendor/bin/drush sapi-i -y \
 && ../vendor/bin/drush cr