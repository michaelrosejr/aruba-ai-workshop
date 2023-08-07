TAG=`date +"%Y-%m-%d_%H%M%S"`
docker build -t aruba-ai-workshop:$TAG --no-cache .
