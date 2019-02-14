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
make install
```

* Visitez *localhost:80* pour accéder à l'appli
* *localhost:8181* pour PHPMyAdmin

## Quelques commandes

* `make stop`: arréter les conteneurs
* `make rm`: supprimer les conteneurs arrétés
* `docker system prune -a`: permet de supprimer tout ce qui n'est pas relié à un conteneur qui tourne (libère beaucoup de place!)

## FAQ

### Comment mettre à jour ?

```bash
make stop
make rm
make rebuild
```
Puis recommencer les étapes d'installations

### `docker-compose up -d` me retourne `Error starting userland proxy: listen tcp 0.0.0.0:80: bind: address already in use`

N'oubliez pas de libérer le port 80 (`systemctl stop apache2` sur ubuntu)

### `docker-compose exec php php bin/console doctrine:schema:create` m'affiche `SQLSTATE[HY000] [2002] Connection refused`

Vérifiez que les infos de la base de données dans le fichier .env (à la racine) soient les mêmes que dans l'appli symfony (apps/\<nom de l'appli\>/.env).

### Le nom du dossier qui contient le project symfony a un nom différent

Dans le .env de Docker, remplacer la valeur de APP_NAME par le bon nom.