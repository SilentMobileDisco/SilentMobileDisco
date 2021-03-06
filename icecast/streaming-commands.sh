
# 64k opus in an ogg (seems to not be supported by iPhone)

ffmpeg -re -i $INPUT_FILE -c:a libopus -vbr on -b:a 64k -content_type 'audio/ogg' -vn -f opus icecast://source:A8A3DD93C15E@localhost:8000/silent-disco.ogg

# 128k mp3 via lame (works natively on iPhone)

ffmpeg -re -i $INPUT_FILE -c:a libmp3lame -b:a 128k -content_type 'audio/mpeg' -vn -f mp3 icecast://source:A8A3DD93C15E@localhost:8000/silent-disco.mp3

# Stream 128k mp3 from audio input device 0

ffmpeg -re -f avfoundation -i ":0" -acodec libmp3lame -ab 128k -ac 1 -content_type 'audio/mpeg' -vn -f mp3 icecast://source:A8A3DD93C15E@localhost:8000/silent-disco.mp3
