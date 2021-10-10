FROM golang:alpine

WORKDIR /app

COPY go.mod .
COPY go.sum .
COPY main.go .
RUN go mod download
RUN go build -o main .

ENTRYPOINT [ "/app/main"]
