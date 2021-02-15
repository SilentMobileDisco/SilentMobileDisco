FROM moul/icecast
ADD server/icecast.xml /etc/icecast2

COPY client /usr/share/icecast2/web/listen