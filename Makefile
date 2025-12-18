
PUSHOVER_APIKEY=`cat .apikey`
PUSHOVER_USERKEY=`cat .userkey`
VERSION=1.0.2
IMAGE_TAG=docker-registry.anastasiouhome.com:443/push-notifier-service:${VERSION}

build:
	sudo docker build \
		--build-arg PUSHOVER_APIKEY=${PUSHOVER_APIKEY} \
		--build-arg PUSHOVER_USERKEY=${PUSHOVER_USERKEY} \
		-t ${IMAGE_TAG} .

run: build
	sudo docker run -p 8080:8080 ${IMAGE_TAG}

publish: build
	sudo docker push ${IMAGE_TAG}
