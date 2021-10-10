# Base layer for compiling
FROM golang:alpine as builder

WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY main.go .
RUN go build -o main .

# Minimal runtime image with the static binary 
FROM alpine:3.14

COPY --from=builder /app/main /bin/main

RUN adduser --disabled-password -u 1000 user
USER user

ENTRYPOINT [ "/bin/main"]
