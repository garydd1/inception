# Define color codes
GREEN=\033[0;32m
YELLOW=\033[0;33m
BLUE=\033[0;34m
PURPLE=\033[0;35m
CYAN=\033[0;36m
WHITE=\033[0;37m
NC=\033[0m # No Color

create:
	@echo "1.${GREEN}Creating Debian:11.8 Base image for performance improvement...${NC}"
	@sudo docker build -t baseimage ./srcs/requirements/tools/
	@echo "${GREEN}1: Done.${NC}"
	@echo "2.${YELLOW}Building Basic, this will take a while...${NC}"
	@sudo docker-compose -f ./srcs/docker-compose.yml up --build mariadb wordpress nginx
	@echo "${YELLOW}2: Done!${NC}"
bonus:
	sudo docker-compose -f ./srcs/docker-compose.yml up 
fclean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down
	@sudo docker system prune --all --force
