ode-Server Docker Compose

This is a Docker Compose file for running [Code-Server](https://github.com/cdr/code-server), a web-based code editor, on a server.

## Usage

1.  Set environment variables in a `.env` file.
2.  Run `docker-compose up -d` to start the services defined in the `docker-compose.yml` file.
3.  Access Code-Server in a web browser at `https://<hostname>:8443`.

## Compose file

The `docker-compose.yml` file defines a single service, `code-server`, based on the `lscr.io/linuxserver/code-server:latest` image. It mounts two volumes into the container:

-   `${DIRECTORY_DATA_CONFIG}:/config`
-   `${DIRECTORY_DATA_PY-DEV}:/home/py-dev`

It also sets the following environment variables:

-   `PUID=1000`: sets the user ID inside the container to 1000
-   `PGID=1000`: sets the group ID inside the container to 1000
-   `TZ=America/Denver`: sets the timezone inside the container to America/Denver
-   `PASSWORD=${password}`: sets the password for Code-Server authentication
-   `SUDO_PASSWORD=${sudo_password}`: sets the password for sudo
-   `DEFAULT_WORKSPACE=/config/workspace`: sets the default workspace directory
-   `DOCKER_MODS=linuxserver/mods:code-server-python3`: uses the `linuxserver/mods:code-server-python3` image for Docker mods

The `ports` section publishes port `8443` in the container to port `8443` on the host, and the `restart` section restarts the container unless stopped.

