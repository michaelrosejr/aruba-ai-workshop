#/bin/bash

if test -f images/iris.png; then
	rm images/iris.png
	echo "Deleted iris.png file."
fi
printf "Generating updated requirements.txt file:\t\t"
poetry export --without-hashes --format=requirements.txt > requirements.txt
printf "[Done]\n"

printf "Building docker iamge:\t\t"
TAG=`date +"%Y-%m-%d_%H%M%S"`
#docker build -t aruba-ai-workshop:$TAG --no-cache .
# docker build -t aruba-ai-workshop:$TAG -t aruba-ai-workshop:latest .
docker build -t aruba-ai-workshop:$TAG -t aruba-ai-workshop:latest --no-cache .
printf "[Done]\n"
