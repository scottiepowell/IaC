# Docker Compose for Portainer Community Edition

This is a Docker Compose file that sets up an instance of Portainer Community Edition, which is a web-based GUI for managing Docker containers, images, networks, and volumes. The Compose file also mounts the host's Docker socket file into the container, allowing Portainer to communicate with the Docker daemon on the host.

To use this Compose file:

1.  Install Docker and Docker Compose on your system, if they are not already installed.
2.  Create a directory on your system to hold the Compose file and any data that Portainer will need to persist. For example, `mkdir ~/portainer`.
3.  Create a `docker-compose.yml` file with the contents of the provided file in the `~/portainer` directory.
4.  Start the Portainer container by running `docker-compose up -d`.
5.  Access the Portainer GUI by navigating to `http://localhost:9000` in your web browser.

You can log in to Portainer using the web-based GUI and manage your Docker environment from there.