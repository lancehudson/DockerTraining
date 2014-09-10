##  Scenario - Load Balancer - Build & Test

    docker build -t loadbalancer .
    docker run -d -p 80:80 --link client-run:client --link service-run:service\
        --name loadbalancer-run loadbalancer
    docker ps
<!-- .element: class="bash" -->

Find the port for the docker instance

    CONTAINER ID        IMAGE               COMMAND             CREATED
    STATUS              PORTS                               NAMES
    fbb2010a77cb        loadbalancer:latest   "/bin/sh -c 'service   2 seconds a
    Up 1 seconds        0.0.0.0:49162->80/tcp               loadbalancer-run
<!-- .element: class="bash" -->

Open your browser to http://vmip:port

