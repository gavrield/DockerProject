FROM alpine:3.15
RUN apk add python3
CMD ["tail", "-f", "/dev/null"]
