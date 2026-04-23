FROM php:8.2-apache

# Set the working directory
WORKDIR /var/www/html

# Copy application files
COPY . /var/www/html/

# Secure the container by running as a non-root user (www-data)
# Also change Apache's port to 8080 since non-root users cannot bind to ports < 1024
RUN chown -R www-data:www-data /var/www/html \
    && sed -i 's/80/8080/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf \
    && mkdir -p /var/run/apache2 \
    && chown -R www-data:www-data /var/run/apache2 /var/log/apache2 /etc/apache2

# Switch to the non-root user
USER www-data

# Expose port 8080
EXPOSE 8080

CMD ["apache2-foreground"]
