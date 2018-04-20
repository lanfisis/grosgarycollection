.PHONY: all up init restart stop clean php mysql tests unit-tests acceptance-tests js-tests simulatedeploy-install

UID=$(shell id -u)
GID=$(shell id -g)

# Executable
PHP=docker-compose exec --user www-data php
MYSQL=docker-compose exec mysql
NGINX=docker-compose exec nginx
NODE=docker run --name node --rm -e HOME=/tmp/home -v $(PWD):/tmp/workspace -w /tmp/workspace node

##########################
# CONTAINER CONTROL PART #
##########################

up:
	sudo ifconfig en0 alias 10.254.254.254 255.255.255.0
	docker-compose -f docker-compose.yml up -d --remove-orphans

upprod:
	docker-compose -f docker-compose-prod.yml up -d --remove-orphans

restart: stop up

stop:
	docker-compose stop

logs:
	docker-compose logs --follow

build:
	docker-compose build

assets:
	$(NODE) yarn install
	$(NODE) yarn run gulp

update:
	docker-compose run --rm composer update --ignore-platform-reqs

assets:
	$(PHP) php bin/console sylius:theme:assets:install

#########################
# CONTAINER ACCESS PART #
#########################

php:
	$(PHP) /bin/bash

nginx:
	$(NGINX) /bin/bash

mysql:
	$(MYSQL) mysql -uwarner -pMoarty13 warner


