##  LinuX Containers (LXC)

LXC is a userspace interface for the Linux kernel containment features.

* Namespaces (ipc, uts, mount, pid, network and user)

* Apparmor and SELinux profiles

* Seccomp policies

* Chroots (using pivot_root)

* Kernel capabilities

* Control groups (cgroups)

For more information: https://linuxcontainers.org/

note:
Part of the linux kernel

As such, LXC is often considered as something in the middle between a chroot on steroids and a full fledged virtual machine.

The goal of LXC is to create an environment as close as possible as a standard Linux installation but without the need for a separate kernel.

With LXC you get less isolation, but they are more lightweight and require less resources.
