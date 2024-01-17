FROM debian:11

LABEL author="gd-harco"

ARG	DB_NAME
ARG DB_USER
ARG USER_PSSWD

#installer Mariadb
RUN apt update -y && \
    apt upgrade -y && \
    apt-get install mariadb-server -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mariadb start && \
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}; \
CREATE USER IF NOT EXISTS ${DB_USER}@'localhost' IDENTIFIED BY '${USER_PSSWD}'; \
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${USER_PSSWD}'; \
ALTER USER 'root'@'localhost' IDENTIFIED BY '${USER_PSSWD}'; \
FLUSH PRIVILEGES;"


CMD ["mysqld_safe"]

EXPOSE 3306