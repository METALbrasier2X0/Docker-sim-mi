COMPOSE=docker-compose
install: 
	$(COMPOSE) build
	$(COMPOSE) up -d
	$(COMPOSE) exec php composer install
	$(COMPOSE) exec php php bin/console doctrine:schema:create
	$(COMPOSE) exec php php bin/console assets:install --symlink public/

rebuild:
	$(COMPOSE) up -d --build php nginx
up: 
	$(COMPOSE) up -d

stop:
	$(COMPOSE) stop

rm:
	$(COMPOSE) rm