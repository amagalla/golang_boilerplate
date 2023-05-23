# Use a minimal base image
FROM golang:alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files
COPY go.mod go.sum ./

# Download the Go modules
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go application
RUN go build -o app .

# Use a lightweight base image
FROM alpine

# Copy the built executable from the build stage
COPY --from=build /app/app /app/app

# Expose the port on which the application will run
EXPOSE 8080

# Set the working directory inside the container
WORKDIR /app

# Run the Go application
CMD ["./app"]
