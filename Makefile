.PHONY: all clean build run stop

APP_NAME := main
APP_SRC := main.go
APP_PORT := 8080
DOCKER_COMPOSE := docker-compose.yml

# Build the application
build:
	go build -o $(APP_NAME) $(APP_SRC)

# Clean build artifacts
clean:
	rm -f $(APP_NAME)

# Run the server locally with live reloading using Gin
run:
	gin -i --all run $(APP_SRC)

# Build and run the server using Docker Compose
run-docker:
	make build
	docker-compose -f $(DOCKER_COMPOSE) up --build

# Stop the Docker containers
stop:
	docker-compose -f $(DOCKER_COMPOSE) down
