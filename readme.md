# Creating New Network

```bash
docker network create mynetwork
```

# Installing MySQL and PHPMyAdmin
```bash
docker run -d --name mysql-container --network mynetwork -e MYSQL_ROOT_PASSWORD=toor -p 3306:3306 mysql:latest

```

```bash
docker run -d --name phpmyadmin-container --network mynetwork -e PMA_HOST=mysql-container -e PMA_PORT=3306 -p 8080:80 phpmyadmin/phpmyadmin:latest
```

# Installing PostGres and PGAdmin
```bash
docker run -d --name postgres-container --network mynetwork -e POSTGRES_PASSWORD=toor -p 5432:5432 postgres:latest
```

```bash
docker run -d --name pgadmin-container --network mynetwork -e PGADMIN_DEFAULT_EMAIL=admin@example.com -e PGADMIN_DEFAULT_PASSWORD=yourpassword -p 8080:80 dpage/pgadmin4:latest
```


# Installing Redis 
```bash
docker run -d --name redis-stack -p 6379:6379 -p 8001:8001 redis/redis-stack:latest
```


# Installing Mailpit
```bash
docker run -d --name=mailpit-container -p 8025:8025 -p 1025:1025 axllent/mailpit
```

# Installing MongoDB
```bash
docker run --name mongodb -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=toor mongo
```

# Installing MSSQL
```base
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=toor" -p 1433:1433 --name sqlserver-container -d mcr.microsoft.com/mssql/server:2022-latest
```

# MinIO
```bash
docker run -p 9002:9000 -p 9001:9001 --name minio -e "MINIO_ROOT_USER=minioadmin" -e "MINIO_ROOT_PASSWORD=minioadmin" minio/minio server /data --console-address ":9001"
```
