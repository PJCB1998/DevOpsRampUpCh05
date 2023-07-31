#!/bin/bash

dir=$1

pid=$(lsof -i :8080 | awk 'NR>1{print $2}')

if [ -n "$pid" ]; then
  echo "Frontend is already running (pid=$pid)."
  exit 0
else
  echo "Starting Frontend"
  cd $dir/frontend
  echo "Clean Node Install"
  rm package-lock.json
  npm cache clean --force
  npm install
  echo "Starting Frontend on Port 8080"
  npm run build
  PORT=8080 AUTH_API_ADDRESS=http://127.0.0.1:8000 TODOS_API_ADDRESS=http://127.0.0.1:8082 npm start &
  echo "Frontend Now Running"
fi