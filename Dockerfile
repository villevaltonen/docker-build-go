FROM golang:alpine as builder

WORKDIR /app
COPY go.mod .
COPY go.sum .
COPY main.go .
RUN go build -o main .

ENTRYPOINT [ "/app/main"]
