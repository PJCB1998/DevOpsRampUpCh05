#!/bin/bash

# Kill the auth-api process
pid=$(lsof | grep auth-api | awk 'NR>1{print $2}')
if [ -n "$pid" ]; then
  kill -9 $pid
fi

# Kill the zipkin process
pid=$(lsof -i :9411 | awk 'NR>1{print $2}')
if [ -n "$pid" ]; then
  kill -9 $pid
fi

# Kill the python3 main.py process
pid=$(lsof | pgrep -f "python3 main.py" | awk 'NR>1{print $2}')
if [ -n "$pid" ]; then
  kill -9 $pid
fi

# Kill the process running on port 8082
pid=$(lsof -i :8082 | awk 'NR>1{print $2}')
if [ -n "$pid" ]; then
  kill -9 $pid
fi

# Kill the process running on port 8080
pid=$(lsof -i :8080 | awk 'NR>1{print $2}')
if [ -n "$pid" ]; then
  kill -9 $pid
fi

# Kill the process running on port 8083
pid=$(lsof -i :8083 | awk 'NR>1{print $2}')
if [ -n "$pid" ]; then
  kill -9 $pid
fi

# Kill the redis server process
pid=$(lsof | grep redis | awk 'NR>1{print $2}')
if [ -n "$pid" ]; then
  sudo kill -9 $pid
fi