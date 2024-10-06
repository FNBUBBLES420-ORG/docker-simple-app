# Use the official Node.js version 20 image
FROM node:20

# Set working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the app port
EXPOSE 3000

# Command to start the app
CMD ["npm", "start"]
