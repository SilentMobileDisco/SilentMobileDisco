.PHONY: build run

build:
	docker build -t silent-rtmp -f Dockerfile .

run:
	docker run -d -p 1935:1935 -p 8080:8080 silent-rtmp:latest
