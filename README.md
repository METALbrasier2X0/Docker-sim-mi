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

## FAQ

### `docker-compose build` me retourne une erreur.

N'oubliez pas de libérer le port 80 (`systemctl stop apache2` sur ubuntu)

### `docker-compose exec php php bin/console doctrine:schema:create` m'affiche `SQLSTATE[HY000] [2002] Connection refused`

Vérifiez que les infos de la base de données dans le fichier .env (à la racine) soient les mêmes que dans l'appli symfony (apps/\<nom de l'appli\>/.env).