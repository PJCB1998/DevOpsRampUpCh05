#!/bin/bash

dir=$1

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


