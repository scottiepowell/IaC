# Grafana Docker Compose File

This Docker Compose file defines a Grafana service that runs the latest version of the Grafana image.

## Installation

1. Install Docker and Docker Compose on your system if you haven't already.
2. Download the `docker-compose.yml` file to your local system.
3. Open a terminal window and navigate to the directory where the `docker-compose.yml` file is located.
4. Run the following command to start the Grafana service: `docker-compose up -d`.
5. Grafana should now be running on `http://localhost:3000`.

## Configuration

This Compose file uses the following configuration:

### Volumes

- `grafana-data`: A local volume for persisting Grafana data.

### Services

- `grafana`: The Grafana service.
  - Image: `grafana/grafana-oss:latest`
  - Container name: `grafana`
  - Ports: `3000:3000`
  - Volumes: `grafana-data:/var/lib/grafana`
  - Restart policy: `unless-stopped`

### Networks

- `default`: The network named `nginxproxymanager_default` (external).