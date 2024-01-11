FROM debian:11

#mettre a jour apt
RUN apt-get update && apt-get upgrade
#Installer les paquets nginx curl et vim
RUN apt-get install nginx vim curl openssl -y

RUN mkdir -p /etc/nginx/ssl

#generation du certificat SSL/TLS
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key  \
    -subj "/C=FR/ST=ARA/L=Lyon/O=42/OU=42/CN=gd-harco.42.fr/UID=gd-harco"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "deamon off;"]

