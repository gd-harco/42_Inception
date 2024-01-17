FROM debian:11

LABEL author="gd-harco"

#mettre a jour apt
RUN apt-get update && apt-get upgrade

RUN apt-get install wget --no-install-recommends -y

RUN apt-get install -y php\
						php-fpm\
						php-mysql\
						mariadb-client\
    					curl\
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

#TODO PAsser par wordpressCLI comme dis dans le readme de ljhonsonh ttps://github.com/Arkhavy/42_2021_Inception/tree/master

#installer wp-cli, le rendre executable et le mettre dans PATH sous la commande wp
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /bin/wp


RUN mkdir -p /var/www/html/wordpress

EXPOSE 9000

#TODO Configurer worpress via wpcli

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php

CMD ["php-fpm7.4", "-F"]