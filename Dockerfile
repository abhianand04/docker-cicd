# Use official Node.js version 18 as base image
# This already contains Node + npm installed
FROM node:18


# Set working directory inside container
# All next commands will run inside /app folder
WORKDIR /app


# Copy only package.json and package-lock.json first
# This helps Docker cache dependencies
# (faster rebuilds if code changes later)
COPY package*.json ./


# Install all npm dependencies inside container
RUN npm install


# Copy remaining project files into container
# (index.js, routes, controllers, etc.)
COPY . .


# Tell Docker that application runs on port 9000
# Documentation purpose (does not publish port)
EXPOSE 9000


# Default command executed when container starts
# Runs your Node.js server
CMD ["node", "index.js"]