#!/bin/bash

dir=$1

pid=$(pgrep -f "python3 main.py")
if [ -n "$pid" ]; then
  echo "Log message processor is already running (pid=$pid)."
  exit 0
fi

sudo apt update
sudo apt install -y python3 python3-pip

echo "Starting Log Message Processor"
cd $dir/log-message-processor
echo "Installing log message processor"
pip3 install -r requirements.txt
REDIS_HOST=127.0.0.1 REDIS_PORT=6379 REDIS_CHANNEL=log_channel python3 main.py &
echo "Log Messgae Processor Now Running"


