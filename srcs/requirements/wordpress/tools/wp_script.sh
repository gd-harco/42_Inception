#!/usr/bin/bash

wp core download --path=/var/www/html/wordpress --allow-root

cp ./wpconf.php /var/www/html/wordpress/wp-config.php

php-fpm7.4 -F;