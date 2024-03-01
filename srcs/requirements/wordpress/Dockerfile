FROM debian:oldstable

LABEL createdBy="gd-harco" mail="gd-harco@student.42lyon.fr"

#mettre a jour apt
#installation curl (pour recuperer wp-cli, php et ses dependances)
RUN	apt-get update \
	&& apt-get upgrade \
	&& apt-get install curl \
    	php7.3 \
    	php-fpm \
    	php-mysql \
#    	mariadb-client \
    	--no-install-recommends -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --insecure \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY script/wpconfig.sh ./wpconfig.sh

CMD ["bash", "wpconfig.sh"]