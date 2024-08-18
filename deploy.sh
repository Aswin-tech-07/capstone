#!/bin/bash

# Stop any running containers
docker stop my_web_app || true

# Remove the existing container
docker rm my_web_app || true

# Start the container using docker-compose
docker-compose up -d
