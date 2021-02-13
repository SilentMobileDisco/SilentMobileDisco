.PHONY: build run

build:
	docker build -t silent-rtmp -f Dockerfile .

run:
	docker run -it -p 1935:1935 -p 8080:8080 -p 80:80 silent-rtmp:latest
