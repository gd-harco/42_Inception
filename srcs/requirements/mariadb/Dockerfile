FROM debian:11

#installer Mariadb
RUN apt update -y && \
    apt upgrade -y && \
    apt-get install mariadb-server -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mariadb start && \
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS gddb; \
CREATE USER IF NOT EXISTS gdharco@'localhost' IDENTIFIED BY '5555'; \
GRANT ALL PRIVILEGES ON gddb.* TO gdharco@'%' IDENTIFIED BY '5555'; \
ALTER USER 'root'@'localhost' IDENTIFIED BY '5555'; \
FLUSH PRIVILEGES;" && \
    mysqladmin -u root -p5555 shutdown


CMD ["mysqld_safe"]

EXPOSE 3306