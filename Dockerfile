# Usa la imagen base de PHP con Laravel
FROM php:8.1-apache

# Define las variables de entorno como argumentos de construcción (build args)
ARG DB_HOST
ARG DB_PORT
ARG DB_DATABASE
ARG DB_USERNAME
ARG DB_PASSWORD

# Instala dependencias necesarias
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    vim \
    && docker-php-ext-install zip pdo pdo_mysql

# Habilita el módulo de rewrite en Apache
RUN a2enmod rewrite

# Configura el directorio de trabajo
WORKDIR /var/www/html

# Copia los archivos de tu proyecto Laravel al contenedor
COPY . .

# Copia el archivo 000-default.conf a su ubicación para que el documentRoot sea hasta public
COPY laravel-site.conf /etc/apache2/sites-available/000-default.conf

# Instala Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configura composer para ejecutar comenados como root
ENV COMPOSER_ALLOW_SUPERUSER=1

# Instala las dependencias del proyecto
RUN composer install

# Establece las variables de entorno para la base de datos
ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}
ENV DB_DATABASE=${DB_DATABASE}
ENV DB_USERNAME=${DB_USERNAME}
ENV DB_PASSWORD=${DB_PASSWORD}

# Copia el archivo .env.example y luego establece las variables de entorno
RUN cp .env.example .env \
    && sed -i "s/DB_HOST=.*/DB_HOST=${DB_HOST}/" .env \
    && sed -i "s/DB_PORT=.*/DB_PORT=${DB_PORT}/" .env \
    && sed -i "s/DB_DATABASE=.*/DB_DATABASE=${DB_DATABASE}/" .env \
    && sed -i "s/DB_USERNAME=.*/DB_USERNAME=${DB_USERNAME}/" .env \
    && sed -i "s/DB_PASSWORD=.*/DB_PASSWORD=${DB_PASSWORD}/" .env

# Genera una clave de aplicación
RUN php artisan key:generate

# Ejecuta las migraciones de la base de datos
# RUN php artisan migrate --seed

# Cambia los permisos de almacenamiento y caché
RUN chown -R www-data:www-data storage bootstrap/cache

# Expone el puerto 80 para HTTP
EXPOSE 80

# Comando para iniciar Apache
CMD ["apache2-foreground"]
