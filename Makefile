.PHONY: all clean build run stop test docker-build docker-run docker-stop docker-build-compose npm

APP_NAME := main
NODE_MODULES := node_modules
APP_SRC := main.go
APP_PORT := 3000
DOCKER_COMPOSE := docker-compose.yml

# Build the application
build-local:
	go build -o $(APP_NAME) $(APP_SRC)

# Clean build artifacts
clean:
	rm -rf $(APP_NAME) $(NODE_MODULES)

# Run the server locally
run-local:
	go run $(APP_SRC)

# Run the server locally with live reloading using gin
run-live:
	gin run $(APP_SRC)

# Build the Docker image
docker-build:
	docker build -t $(APP_NAME) .

# Run the server using Docker
docker-run: docker-build
	docker run -p $(APP_PORT):$(APP_PORT) $(APP_NAME)

# Stop the Docker container
docker-stop:
	docker stop $$(docker ps -q --filter ancestor=$(APP_NAME))

npm:
	npm install

# Build the application with docker-compose
build:
	docker-compose -f $(DOCKER_COMPOSE) build

# Run the application with docker-compose
run: npm build
	docker-compose -f $(DOCKER_COMPOSE) up

# Stop the Docker containers
stop:
	docker-compose -f $(DOCKER_COMPOSE) down

# Run tests
test:
	go test -v ./...

# Run all targets
all: clean build test docker-run

# Help target
help:
	@echo "Available targets:"
	@echo "  build-local         - Build the application"
	@echo "  clean               - Clean build artifacts"
	@echo "  run-local           - Run the server locally"
	@echo "  run-live            - Run the server locally with live reloading using gin"
	@echo "  docker-build        - Build the Docker image"
	@echo "  docker-run          - Run the server using Docker"
	@echo "  docker-stop         - Stop the Docker containers"
	@echo "  build		      - Build the application with docker-compose"
	@echo "  run  		      - Run the application with docker-compose"
	@echo "  stop                - Stop the Docker containers"
	@echo "  test                - Run tests"
	@echo "  all                 - Clean, build, test, and run using Docker"
	@echo "  npm		      - installs node dependencies"
	@echo "  help                - Show this help message"

# Default target
default: help
