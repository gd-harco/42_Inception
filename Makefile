# ********* VAR ******** #
NAME			=	inception

COMPOSE_PATH	=	srcs/docker-compose.yml

COMP_CMD		=	docker compose

MKDIR			=	mkdir -p

VOLUMES_PATH	=	/home/$(USER)/data
# ********* RULES ******** #

all:	up

up:
	make volumes
	${COMP_CMD} -f ${COMPOSE_PATH} up --build

volumes:
	${MKDIR} ${VOLUMES_PATH}/wordpress
	${MKDIR} ${VOLUMES_PATH}/mariadb

down:
	${COMP_CMD} -f ${COMPOSE_PATH} down --rmi all -v --remove-orphans