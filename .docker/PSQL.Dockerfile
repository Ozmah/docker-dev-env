# Use PostgreSQL 15 (latest stable at the time of writing)
FROM postgres:15

# Custom configurations can be added here if needed
# For example:
# COPY .docker/postgres/postgresql.conf /etc/postgresql/postgresql.conf

# PostgreSQL uses the default entrypoint from the base image