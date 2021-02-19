.PHONY: build-icecast run-icecast build-rtmp run-rtmp

build-icecast:
	docker build -t silent-icecast -f Dockerfile.icecast .

run-icecast:
	docker run -d -p 8000:8000 silent-icecast:latest

build-rtmp:
	docker build -t silent-rtmp -f Dockerfile.rtmp .

run-rtmp:
	docker run -d -p 1935:1935 -p 8080:8080 silent-rtmp:latest
