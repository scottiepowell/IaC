# Docker Compose Configuration for Guacamole

This Docker Compose configuration sets up a Guacamole environment with guacd, PostgreSQL, and Guacamole containers. The Guacamole environment is connected to the `nginxproxymanager_default` network for bridged communication.

## Prerequisites

-   Docker
-   Docker Compose

## Configuration

### Networks

This configuration creates the `nginxproxymanager_default` network and sets the driver to `bridge`. This network is used to connect the containers for the Guacamole environment.

### Services

#### guacd

The `guacd` service uses the `guacamole/guacd` image to provide the Guacamole daemon. It is linked to the `nginxproxymanager_default` network and restarted automatically. It also mounts two volumes to `/drive` and `/record` for data storage.

#### postgres

The `postgres` service uses the `postgres:13.4-buster` image to provide the PostgreSQL database for Guacamole. It is linked to the `nginxproxymanager_default` network, restarted automatically, and uses environment variables for its configuration. It also mounts two volumes to `/init` and `/data` for initialization scripts and data storage.

#### guacamole

The `guacamole` service uses the `guacamole/guacamole` image to provide the Guacamole web application. It depends on the `guacd` and `postgres` services, is linked to the `nginxproxymanager_default` network, and restarted automatically. It also exposes port `8080` for the Guacamole web application.

## Usage

To use this Docker Compose configuration, clone this repository and run the following command:

Copy code

`docker-compose up -d`

This will create and start the containers for the Guacamole environment. You can then access the Guacamole web application by navigating to `http://localhost:8080/guacamole` in your web browser.

To stop and remove the containers, run the following command:

Copy code

`docker-compose down`