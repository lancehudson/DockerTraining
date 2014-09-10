##  Hello World

    docker run -d -p 1337:8080 helloworld
<!-- .element: class="bash" -->

### What Happened <!-- .element: class="fragment" data-fragment-index="1" -->

* Downloaded image from registry <!-- .element: class="fragment" data-fragment-index="1" -->
* Created Linux Container, Filesystem and Network adapter <!-- .element: class="fragment" data-fragment-index="1" -->
* Port forwarded 1337 to the container's 8080 <!-- .element: class="fragment" data-fragment-index="1" -->
* Ran web server in the container <!-- .element: class="fragment" data-fragment-index="1" -->
* -d: daemonize <!-- .element: class="fragment" data-fragment-index="1" -->
* -p: port mapping <!-- .element: class="fragment" data-fragment-index="1" -->

note:
SSH in
run container
goto http://ip-of-host:1337/
