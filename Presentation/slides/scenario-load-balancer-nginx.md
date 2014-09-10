##  Scenario - Load Balancer - Nginx
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
        # List of application servers
        upstream client {
            server client:80;
        }
        upstream service {
            server service:3000;
        }
<!-- .element: class="nginx" -->
