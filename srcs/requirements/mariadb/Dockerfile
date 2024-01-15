FROM debian:11

#installer Mariadb
RUN apt update -y && \
    apt upgrade -y && \
    apt-get install mariadb-server -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/marmariadb.conf.d/50-server.cnf

RUN service mariadb start &&  \
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`; \
     CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';\
      GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';\
       ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';\
        FLUSH PRIVILEGES"

CMD mariadbd