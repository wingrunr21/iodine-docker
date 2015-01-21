# iodine-docker

Docker image for [Iodine](http://code.kryo.se/iodine/). Originally based on the
Dockerfile from [FiloSottile](https://github.com/FiloSottile/Dockerfiles/tree/master/iodine)

## Usage

    docker pull wingrunr21/iodine
    docker run -d --privileged -p 53:53/udp -e IODINE_HOST=t.example.com -e IODINE_PASSWORD=1234password wingrunr21/iodine

### Environment Variables
* `IODINE_HOST` - the domain where your iodine server is running
* `IODINE_PASSWORD` - the password for your iodine server
* `IODINE_TUNNEL_IP` - the server tunnel ip. Optional and defaults to 10.0.0.1.
