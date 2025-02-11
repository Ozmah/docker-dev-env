# Use latest apache image using php 8.2 (Official)
FROM php:8.2-apache

# Install Apache extensions and enable necessary modules
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pgsql pdo_pgsql \
    && rm -rf /var/lib/apt/lists/*

# Switch from mpm_event to mpm_prefork and enable required modules
RUN a2dismod mpm_event && \
    a2enmod mpm_prefork rewrite proxy proxy_http

# Copy custom configuration
COPY custom-apache.conf /etc/apache2/conf-enabled/

# Expose port
EXPOSE 80