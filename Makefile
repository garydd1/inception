all: create

create: 
		sudo docker-compose -f ./srcs/docker-compose.yml up 