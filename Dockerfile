# USANDO A IMAGEM BASE DO PHP COM APACHE
FROM php:8.2-apache

# INSTALANDO EXTENSÕES PHP NECESSÁRIAS PARA O MYSQL
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql pdo_mysql mysqli

# Copiando o arquivo de configuração do Apache
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Ativando mod_rewrite do Apache
RUN a2enmod rewrite

# Reiniciando o Apache
RUN service apache2 restart
