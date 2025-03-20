# Docker SDE

## v1.2 (Current)

### Main Changes

-   Complete implementation of environment variables through `.env`
-   Improved directory structure with `.docker` folder to contain configuration files
-   Support for CodeIgniter with specific configurations
-   Modernized Apache configuration with virtualhost
-   PostgreSQL configuration with dedicated image

### New and Modified Files

-   Added: `.docker/Dockerfile` - Enhanced configuration for PHP 8.3 with full extension support
-   Added: `.docker/PSQL.Dockerfile` - Specific configuration for PostgreSQL 15
-   Added: `.docker/php/php.ini` - Custom PHP configuration
-   Added: `.env` and `.env.example` - Parameterized environment variables
-   Added: `000-default.conf` - VirtualHost configuration for Apache
-   Modified: `docker-compose.yml` - Updated version with environment variable support

### Technical Improvements

-   **Enhanced Portability**: Use of environment variables to adapt configuration to any environment
-   **Cross-platform Support**: Improvements to work on Windows, Linux, and macOS without modifications
-   **Improved Security**: Apache configuration to protect sensitive CodeIgniter directories
-   **PHP Extensions**: Full support for GD, ZIP, cURL, XML, PostgreSQL, and MySQL
-   **Persistent Volumes**: Volume configuration for PostgreSQL data
-   **Containerized Networks**: Implementation of dedicated bridge network for communication between services

## v1.1 (Previous)

### Changes

-   Replaced full httpd.conf with custom configuration file
-   Aligned DocumentRoot paths with default Apache Debian structure
-   Updated volume mounting path to `/var/www/html`
-   Improved maintainability using the conf-enabled approach

## v1.0 (Initial)

### Implementation

-   Full Apache configuration replacement via httpd.conf
-   DocumentRoot at `/usr/local/apache2/htdocs`
-   Complete module configuration in single file
-   Direct volume mounting to Apache's default path
