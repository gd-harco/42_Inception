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
RUN service mariadb start && mariadb -e "CREATE DATABASE dummy_name"
RUN service mariadb start && mariadb -e "CREATE USER 'db_user'@'localhost' identified by 'pass'"
RUN service mariadb start && mariadb -e "GRANT ALL PRIVILEGES ON dummy_name.* TO 'db_user'@'localhost';"
RUN service mariadb start && mariadb -e "FLUSH PRIVILEGES;"

EXPOSE 3306

CMD ["mysqld", "--bind-address=0.0.0.0"]