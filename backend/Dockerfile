# syntax=docker/dockerfile:1

FROM golang:1.18-alpine

# Install git and ca-certificates (needed to be able to call HTTPS)
#RUN apk --update add ca-certificates git

# Set environment vaariables
ENV APP_ENV production

# Move to working directory /app
WORKDIR /app

# Copy the code into the container
COPY . .

# Download dependencies using go mod
RUN go mod download

# Build the application's binary
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o main .

# Command to run the application when starting the container
CMD ["/app/main"]

# Expose port to use
EXPOSE 8243