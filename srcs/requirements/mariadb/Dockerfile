FROM alpine:3.18

LABEL createdBy="gd-harco" mail="gd-harco@student.42lyon.fr"

RUN apk update && apk upgrade \
    && apk add --no-cache mysql mysql-client openrc

RUN mkdir /run/openrc \
    && touch /run/openrc/softlevel

RUN /etc/init.d/mariadb setup

RUN openrc

# sale mais facilite le debug
RUN rc-service mariadb start && mariadb -e "CREATE DATABASE IF NOT EXISTS dummy_name;" \
     -e "CREATE USER 'db_user'@'%' IDENTIFIED BY 'pass';" \
     -e "GRANT ALL PRIVILEGES ON dummy_name.* TO 'db_user'@'%';" \
     -e "FLUSH PRIVILEGES;"

CMD ["/usr/bin/mysqld", "--user=root"]
# RUN chmod 0644 /etc/my.cnf.d/mariadb-server.cnf

# RUN mkdir /var/run/mysqld; \
#     chmod 777 /var/run/mysqld; \
#     { echo '[mysqld]'; \
#     echo 'skip-host-cache';\
#     echo 'skip-name-resolve';\
#     echo 'bind-address=0.0.0.0';\
#     } | tee /etc/my.cnf.d/docker.cnf; \
#     sed -i "s|skip-networking|skip-networking=0|g" \
#     /etc/my.cnf.d/mariadb-server.cnf

# RUN service mariadb start && mysqladmin -u root -prootpass shutdown
#
# COPY ./my.cnf /etc/mysql/my.cnf
#
# RUN chmod +x /usr/local/bin
#
# EXPOSE 3306
#
# CMD ["mariadbd", "--bind-address=0.0.0.0"]

#wp-cli.phar config create --dbname=dummy_name --dbuser=db_user --dbhost=mariadb:3306 --dbpass=pass --allow-root
