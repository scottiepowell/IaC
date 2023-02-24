## Nginx Load Balancer

The Nginx Load Balancer script sets up a load balancer for Kubernetes control plane servers. It uses the least_conn algorithm to distribute traffic evenly among the control plane servers. The script also sets up a health check endpoint at `/health` on the load balancer. The health check endpoint returns a 200 OK HTTP response if the control plane servers are reachable on port 6443. This script does not include SSL/TLS.

## Nginx Load Balancer with SSL/TLS

The Nginx Load Balancer with SSL/TLS script sets up a load balancer for Kubernetes control plane servers with SSL/TLS enabled. It uses a self-signed SSL certificate to secure the traffic between the client and the load balancer. This script includes the same load balancer setup as the Nginx Load Balancer script but also includes SSL/TLS configuration.

# Load Balancer Script

This script installs and configures an nginx load balancer to distribute traffic across a cluster of Kubernetes API servers. It uses the least connections algorithm to balance the traffic.

## Possible Use Cases

This script is useful when deploying a high availability (HA) cluster with multiple Kubernetes API servers. By using a load balancer, it can ensure that incoming requests are distributed evenly across the available API servers, improving reliability and performance.

## Execution

1.  Save the script as a file, for example, `load_balancer.sh`
2.  Make it executable with `chmod +x load_balancer.sh`
3.  Execute it with `./load_balancer.sh`

The script will install and configure nginx, create an nginx configuration file, and start the nginx service.

## Verification

To verify that the script has successfully configured the load balancer, you can check the health of the API servers using the following command:

`curl -I http://<load_balancer_ip>:6443/health`

Replace `<load_balancer_ip>` with the IP address of the machine running the load balancer. If the API servers are healthy and reachable, the response code should be 200.




