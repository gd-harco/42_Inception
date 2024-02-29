FROM debian:oldstable

LABEL createdBy="gd-harco" mail="gd-harco@student.42lyon.fr"

#mettre a jour apt
#
RUN	apt-get update \
	&& apt-get upgrade \
	&& apt-get install curl --no-install-recommends -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
