# php-proxy docker container
A multiarch container of [php-proxy](https://www.php-proxy.com/).

# Docker Compose
```
version: '3.3'
services:
  php-proxy:
    container_name: php-proxy
    image: archef2000/php-proxy:latest
    environment:
      - PROXY_HTTPS=FALSE 
    ports:
      - '80:80/tcp'
    restart: on-failure
```

# Docker run
```
docker run -d \
	-p 80:80/tcp \
	--restart=on-failure \
	--name php-proxy \
	-e PROXY_HTTPS=FALSE \ 
	archef2000/php-proxy:latest
```

## Environment Variables
| Variable | Required | Function | Example |
|----------|----------|----------|----------|
|`PROXY_HTTPS`| No | If you use a reverse proxy with https set this to `TRUE` because php can't determine this and will redirect you to the http site |`PROXY_HTTPS=FALSE`|

## Port
| Port | Proto | Required | Function | Example |
|----------|----------|----------|----------|----------|
| `80` | TCP | Yes | php-proxy apache2 server TCP listening port | `80:80/tcp`|
