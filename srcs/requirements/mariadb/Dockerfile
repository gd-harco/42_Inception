FROM debian:11

LABEL createdBy="gd-harco" mail="gd-harco@student.42lyon.fr"

# Import environment variables
ARG DB_ROOT_PASS
ARG DB_NAME
ARG DB_USER
ARG DB_USER_PASS

# Install MariaDB
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server && \
	apt-get clean && \
	rm -fr /var/lib/apt/lists/*

# Create a database
RUN service mariadb start && \
	mariadb -u root -p"${DB_ROOT_PASS}" \
					-e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" \
					-e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASS}';" \
					-e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';" \
					-e "FLUSH PRIVILEGES;"

# expose MariaDB port
EXPOSE 3306

# Start MariaDB
CMD [ "mariadbd", "--bind-address=0.0.0.0" ]

#wp-cli.phar config create --dbname=dummy_name --dbuser=db_user --dbhost=mariadb:3306 --dbpass=pass --allow-root

