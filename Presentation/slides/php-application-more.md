##  PHP Application - More

View logs

    docker logs --tail="all" -f icecoder-run
<!-- .element: class="bash" -->

Save an image to a tar archive

    docker save icecoder > icecoder.tar
<!-- .element: class="bash" -->

Load an image from a tar archive on STDIN

    docker load < icecoder.tar
<!-- .element: class="bash" -->

note:

save: Produces a tarred repository to the standard output stream. Contains all parent layers, and all tags + versions, or specified repo:tag.


save and load go together, special format
