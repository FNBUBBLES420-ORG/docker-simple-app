# Use the official Node.js LTS image based on Alpine
FROM node:lts-alpine

# Update apk and explicitly install OpenSSL
RUN apk update && apk add --no-cache openssl

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install --production

# Copy the rest of the application files
COPY . .

# Expose the app port
EXPOSE 9090

# Command to start the app
CMD ["npm", "start"]
