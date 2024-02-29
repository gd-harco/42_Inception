FROM debian:oldstable

LABEL createdBy="gd-harco" mail="gd-harco@student.42lyon.fr"

#mettre a jour apt
RUN apt-get update && apt-get upgrade

#Installer nginx et openssl
RUN	apt-get install nginx openssl --no-install-recommends -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

#Generation de la cle SSH et du certificat
# source : https://www.openssl.org/docs/manmaster/man1/openssl-req.html
# 	- demande de CSR (Certificat Signing Request)
# 	- outputs a certificate instead of a certificate request
# 	- ne pas chiffrer la cle (pas de prompt, deprecie dans OpenSSL 3.0, remplacer par -noenc si besoin)
# 	- Generer une nouvelel cle prive. [rsa:]nbits generates an RSA key nbits in size (defaut 2048).
# 	- emplacement de la cle Generee
# 	- sortie du certificat
# 	- donne les infos requise pour eviter un prompt
RUN openssl req \
	-x509 \
	-nodes \
	-newkey rsa \
	-keyout /etc/ssl/private/gd-harco.42.fr.key \
	-out /etc/ssl/certs/gd-harco.42.fr.crt \
	-subj "/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/UID=gd-harco/emailAddress=gd-harco@student.42lyon.fr"
