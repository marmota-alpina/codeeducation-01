FROM golang:1.16 as builder

WORKDIR /usr/src/myapp
COPY ./src .

RUN go build -ldflags "-s -w" -v -o app

FROM scratch

WORKDIR /usr/bin

COPY --from=builder /usr/src/myapp/app .

CMD ["/usr/bin/app"]