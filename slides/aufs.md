##  AuFS

AuFS is a layered file system, so you can have a read only part, and a write part, and merge those together.

So you could have the common parts of the operating system as read only, which are shared amongst all of your containers, and then give each container its own mount for writing.

note:
So let's say you have a container image that is 1GB in size. If you wanted to use a Full VM, you would need to have 1GB times x number of VMs you want. With LXC and AuFS you can share the bulk of the 1GB and if you have 1000 containers you still might only have a little over 1GB of space for the containers OS, assuming they are all running the same OS image.

A full virtualized system gets its own set of resources allocated to it, and does minimal sharing. You get more isolation, but it is much heavier (requires more resources).

What docker does is it gives you the ability to snapshot the OS into a common image, and makes it easy to deploy on other docker hosts. Locally, dev, qa, prod, etc, all the same image. Sure you can do this with other tools, but not as easily or fast.
