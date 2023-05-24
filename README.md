## Golang/Gin Docker Boilerplate

This is a sample boilerplate which includ Golang/Gin, Docker, and Makefile

## Gin Install

Install Gin

```bash
  go install github.com/gin-gonic/gin
```

Add Gin Path at end of file

```bash
  cd

  code .zshrc

  export PATH=$PATH:$HOME/go/bin
```

## Run Locally

```bash
  gin run main.go
```

## Run Docker-Compose

Run application through docker-compose

```bash
  make run
```

## Command

List of useful commands

```bash
  make help
```

## Server

Server runs on PORT 3000

## Client

Client run on PORT 8080
