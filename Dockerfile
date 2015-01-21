#################################################
#
# Iodine Dockerfile v1.3
# http://code.kryo.se/iodine/
#
# Based on https://github.com/FiloSottile/Dockerfiles/blob/master/iodine/Dockerfile
#
# Run with:
# sudo docker run --privileged -p 53:53/udp -e IODINE_HOST=t.example.com -e IODINE_PASSWORD=1234abc wingrunr21/iodine
#
#################################################

# Use phusion/baseimage as base image.
FROM phusion/baseimage:0.9.16

MAINTAINER Stafford Brunk <stafford.brunk@gmail.com>

# Set environment variables and regen SSH host keys
ENV HOME /root
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Install iodine
RUN apt-get update && apt-get install -y net-tools iodine

# Add the runit iodine service
RUN mkdir /etc/service/iodined
ADD iodined.sh /etc/service/iodined/run

# Expose the DNS port, remember to run -p 53:53/udp
EXPOSE 53/udp

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
