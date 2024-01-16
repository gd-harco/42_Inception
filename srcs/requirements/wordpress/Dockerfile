FROM debian:11

LABEL author="gd-harco"

#mettre a jour apt
RUN apt-get update && apt-get upgrade

RUN apt-get install wget --no-install-recommends -y

RUN apt-get install -y php\
						php-fpm\
						php-mysql\
						mariadb-client\
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

#TODO PAsser par wordpressCLI comme dis dans le readme de ljhonsonh ttps://github.com/Arkhavy/42_2021_Inception/tree/master

#RUN #wget --no-check-certificate fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.4.2-fr_FR.tar.gz && rm wordpress-6.4.2-fr_FR.tar.gz

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php
CMD ["php-fpm7.4", "-F"]