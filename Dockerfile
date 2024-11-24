# Use the official Node.js LTS image based on Alpine
FROM node:lts-alpine

# Set environment variables for production
ENV NODE_ENV=production

# Update apk and explicitly install OpenSSL and other necessary dependencies
RUN apk update && apk add --no-cache openssl bash

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package.json package-lock.json ./

# Install dependencies securely
RUN npm ci --only=production

# Copy the rest of the application files
COPY . .

# Expose the app port
EXPOSE 9090

# Command to start the app
CMD ["npm", "start"]
