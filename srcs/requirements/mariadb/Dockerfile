FROM debian:11-slim

LABEL createdBy="gd-harco" mail="gd-harco@student.42lyon.fr"

RUN apt-get update \
    && apt-get upgrade

RUN apt-get install curl	\
    ca-certificates	\
    mariadb-server \
    --no-install-recommends -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#sale mais facilite le debug
RUN service mariadb start && mysql -u root -prootpass -e "CREATE DATABASE IF NOT EXISTS dummy_name;" \
     -e "CREATE USER 'db_user'@'%' IDENTIFIED BY 'pass';" \
     -e "GRANT ALL PRIVILEGES ON dummy_name.* TO 'db_user'@'%';" \
     -e "FLUSH PRIVILEGES;"
RUN service mariadb start && mysqladmin -u root -prootpass shutdown

COPY ./my.cnf /etc/mysql/my.cnf

RUN chmod +x /usr/local/bin

EXPOSE 3306

CMD ["mariadbd", "--bind-address=0.0.0.0"]

#wp-cli.phar config create --dbname=dummy_name --dbuser=db_user --dbhost=mariadb:3306 --dbpass=pass --allow-root