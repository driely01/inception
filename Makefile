# PATH = srcs/docker-compose.yaml

run:
	sudo docker-compose -f srcs/docker-compose.yaml up -d

build:
	sudo docker-compose -f srcs/docker-compose.yaml up --build -d

down:
	sudo docker-compose -f srcs/docker-compose.yaml down

images:
	sudo docker images

running:
	sudo docker ps

containers:
	sudo docker ps -a

volumerm:
	sudo rm -rf ../../data/mysql/*
	sudo rm -rf ../../data/wordpress/*

remove image:
	sudo docker rmi wordpress nginx mariadb

clean:
	sudo docker system prune -a