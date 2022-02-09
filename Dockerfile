FROM alpine:3.15
RUN apk add python3
RUN apk add git
CMD ["/bin/sh"]
