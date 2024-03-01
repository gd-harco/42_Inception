#!/usr/bin/bash

wpInstallPath=/var/www/html/

#only for test, remove when proper install is done
rm -rf $wpInstallPath

wp core download --path=$wpInstallPath --allow-root