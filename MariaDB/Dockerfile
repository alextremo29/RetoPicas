# Usa la imagen oficial de MariaDB 10.6.12
FROM mariadb:10.6.12

# Establece las variables de entorno para la base de datos
ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=laravel_database
ENV MYSQL_USER=laravel_user
ENV MYSQL_PASSWORD=laravel_password

# Copia el archivo de configuración personalizado si es necesario
# COPY my-custom.cnf /etc/mysql/conf.d/

COPY backup.sql /docker-entrypoint-initdb.d/

# Exponer el puerto de MariaDB (por defecto, 3306)
EXPOSE 3306

# Comando para iniciar el servidor de MariaDB
CMD ["mysqld"]
