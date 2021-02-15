
# 64k opus in an ogg (seems to not be supported by iPhone)

ffmpeg -re -i $INPUT_FILE -c:a libopus -vbr on -b:a 64k -content_type 'audio/ogg' -vn -f opus icecast://source:A8A3DD93C15E@localhost:8000/silent_disco_re

# 128k mp3 via lame (works natively on iPhone)

ffmpeg -re -i $INPUT_FILE -c:a libmp3lame -b:a 128k -content_type 'audio/mpeg' -vn -f mp3 icecast://source:A8A3DD93C15E@localhost:8000/silent_disco_mp3

