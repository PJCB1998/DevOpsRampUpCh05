#!/bin/bash

dir=$1

echo "Starting TODO API"
cd $dir/todos-api
echo "Clean Node Install"
rm package-lock.json
npm cache clean --force
npm install
echo "Starting TODO API on Port 8082"
JWT_SECRET=PRFT TODO_API_PORT=8082 npm start &
echo "TODO API Now Running"
