## Mariadb Compose File

This `docker-compose.yml` file defines a Mariadb service.

### Prerequisites

-   Docker Engine
-   Docker Compose

### Usage

To start the Mariadb container, run:

shCopy code

`docker-compose up -d`

### Configuration

The following environment variables can be set to configure the Mariadb container:

-   `PUID`: The user ID for the container
-   `PGID`: The group ID for the container
-   `MYSQL_ROOT_PASSWORD`: The root password for the MySQL instance
-   `TZ`: The timezone for the container
-   `MYSQL_USER`: The user for the MySQL instance
-   `MYSQL_PASSWORD`: The password for the MySQL instance

Additionally, a volume is mounted to persist the configuration data for the Mariadb instance:

-   `~/mariadb/config:/config`: The directory for the config data in the host filesystem

### Access

The Mariadb service is available on port 3306.

### Stop the Container

To stop the container, run:

shCopy code

`docker-compose down`