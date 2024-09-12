#!/bin/bash

# Update and install dependencies for Docker
echo "Updating and installing necessary dependencies..."
sudo apt-get update -y
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key
echo "Adding Docker GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the Docker repository
echo "Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
echo "Installing Docker..."
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Enable and start Docker
echo "Starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

# Verify Docker installation
echo "Verifying Docker installation..."
docker --version

# Create Docker network
echo "Creating Docker network 'mynetwork'..."
docker network create mynetwork

# Run MySQL container
echo "Running MySQL container..."
docker run -d --name mysql-container --network mynetwork -e MYSQL_ROOT_PASSWORD=toor -p 3306:3306 mysql:latest

# Run phpMyAdmin container
echo "Running phpMyAdmin container..."
docker run -d --name phpmyadmin-container --network mynetwork -e PMA_HOST=mysql-container -e PMA_PORT=3306 -p 8080:80 phpmyadmin/phpmyadmin:latest

# Run PostgreSQL container
echo "Running PostgreSQL container..."
docker run -d --name postgres-container --network mynetwork -e POSTGRES_PASSWORD=yourpassword -p 5432:5432 postgres:latest

# Run pgAdmin container
echo "Running pgAdmin container..."
docker run -d --name pgadmin-container --network mynetwork -e PGADMIN_DEFAULT_EMAIL=admin@example.com -e PGADMIN_DEFAULT_PASSWORD=yourpassword -p 8080:80 dpage/pgadmin4:latest

# Run Redis container
echo "Running Redis container..."
docker run --name redis-container -d -p 6379:6379 -v redis-data:/data redis

# Run Mailpit container
echo "Running Mailpit container..."
docker run -d --name=mailpit-container -p 8025:8025 -p 1025:1025 axllent/mailpit

echo "All containers are set up and running!"
