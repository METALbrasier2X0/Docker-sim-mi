FROM php:7.2-fpm

RUN docker-php-ext-install pdo_mysql

RUN pecl install apcu-5.1.8
RUN docker-php-ext-enable apcu

RUN apt-get update && apt-get install -my \
  curl \
  wget \
  git \
  zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    #&& php -r "if (hash_file('SHA384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && mv composer /usr/local/bin/composer


WORKDIR /var/www/html/symfony

#COPY apps/sim_mi_project_dawin /usr/src/app

RUN PATH=$PATH:/usr/src/apps/vendor/bin:bin