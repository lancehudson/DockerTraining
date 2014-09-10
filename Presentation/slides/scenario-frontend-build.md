##  Scenario - Client - Build & Test

    docker build -t client .
    docker run -dP --name client-run client
    docker ps
<!-- .element: class="bash" -->

Find the port for the docker instance

    CONTAINER ID        IMAGE               COMMAND             CREATED
    STATUS              PORTS                               NAMES
    f30d67c587ea        client:latest      "node ."            10 seconds ago
    Up 9 seconds        0.0.0.0:49155->80/tcp   client-run
<!-- .element: class="bash" -->

Open your browser to http://vmip:port

