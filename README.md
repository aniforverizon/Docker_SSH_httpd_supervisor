# CentOS Base

[![](https://badge.imagelayers.io/ashrithr/centos-base:latest.svg)](https://imagelayers.io/?images=ashrithr/centos-base:latest 'Get your own badge on imagelayers.io')

CentOS Base image with ssh and supervisor for managing services

## Build

```
docker build -t ashrithr/centos-base .
```

## Usage

Here are sample examples of using this image:

**Detached mode**

  * `docker run -d ashrithr/centos-base` runs supervisord in foreground mode
  * `docker run -d ashrithr/centos-base touch test-file` runs `touch` command first then supervisord in foreground mode and its configured services

**Attached Mode**

  * `docker run -it ashrithr/centos-base /bin/bash` runs supervisord, then attaches the interactive shell

## Adding more services on top of this image

If you want to use this base image and launch services using supervisor, you could write supervisor configuration files and add them to `/etc/supervisor.d/`. For an example on using this base image look at [hadoop-docker](https://github.com/ashrithr/docker-hadoop).
