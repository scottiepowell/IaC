# Nginx Proxy Manager Docker Compose

This is a Docker Compose file that sets up an instance of the `jc21/nginx-proxy-manager` image along with a MariaDB database for persistent storage. The Nginx Proxy Manager is a powerful reverse proxy that can be used to manage web servers and SSL certificates.

## Requirements

-   Docker
-   Docker Compose

## Usage

1.  Clone this repository:
    
    shCopy code
    
    `git clone https://github.com/your_username/nginx-proxy-manager-docker-compose.git`
    
2.  Create an `.env` file with the necessary environment variables:
    
    shCopy code
    
    `# Database configuration ROOT_PASSWORD=<root_password> DB_NAME=<db_name> DB_USER=<db_user> DB_PASSWORD=<db_password>  # Nginx Proxy Manager configuration DB_HOST=db DB_PORT=3306`
    
    Replace `<root_password>`, `<db_name>`, `<db_user>`, and `<db_password>` with your preferred values.
    
3.  Start the services:
    
    shCopy code
    
    `docker-compose up -d`
    
    This will start the `app` and `db` services in the background.
    
4.  Access the Nginx Proxy Manager:
    
    Open a web browser and go to `http://localhost:81`. You should be redirected to `https://localhost`, where you can log in with the default username and password (`admin@example.com` / `changeme`).
    

## Customization

### Ports

By default, the services are exposed on ports `80`, `81`, and `443`. You can change these values by modifying the `ports` section in the `docker-compose.yml` file.

### Data volumes

The `data` and `letsencrypt` directories are used to store persistent data and SSL certificates. You can modify these directories to suit your needs by changing the `volumes` section in the `docker-compose.yml` file.

### MariaDB configuration

You can modify the database configuration by changing the values in the `.env` file.

### Nginx Proxy Manager configuration

You can modify the Nginx Proxy Manager configuration by changing the values in the `.env` file. Note that the `DB_HOST` variable should be set to `db` in this case, since this is the name of the database service in the Compose file.