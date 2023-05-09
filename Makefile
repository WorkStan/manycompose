up: network-create
	docker compose -f ./proj1/docker-compose.yml up -d
	docker compose -f ./proj2/docker-compose.yml up -d
	docker compose -f ./nginx/docker-compose.yml up -d

build:
	docker compose -f ./proj1/docker-compose.yml build
	docker compose -f ./proj2/docker-compose.yml build
	docker compose -f ./nginx/docker-compose.yml build

down:
	docker compose -f ./nginx/docker-compose.yml down --remove-orphans
	docker compose -f ./proj1/docker-compose.yml down --remove-orphans
	docker compose -f ./proj2/docker-compose.yml down --remove-orphans

init: down build network-create up

network-create:
	docker network create -d bridge onenet

network-remove:
	docker network rm onenet