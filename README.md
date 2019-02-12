# SYMFONY DOCKER

## REQUIS

* Docker
* Docker-compose

## INSTALLATION

*Note: les deux premières instructions peuvent être réalisées en executant auto_clone.sh*

* Créer les dossiers *apps* et *bin*
* Dans le dossier *apps*, clonner l'appli symfony
* A la racine, renommer .env.dist en .env et remplir les infos pour la base de donnée
* Dans le .env de l'appli symfony, changer la ligne avec les bonnes infos: `DATABASE_URL=mysql://MYSQL_USER:MYSQL_PASSWORD@mysql:3306/MYSQL_DATABASE` **NE PAS OUBLIER DE CHANGER 127.0.0.1 PAR MYSQL**
* A la racine, executez:

```bash
docker-compose build
docker-compose up -d
docker-compose exec php composer install
docker-compose exec php php bin/console doctrine:schema:create
```

* Visitez *localhost* pour accéder à l'appli
* *localhost:8181* pour PHPMyAdmin

## Quelques commandes

* `docker-compose stop`: arréter les conteneurs

## FAQ

### `docker-compose up -d` me retourne `Error starting userland proxy: listen tcp 0.0.0.0:80: bind: address already in use`

N'oubliez pas de libérer le port 80 (`systemctl stop apache2` sur ubuntu)

### `docker-compose exec php php bin/console doctrine:schema:create` m'affiche `SQLSTATE[HY000] [2002] Connection refused`

Vérifiez que les infos de la base de données dans le fichier .env (à la racine) soient les mêmes que dans l'appli symfony (apps/\<nom de l'appli\>/.env).