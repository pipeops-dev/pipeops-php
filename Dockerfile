# Use an official PHP runtime as the base image
FROM php:7.4-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the application code to the container
COPY . /var/www/html

# Install any necessary PHP extensions or dependencies
RUN apt-get update && \
    apt-get install -y \
        # Add any additional dependencies here
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && a2enmod rewrite

# Expose port 80 for the Apache web server
EXPOSE 80

# Define environment variables if needed
# ENV MY_ENV_VAR=value

# Start the Apache web server
CMD ["apache2-foreground"]
