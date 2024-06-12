# Creating new network

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
docker run -d --name postgres-container --network mynetwork -e POSTGRES_PASSWORD=yourpassword -p 5432:5432 postgres:latest
```

```bash
docker run -d --name pgadmin-container --network mynetwork -e PGADMIN_DEFAULT_EMAIL=admin@example.com -e PGADMIN_DEFAULT_PASSWORD=yourpassword -p 8080:80 dpage/pgadmin4:latest
```
