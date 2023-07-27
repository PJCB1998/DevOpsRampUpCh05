#!/bin/bash

dir=$1

echo "Starting Log Message Processor"
cd $dir/log-message-processor
echo "Installing log message processor"
pip3 install -r requirements.txt
REDIS_HOST=127.0.0.1 REDIS_PORT=6379 REDIS_CHANNEL=log_channel python3 main.py &
echo "Log Messgae Processor Now Running"


