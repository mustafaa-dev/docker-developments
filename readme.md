# Creating new network

```bash
docker network create mynetwork
```

# Installing MySQL and PHPMyAdmin
```bash
docker run -d - name mysql-container - network=mynetwork -e MYSQL_ROOT_PASSWORD=toor -p 3306:3306 mysql:latest
```

```bash
docker run -d - name phpmyadmin-container - network=mynetwork -e PMA_HOST=mysql-container -e PMA_PORT=3306 -p 8080:80 phpmyadmin/phpmyadmin:latest
```
