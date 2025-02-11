# Docker Dev Environment

## v1.1 (Current)
### Changes
- Replaced full httpd.conf with custom configuration file
- Aligned DocumentRoot paths with default Apache Debian structure
- Updated volume mounting path to `/var/www/html`
- Improved maintainability by using conf-enabled approach

### Key Files Changed
- Removed: httpd.conf
- Added: custom-apache.conf
- Modified: docker-compose.yml (updated volume paths)
- Modified: Dockerfile (simplified configuration approach)

### Technical Details
- DocumentRoot changed from `/usr/local/apache2/htdocs` to `/var/www/html`
- Implemented Apache's conf-enabled pattern for better modularity
- Maintained all essential configurations while removing redundant ones

## v1.0 (Initial)
### Implementation
- Full Apache configuration replacement via httpd.conf
- DocumentRoot at `/usr/local/apache2/htdocs`
- Complete module configuration in single file
- Direct volume mounting to Apache's default path
