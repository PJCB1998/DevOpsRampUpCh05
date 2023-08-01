#!/bin/bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

chmod +x download_app.sh
./download_app.sh

cd  microservice-app-example-master

dir=`pwd`

sudo apt update
sudo apt install -y redis-server python2
sdk use java 8.0.372-zulu


mkdir -p logs
mkdir -p zipkin

sudo service redis-server start

cd $dir/zipkin
pid_zipkin=$(lsof -i :9411 | awk 'NR>1{print $2}')
if [ -n "$pid_zipkin" ]; then
  echo "Zipkin is already running."
else
  echo "Starting Zipkin..."
  curl -sSL https://zipkin.io/quickstart.sh | bash -s
  java -jar zipkin.jar &
fi

cd $dir

#User API
chmod +x ../user_api.sh
../user_api.sh $dir

#Auth API
chmod +x ../auth_api.sh
../auth_api.sh $dir

#TODO API
chmod +x ../todo_api.sh
../todo_api.sh $dir

#Log Message Processor
chmod +x ../log_message_processor.sh
../log_message_processor.sh $dir

#Frontend
chmod +x ../frontend.sh
../frontend.sh $dir

echo "App Up and Running"

