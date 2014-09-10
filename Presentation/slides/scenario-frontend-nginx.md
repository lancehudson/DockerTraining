##  Scenario - Client - Nginx
    daemon off;
    worker_processes 1;

    events { worker_connections 1024; }

    http {
        sendfile on;
        gzip              on;
        gzip_http_version 1.0;
        gzip_proxied      any;
        gzip_min_length   500;
        gzip_disable      "MSIE [1-6]\.";
        gzip_types        text/plain text/xml text/css
<!-- .element: class="nginx" -->

                          text/comma-separated-values
                          text/javascript
                          application/x-javascript
                          application/atom+xml;

        server {
            listen 80;

            location / {
                root   /usr/local/app;
                index  index.html;
            }
        }
    }
<!-- .element: class="nginx" -->
