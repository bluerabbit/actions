FROM alpine:latest

RUN apk --no-cache add jq bash curl git

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
