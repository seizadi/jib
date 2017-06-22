# jib
It creates a container that will use Halyard to configure Spinnaker

# Create Spinnaker Halyard Container
This is the docker project for building Spinnaker Halyard Server

Right now it builds just one container for the Spinnaker server using Docker.
It will eventually require more containers using Docker Compose, do that later, [see this project](https://github.com/spinnaker/spinnaker/tree/master/experimental/docker-compose)


## Running This Container

```
docker build -t spinnaker-jib .
docker run --name soheil-jib -it spinnaker-jib
```

## New to Docker?

https://docs.docker.com/engine/reference/builder/
https://docs.docker.com/compose/gettingstarted/

### Common Docker Commands

```bash
  $  docker -help
  %  docker run -h
  %  docker images
  %  docker ps
  %  docker ps -all
  %  docker search httpd
  %  docker run --name ubuntu-test -it -v /Users:/data ubuntu
  %  docker attach ubuntu-test
  %  docker ls
  %  docker build -t spinnaker-jib .
  %  docker run --name soheil-jib -it spinnaker-jib
  %  docker rm soheil-jib
  %  docker rmi spinnaker-jib
```

### To SSH to a container by value
```bash
  %  docker ps
  %  docker exec -i -t 95689394064 /bin/bash
```

#### Advanced Commands
```bash
  $  docker rm `docker ps -a |grep -v IMAGE| awk '{print $1}'`
  $  docker rmi `docker images|grep -v IMAGE|awk '{print $3}'`
```
## Development

### To Build Image
```bash
$ docker build -t soheil-jib .
```

### To Push Image
```bash
docker tag spinnaker-jib:latest seizadi/spinnaker-jib:latest
docker push seizadi/spinnaker-jib:latest
```

### To Run
```bash
$ docker run --name soheil-jib -it spinnaker-jib
```

## Debug Notes

### Problem w/ DNS Lookup

Problem w/ suspend resume on Macbook from home to work, docker machine has the DNS Server Cached from docker machine and this can cause issues.

Stop and Start the docker machine to pickup the new DNS Server from new network.

```bash
seizadi$ docker-machine stop
Stopping "default"...
Machine "default" was stopped.

seizadi$ docker-machine start
Starting "default"...
(default) Check network to re-create if needed...
(default) Waiting for an IP...
Machine "default" was started.
Waiting for SSH to be available...
Detecting the provisioner...
Started machines may have new IP addresses. You may need to re-run the `docker-machine env` command.

seizadi$ eval `docker-machine env`
```

You can look at the new environment if you like:
```bash
seizadi$ docker-machine inspect
{
    "ConfigVersion": 3,
    "Driver": {
        "IPAddress": "192.168.99.100",
        "MachineName": "default",
        "SSHUser": "docker",
....
}
```
