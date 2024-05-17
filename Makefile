all:
	@mkdir -p /home/ydegerli/data/wordpress
	@mkdir -p /home/ydegerli/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f srcs/docker-compose.yml up --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	rm -rf /home/ydegerli/data/wordpress
	rm -rf /home/ydegerli/data/mariadb

.PHONY: all re down clean
