---
title: Put your docker images on a diet
tags:
- alpine
- docker
---
<img class="thumbnail" src="/img/personal/posts/2015/Docker_(container_engine)_logo.png" />
When running `docker images` you'll see the following, images weigthing several hundred of MBs. Even simple container, providing one singe service are heavy. Why ? Because base images used, such as Ubuntu, Centos and Debian images are themselves very heavy.

Images based on busybox could have been an alternative, but is too far from full-featured linux OSses, we're used to. And building images from busybox aren't straigforward, and often requires compilation from source.

Let me introduce [Alpine linux](https://www.alpinelinux.org/), a lightweight Linux distribution. Alpine linux popularity is increasing among the docker community. Once discovered, people are rebasing their Dockerfile with it, and are amazed how simple the switch was. I started using Alpine long before it became official on DockerHub and started creating my own php/nginx/mariadb/container, instead of using the heavy official ones. 

Several images using Alpine as a base are available on DockerHub and their number are increaseing. My own build are publicly available on [DockerHub](https://hub.docker.com/u/killerwolf/). Feel free to use and fork them on [Github](https://github.com/killerwolf/Dockerfiles).