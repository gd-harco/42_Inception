FROM debian:oldstable

LABEL createdBy="gd-harco" mail="gd-harco@student.42lyon.fr"

#mettre a jour apt
RUN apt-get update && apt-get upgrade

#Installer nginx et openssl
RUN	apt-get install nginx openssl --no-install-recommends -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*