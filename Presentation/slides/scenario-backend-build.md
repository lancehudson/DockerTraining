##  Scenario - Service - Build & Test

    docker build -t service .
    docker run -dP --name service-run service
    docker ps
<!-- .element: class="bash" -->

Find the port for the docker instance

    CONTAINER ID        IMAGE               COMMAND             CREATED
    STATUS              PORTS                               NAMES
    f30d67c587ea        service:latest      "node ."            10 seconds ago
    Up 9 seconds        0.0.0.0:49155->3000/tcp   service-run
<!-- .element: class="bash" -->

Open your browser to http://vmip:port/explorer

