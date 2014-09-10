##  Management - Agent

    docker run -i -t -v /var/run/docker.sock:/docker.sock \
    -e IP=`ifconfig eth0| grep 'inet addr:' | cut -d: -f2 | awk '{print $1;}'` \
    -e URL=http://172.17.42.1:8000 -p 4500:4500 shipyard/agent
<!-- .element: class="bash" -->
