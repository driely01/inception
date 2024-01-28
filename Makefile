COMPOSE = srcs/docker-compose.yaml
MYSQLVL = /home/driss/data/mysql/*
WPVL = /home/driss/data/wordpress/*

all: run

run:
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

volumerm:
	sudo rm -rf ${MYSQLVL}
	sudo rm -rf ${WPVL}

removeimage:
	sudo docker rmi wordpress nginx mariadb

clean-volumes:
	sudo docker volume rm $$(sudo docker volume ls -q)
	sudo rm -rf ${MYSQLVL}
	sudo rm -rf ${WPVL}

ps:
	sudo docker ps

clean:
	sudo docker system prune -a

re: down clean all

.PHONY: all run build down images running containers volumerm removeimage clean re ps