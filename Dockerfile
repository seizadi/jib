FROM ubuntu:14.04
# FROM ubuntu:latest
# Ubuntu 14.04 only for now :( 
# https://github.com/spinnaker/spinnaker/issues/1544

RUN apt-get update -qq && \
    apt-get install -y apt-transport-https  software-properties-common curl

RUN adduser halyard

WORKDIR /home/halyard

RUN curl -O https://raw.githubusercontent.com/spinnaker/halyard/master/install/stable/InstallHalyard.sh && \
    bash InstallHalyard.sh -y --user halyard

