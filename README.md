# This is an Example on How to Use Docker for Beginners

## Download and Install `Docker`
- **[Download Docker - arm64](https://desktop.docker.com/win/main/arm64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module)**
- **[Download Docker - amd64](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module)**
- **Follow the instructions to install `Docker Desktop App` if you need help**

# Join the discord if you need help 

[https://fnbubbles420.org/discordinvite](https://fnbubbles420.org/discordinvite)


## 1. Create the Project Files

- **a. Create a Folder for Your Project:**
  Open your terminal or command prompt and create a directory:
  ```bash
  mkdir docker-simple-app
  cd docker-simple-app

**b. Create** `app.js`: Inside the docker-simple-app folder, create the `app.js` file. This will be your Node.js web server.

`app.js` content:

```js
// app.js
const express = require('express');
const app = express();
const port = 9090;

app.get('/', (req, res) => {
  res.send('Hello, World! from bubblesthedev');
});

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});
```

**c. Create** `package.json`: Inside the same folder, create a `package.json` file. This will describe your app and its dependencies.

`package.json` content:

```json
{
  "name": "docker-simple-app",
  "version": "1.0.0",
  "lockfileVersion": 3,
  "requires": true,
  "packages": {
    "": {
      "name": "docker-simple-app",
      "version": "1.0.0"
    }
  },
  "description": "## Download and install `Docker` - **[Download Docker- arm64](https://desktop.docker.com/win/main/arm64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module)** - **[Download_Docker- amd64](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module)** - **Follow the Instruction to install `Docker Desktop App` if you need help** ### Join the Discord - [Fnbubbles420 Org Community](https://www.discord.fnbubbles420.org/invite)",
  "main": "app.js",
  "scripts": {
    "start": "node app.js",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "bubblesthedev",
  "license": "ISC",
  "dependencies": {
    "express": "^4.21.1"
  }
}
```

## 2. Create the Dockerfile

Inside the `docker-simple-app` folder, create a file named `Dockerfile``. This file tells Docker how to build the image.

`Dockerfile` content:

```Dockerfile
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
```

## 3. Build the Docker Image

After creating your project files, open your terminal or command prompt in the `docker-simple-app` folder and run the following command to build the Docker image:

```
docker build -t simple-node-app .
```

- `-t simple-node-app`: This tags the image with the name `simple-node-app`.
- `.`: This tells Docker to use the Dockerfile in the current directory.

## 4. Run the Docker Container

Once the image is built, you can run the container using:

```
docker run -p 9090:9090 simple-node-app
```

- `-p 9090:9090`: This maps port 9090 on your local machine to port 9090 in the Docker container.

## 5. Access the Application

Open your browser and go to:

```
http://localhost:9090
```

- You should see the message:

```
Hello, World! from bubblesthedev
```

## 6. Stop the Container

To stop the running container, press `CTRL + C` in the terminal where the container is running.

### List of Running Docker Containers

```
docker ps -a
```

### Stop a Specific Container

```
docker stop <container_id_or_name>
```

- Then run this command again to check:

```
docker ps -a
```
---
---
