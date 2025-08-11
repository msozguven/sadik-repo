FROM alpine:3.21.3

WORKDIR /app

COPY .terraform /app/.terraform

RUN apk add --no-cache bash

CMD ["sleep", "infinity"]
