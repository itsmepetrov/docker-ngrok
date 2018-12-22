# ngrok

[![Docker repository](https://img.shields.io/docker/automated/itsmepetrov/ngrok.svg)](https://hub.docker.com/r/itsmepetrov/ngrok/) [![Build passing](https://img.shields.io/docker/build/itsmepetrov/ngrok.svg)](https://hub.docker.com/r/itsmepetrov/ngrok/)

A Docker image for [ngrok](https://ngrok.com/), introspected tunnels to localhost. The image is built using [Alpine Linux](https://hub.docker.com/_/alpine) to keep the footprint as small as possible.

The container will tunnel any traffic by using the `ngrok.yml` [file configuration](https://ngrok.com/docs#config). You can specify configuration via `CONFIG_STRING` environment variable or by using file `/home/ngrok/ngrok.yml` as a volume.

## Supported tags

* [latest](Dockerfile)
* [armhf](Dockerfile.armhf)

## Usage

### Configuration File

Create the `ngrok.yml` configuration file:

```yaml
authtoken: your_auth_token
tunnels:
  web:
    addr: 8080
    proto: http
```

Specify the configuration file as a volume:

```bash
docker run \
  --name ngrok \
  --volume $(pwd)/ngrok.yml:/home/ngrok/ngrok.yml \
  itsmepetrov/ngrok
```

### Environment Variable

Create the configuration file `ngrok.yml`:

```yaml
authtoken: your_auth_token
tunnels:
  web:
    addr: 8080
    proto: http
```

Specify the configuration file as `CONFIG_STRING` variable:

```bash
docker run \
  --name ngrok \
  --env CONFIG_STRING="$(cat ngrok.yml)" \
  itsmepetrov/ngrok
```

### Docker Compose

Create the `docker-compose.yml` file:

```yaml
version: '3'
services:
  ngrok:
    image: itsmepetrov/ngrok:latest
    restart: always
    network_mode: host
    environment:
      CONFIG_STRING: |
        authtoken: your_auth_token
        tunnels:
          web:
            addr: 8080
            proto: http
```

## Credits

Special thanks to [@wernight](https://github.com/wernight) becase it's based on his [work](https://github.com/wernight/docker-ngrok).

## License

Licensed under [MIT](LICENSE)