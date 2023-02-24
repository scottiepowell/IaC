## Nginx Playbook

This playbook deploys a static website to an Nginx server. The playbook performs the following tasks:

-   Pings the target web hosts to ensure they are up
-   Ensures the latest version of Nginx is installed
-   Starts the Nginx service
-   Copies the Nginx config file to `/etc/nginx/sites-available/` and creates a symlink to it in `/etc/nginx/sites-enabled/`
-   Copies the content of the web site to the target hosts
-   Restarts the Nginx service

To run the playbook, specify the target web hosts in the `hosts` field of the YAML file, and execute the following command:

`ansible-playbook -i inventory nginx-playbook.yaml`

Note that the playbook assumes that the website content is located at `/home/scott/ansible/nginx-ansible/static-site-src/` and the Nginx config file is located at `/home/scott/ansible/nginx-ansible/static_site.cfg`. You may need to modify the paths to match your environment.

## stop-nginx.yml

This playbook stops the Nginx service and removes the Nginx package from all hosts. To run this playbook, execute the following command:

`ansible-playbook stop-nginx.yml`

## start-nginx.yml

This playbook updates the Nginx package to the latest version and starts the Nginx service on all hosts. To run this playbook, execute the following command:

`ansible-playbook start-nginx.yml`