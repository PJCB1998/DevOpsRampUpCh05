#!/bin/bash

dir=$1

auth_api_pid=$(lsof | grep auth-api | awk 'NR>1{print $2}')
if [ -n "$auth_api_pid" ]; then
  echo "Auth API is already running with pid $auth_api_pid"
  exit 0
fi

sudo apt update
sudo apt install -y golang-go

echo "Starting Auth API"
cd $dir/auth-api
export GO111MODULE=on
echo "Init Auth API"
go mod init github.com/bortizf/microservice-app-example/tree/master/auth-api
go mod tidy
echo "Building Auth API"
go build > $dir/logs/auth-api-build
echo "Starting User API on Port 8000"
JWT_SECRET=PRFT AUTH_API_PORT=8000 USERS_API_ADDRESS=http://127.0.0.1:8083 ./auth-api &
echo "Auth API Now Running"
