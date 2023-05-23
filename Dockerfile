FROM golang:latest

WORKDIR /app

COPY ./go.mod ./go.sum ./
RUN go mod download

RUN go install github.com/githubnemo/CompileDaemon
RUN go get github.com/gin-gonic/gin

COPY . .

ENTRYPOINT CompileDaemon --build="go build -o main ./cmd/main/main.go" --command=./main
