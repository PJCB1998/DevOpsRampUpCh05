#!/bin/bash

dir=$1

echo "Starting Users API"
cd $dir/users-api
echo "Clean Maven Install"
./mvnw clean install > $dir/logs/users-api-install
echo "Starting  User API on Port 8083"
JWT_SECRET=PRFT SERVER_PORT=8083 java -jar target/users-api-0.0.1-SNAPSHOT.jar &
echo "Users API Now Running"
