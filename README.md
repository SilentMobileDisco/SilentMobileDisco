# SilentMobileDisco

## Icecast

### Building the Server

```
make build-icecast
```

### Running the server

```
make run-icecast
```

### To stream

```
ffmpeg -re -i ${INPUT_FILE} -c:a libmp3lame -b:a 128k -content_type 'audio/mpeg' -vn -f mp3 icecast://source:A8A3DD93C15E@${YOUR_IP_OR_HOSTNAME_OR_LOCALHOST}:8000/silent-disco.mp3
```

### To listen

Open `http://${YOUR_IP_OR_HOSTNAME}:8000` in a desktop or mobile browser

