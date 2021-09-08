# eji-moe-docker

This is a repository whose aim is to automate setting up whatever I want on a VPS.

This is not configurable, and is only public because I don't want to set up GitHub keys and install Git. Do not open an issue or message me for help. You will be ignored.

## Usage

This requires Docker. Make sure to install it before running. On Alpine, the command is as follows:

```sh
apk add docker docker-compose
rc-service docker start
```

Here is everything else needed to get started:

```sh
wget https://github.com/pyxiis/eji-moe-docker/archive/refs/heads/master.zip
unzip master.zip
sh eji-moe-docker-master/start.sh
```
