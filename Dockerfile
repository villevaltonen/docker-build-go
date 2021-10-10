# Base layer for compiling the application
FROM golang:alpine as builder

WORKDIR /app

COPY go.mod .
COPY go.sum .
COPY main.go .
RUN go mod download
RUN go build -o main .

# A minimal runtime image with the static binary
FROM alpine:3.14

COPY --from=builder /app/main /bin/main

ENTRYPOINT [ "/bin/main"]
