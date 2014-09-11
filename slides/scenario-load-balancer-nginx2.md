##  Scenario - Load Balancer - Nginx - Cont
        # Configuration for the server
        server {

            listen 80;

            location /api {
                proxy_pass         http://service/api;
                proxy_redirect     off;
                proxy_set_header   Host $host;
                proxy_set_header   X-Real-IP $remote_addr;
                proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
<!-- .element: class="nginx" -->

                proxy_set_header   X-Forwarded-Host $server_name;

            }

            location / {
                proxy_pass         http://client;
                proxy_redirect     off;
                proxy_set_header   Host $host;
                proxy_set_header   X-Real-IP $remote_addr;
                proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header   X-Forwarded-Host $server_name;

            }
        }
    }
<!-- .element: class="nginx" -->