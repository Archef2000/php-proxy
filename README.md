# php-proxy docker container
A multiarch container of [php-proxy](https://www.php-proxy.com/).

# Docker Compose
```
version: '3.3'
services:
  php-proxy:
    container_name: php-proxy
    image: archef2000/php-proxy:latest
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
	archef2000/php-proxy:latest
```

## Ports
| Port | Proto | Required | Function | Example |
|----------|----------|----------|----------|----------|
| `80` | TCP | Yes | php-proxy apache2 server TCP listening port | `80:80/tcp`|
