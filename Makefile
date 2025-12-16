
TELEGRAM_BOT_APIKEY=`cat .apikey`

build:
	echo ${TELEGRAM_BOT_APIKEY}
	sudo docker build --build-arg TELEGRAM_BOT_APIKEY=${TELEGRAM_BOT_APIKEY} -t telegram-notifier-py .

run: build
	sudo docker run -p 80:80 telegram-notifier-py
