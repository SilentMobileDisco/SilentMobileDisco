.PHONY: build run

build:
	docker build -t silent-icecast -f Dockerfile .

run:
	docker run -d -p 8000:8000 silent-icecast:latest
