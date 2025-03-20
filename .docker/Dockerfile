# Usar PHP 8.3 con Apache (o 7.4 si CI3 lo requiere)
FROM php:8.3-apache

# Instalar dependencias necesarias para CodeIgniter
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    libpng-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libonig-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libmcrypt-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar extensiones PHP necesarias para CodeIgniter
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    pdo \
    pdo_pgsql \
    pgsql \
    zip \
    gd \
    curl \
    mbstring \
    xml \
    mysqli \
    pdo_mysql \
    bcmath

# Habilitar mod_rewrite y headers para Apache (esencial para .htaccess)
RUN a2enmod rewrite headers

# Configuración de Apache para permitir .htaccess
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Ajustar php.ini para CI
RUN { \
    echo 'short_open_tag = On'; \
    echo 'error_reporting = E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT'; \
    echo 'display_errors = On'; \
    echo 'log_errors = On'; \
    echo 'error_log = /var/log/php_errors.log'; \
    echo 'memory_limit = 256M'; \
    echo 'upload_max_filesize = 64M'; \
    echo 'post_max_size = 64M'; \
    echo 'max_execution_time = 300'; \
    echo 'date.timezone = UTC'; \
    } > /usr/local/etc/php/conf.d/ci-recommended.ini

# Configurar el directorio de trabajo
WORKDIR /var/www/html

# Asegurarse que el servidor Apache tenga un nombre de servidor
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Exponer el puerto 80
EXPOSE 80

# Iniciar Apache en primer plano
CMD ["apache2-foreground"]