# ********* VAR ******** #
NAME			=	inception

COMPOSE_PATH	=	srcs/docker-compose.yml

COMP_CMD		=	docker compose

MKDIR			=	mkdir -p

VOLUMES_PATH	=	/home/$(USER)/data
# ********* RULES ******** #

all:	up

nginx :
	docker build srcs/requirements/nginx -t nginx

wp :
	docker build srcs/requirements/wordpress -t wordpress

up:
	make volumes
	${COMP_CMD} -f ${COMPOSE_PATH} up --build

bg_up:
	make volumes
	${COMP_CMD} -f ${COMPOSE_PATH} up --build -d

volumes:
	${MKDIR} ${VOLUMES_PATH}/wordpress
	${MKDIR} ${VOLUMES_PATH}/mariadb

down:
	${COMP_CMD} -f ${COMPOSE_PATH} down --rmi all -v --remove-orphans
