COMPOSE = srcs/docker-compose.yml
DATADIR = ${HOME}/data
MYSQLVL = ${HOME}/data/mysql/*
WPVL = ${HOME}/data/wordpress/*

MYSQL_VOLUME_DEVICE = ${HOME}/data/mysql
WP_VOLUME_DEVICE = ${HOME}/data/wordpress

all: run

run:
	mkdir -p ${DATADIR}
	mkdir -p ${MYSQL_VOLUME_DEVICE}
	mkdir -p ${WP_VOLUME_DEVICE}
	docker-compose -f ${COMPOSE} up -d

build:
	docker-compose -f ${COMPOSE} up --build -d

down:
	docker-compose -f ${COMPOSE} down

images:
	docker images

containers:
	docker ps -a

volume-rm:
	sudo rm -rf ${MYSQLVL}
	sudo rm -rf ${WPVL}

ps:
	docker ps

clean: down
	docker rmi wordpress nginx mariadb website adminer

fclean: down
	docker system prune -a


re: fclean all

.PHONY: run \
		build \
		down \
		images \
		containers \
		volume-rm \
		ps \
		clean \
		re \