##  PHP Application - Build

Lets tag the broken one as 0.1

    docker tag icecoder icecoder:0.1
    docker images
<!-- .element: class="bash" -->

Lets build the fixed one

    docker build -t icecoder IceCoder
    docker images
<!-- .element: class="bash" -->

Lets start the fixed one

    docker rm icecoder-run
    docker run -d -p 1337:80 --name icecoder-run icecoder
<!-- .element: class="bash" -->
