FROM debian:11

LABEL author="gd-harco"

#mettre a jour apt
RUN apt-get update && apt-get upgrade
#Installer les paquets nginx curl et vim
RUN apt-get install nginx openssl --no-install-recommends -y \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

#generation du certificat SSL/TLS
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key  \
    -subj "/C=FR/ST=ARA/L=Lyon/O=42/OU=42/CN=gd-harco.42.fr/UID=gd-harco"

RUN mkdir -p /var/www/gd-harco/public_html;

COPY conf/config.conf /etc/nginx/sites-available/gd-harco.42.fr.conf
COPY testFiles/* /var/www/gd-harco/public_html

RUN ln -s /etc/nginx/sites-available/gd-harco.42.fr.conf /etc/nginx/sites-enabled/gd-harco.42.fr.conf

CMD ["nginx", "-g", "daemon off;"]
