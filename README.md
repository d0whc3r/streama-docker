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

## Run streama server

```bash
docker run -d --name streama-server -v $PWD/streama-database:/streama -v $PWD/streama-files:/data/streama -p 8080:8080 d0whc3r/streama
```

By default streama server runs with H2 database stored in /streama/database and uploads are stored in /data/streama

## Default paths

- Path for H2 database: /streama/database
- Path for uploaded: /data/streama

## Environment variables

These are the environment variables and its default values

### Database election

- `environments.production.dataSource.driverClassName` org.h2.Driver
- `environments.production.dataSource.url` jdbc:h2:/streama/database;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE
- `environments.production.dataSource.username` root
- `environments.production.dataSource.password` ""

### For mysql

- `environments.production.dataSource.driverClassName` com.mysql.jdbc.Driver
- `environments.production.dataSource.url` jdbc:mysql://\<MYSQL_HOST>:[MYSQL_PORT]/\<MYSQL_DATABASE>
- `environments.production.dataSource.username` \<MYSQL_USERNAME>
- `environments.production.dataSource.password` \<MYSQL_PASSWORD>

### Server port

- `server.port` 8080

