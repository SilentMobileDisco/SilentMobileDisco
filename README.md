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
To stream audio from a file on your computer:
```
ffmpeg -re -i ${INPUT_FILE} -c:a libmp3lame -b:a 128k -content_type 'audio/mpeg' -vn -f mp3 icecast://source:A8A3DD93C15E@${YOUR_IP_OR_HOSTNAME_OR_LOCALHOST}:8000/silent-disco.mp3
```

I recommend downloading [BlackHole](https://github.com/ExistentialAudio/BlackHole) for piping audio between programs.

To stream from a device, find out which number to put into the ffmpeg command with:

```
ffmpeg -f avfoundation -list_devices true -i ""
```

Put the number of your device where ":0" is below

```
ffmpeg -re -f avfoundation -i ":0" -acodec libmp3lame -ab 128k -ac 1 -content_type 'audio/mpeg' -vn -f mp3 icecast://source:A8A3DD93C15E@${YOUR_IP_OR_HOSTNAME}:8000/silent-disco.mp3
```

### To listen

Open `http://${YOUR_IP_OR_HOSTNAME}:8000` in a desktop or mobile browser

### RPi Wifi driver issues

This thread details a fix for the wifi board crashing
https://www.raspberrypi.org/forums/viewtopic.php?t=271884
https://www.raspberrypi.org/forums/viewtopic.php?t=270534

