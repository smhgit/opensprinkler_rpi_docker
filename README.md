# opensprinkler_rpi_docker

Add opensprinkler to docker-compose

```
  opensprinkler:
    container_name: opensprinkler
    image: opensprinkler
    privileged: true
    ports:
      - 8080:8080
    volumes:
      - /dev:/dev
      - ./data:/data
    restart: always
```
