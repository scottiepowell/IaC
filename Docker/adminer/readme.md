# MySQL and Adminer Docker Compose Example

This Docker Compose file sets up a MySQL database and an Adminer database management tool.

## Prerequisites

Before you can use this example, you need to have Docker and Docker Compose installed on your machine.

## Usage

To use this Docker Compose file, follow these steps:

1.  Open a terminal window in the directory containing the `docker-compose.yml` file.
    
2.  Set the environment variables in the `.env` file with the desired values.
    
3.  Run the following command to start the services:
    

Copy code

`docker-compose up -d`

This command starts the services defined in the Docker Compose file in the background.

4.  Access the Adminer web interface by navigating to [http://localhost:8181](http://localhost:8181/) in a web browser.
    
5.  Use the following credentials to log in to the Adminer interface:
    

-   System: MySQL
-   Server: dbserver
-   Username: The value of the `MY_SQL_USER` environment variable
-   Password: The value of the `MY_SQL_PASSWORD` environment variable
-   Database: The value of the `MY_SQL_DB` environment variable

6.  When you are finished using the services, run the following command to stop and remove the containers:

Copy code

`docker-compose down`

## Configuration

The following environment variables can be set in the `.env` file:

-   `MY_SQL_ROOT_PASSWORD`: The root password for the MySQL database. This is a required variable.
-   `MY_SQL_DB`: The name of the database to create. This is a required variable.
-   `MY_SQL_USER`: The name of the user to create for the database. This is a required variable.
-   `MY_SQL_PASSWORD`: The password for the user created for the database. This is a required variable.

## Services

The Docker Compose file defines the following services:

### Database Service (`db`)

This service sets up a MySQL database with the following configuration:

-   Image: `mysql:latest`
-   Authentication plugin: `mysql_native_password`
-   Container name: `dbserver`
-   Environment variables:
    -   `MYSQL_ROOT_PASSWORD`: The root password for the MySQL database
    -   `MYSQL_DATABASE`: The name of the database to create
    -   `MYSQL_USER`: The name of the user to create for the database
    -   `MYSQL_PASSWORD`: The password for the user created for the database
-   Port mapping: `3307:3306`
-   Volume mapping: `db:/var/lib/mysql`

### Adminer Service (`adminer_container`)

This service sets up the Adminer database management tool with the following configuration:

-   Image: `adminer:latest`
-   Environment variables:
    -   `ADMINER_DEFAULT_SERVER`: The name of the MySQL database server
    -   `ADMINER_DESIGN`: The name of the Adminer design to use
-   Port mapping: `8181:8080`

## Volumes

The Docker Compose file defines the following volume:

### Database Volume (`db`)

This volume is used to persist the MySQL database data.