FROM golang
COPY ./build.sh /go/build.sh
RUN chmod +x /go/build.sh
CMD /go/build.sh