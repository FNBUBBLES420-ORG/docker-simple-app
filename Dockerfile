# Use the official Node.js LTS image based on Alpine (smaller and minimal)
FROM node:lts-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install --production

# Copy the rest of the application files
COPY . .

# Expose the app port
EXPOSE 3000

# Command to start the app
CMD ["npm", "start"]
