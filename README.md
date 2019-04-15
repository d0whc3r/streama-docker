# Streama docker

Docker for streama compatible with mysql

## Build docker using repo

1- Clone repo

```bash
git clone https://github.com/d0whc3r/streama-docker.git
cd streama-docker
```

2- Build image

```bash
docker build -t streama .
```

3- Run streama server

```bash
docker run -d --name streama-server -v $PWD/streama-database:/streama -v $PWD/streama-files:/data/streama -p 8080:8080 d0whc3r/streama-docker
```

By default streama server runs with H2 database stored in /streama/database and uploads are stored in /data/streama
