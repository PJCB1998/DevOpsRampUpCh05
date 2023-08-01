#!/bin/bash

dir=$1

pid=$(lsof -i :8082 | awk 'NR>1{print $2}')

if [ -n "$pid" ]; then
  echo "TODO API is already running (pid=$pid)."
  exit 0
else
  sudo apt update
  sudo apt install -y npm 

  echo "Starting TODO API"
  cd $dir/todos-api
  echo "Clean Node Install"
  rm package-lock.json
  npm cache clean --force
  npm install
  echo "Starting TODO API on Port 8082"
  JWT_SECRET=PRFT TODO_API_PORT=8082 npm start &
  echo "TODO API Now Running"
fi

