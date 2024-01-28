COMPOSE = srcs/docker-compose.yaml
MYSQLVL = /home/${USER}/data/mysql/*
WPVL = /home/${USER}/data/wordpress/*

MYSQL_VOLUME_DEVICE = /home/${USER}/data/mysql
WP_VOLUME_DEVICE = /home/${USER}/data/wordpress

all: run

run:
	mkdir -p ${MYSQL_VOLUME_DEVICE}
	mkdir -p ${WP_VOLUME_DEVICE}
	sudo docker-compose -f ${COMPOSE} up -d

build:
	sudo docker-compose -f ${COMPOSE} up --build -d

down:
	sudo docker-compose -f ${COMPOSE} down

images:
	sudo docker images

running:
	sudo docker ps

containers:
	sudo docker ps -a

volume-rm:
	sudo rm -rf ${MYSQLVL}
	sudo rm -rf ${WPVL}

remove-images:
	sudo docker rmi wordpress nginx mariadb

clean-volumes:
	sudo docker volume rm $$(sudo docker volume ls -q)
	sudo rm -rf ${MYSQLVL}
	sudo rm -rf ${WPVL}

log-nginx:
	sudo docker logs nginx

log-mariadb:
	sudo docker logs mariadb

log-wp:
	sudo docker logs wordpress

ps:
	sudo docker ps

clean:
	sudo docker system prune -a

fclean: down clean-volumes clean


re: fclean all

.PHONY: run \
		build \
		down \
		images \
		running \
		containers \
		volume-rm \
		remove-images \
		clean-volumes \
		log-nginx \
		log-mariadb \
		log-wp \
		ps \
		clean \
		re \