# SYMFONY DOCKER

## REQUIS

* Docker
* Docker-compose

## INSTALLATION

* Créer les dossiers *apps* et *bin*
* Dans le dossier *apps*, clonner l'appli symfony
* Renommer .env.dist en .env et remplir les infos pour la base de donnée
* Dans le .env de l'appli symfony, changer la ligne: DATABASE_URL=mysql://MYSQL_USER:MYSQL_PASSWORD@mysql:3306/MYSQL_DATABASE **NE PAS OUBLIER DE CHANGER 127.0.0.1 PAR MYSQL**
* A la racine, executez:

```bash
docker-compose build
docker-compose up -d
docker-compose exec php composer install
docker-compose exec php php bin/console doctrine:schema:create
```

* Visitez *localhost*