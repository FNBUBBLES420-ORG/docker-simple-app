

# This is a Example on how to use Docker for Beginners

## Download and install `Docker`
- **[Download Docker- arm64](https://desktop.docker.com/win/main/arm64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module)**
- **[Download_Docker- amd64](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module)**
- **Follow the Instruction to install `Docker Desktop App` if you need help**
### Join the Discord - [Fnbubbles420 Org Community](https://www.discord.fnbubbles420.org/invite)

## 1. Create the Project Files
- a. Create a Folder for Your Project:
Open your terminal or command prompt and create a directory:
```
mkdir docker-simple-app
cd docker-simple-app
```

- b. Create `app.js:`
Inside the `docker-simple-app` folder, create the `app.js` file. This will be your Node.js web server.

`app.js` content:
```
const http = require('http');
const port = 3000;

const requestHandler = (req, res) => {
  res.end('Hello, World from Docker!');
};

const server = http.createServer(requestHandler);

server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
```

- c. Create `package.json:`
Inside the same folder, create a `package.json` file. This will describe your app and its dependencies.

`package.json` content:
```
{
  "name": "docker-simple-app",
  "version": "1.0.0",
  "main": "app.js",
  "dependencies": {
    "http": "*"
  },
  "scripts": {
    "start": "node app.js"
  }
}
```

## 2. Create the `Dockerfile`
Inside the `docker-simple-app` folder, create a file named `Dockerfile`. This file tells Docker how to build the image.

`Dockerfile` content:
```
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
```

## 3. Build the Docker Image
After creating your project files, open your terminal or command prompt in the docker-simple-app folder and run the following command to build the Docker image:
```
docker build -t simple-node-app .
```
- `-t simple-node-app`: This tags the image with the name `simple-node-app`.
- `.`: This tells Docker to use the Dockerfile in the current directory.

## 4. Run the Docker Container
Once the image is built, you can run the container using:
```
docker run -p 3000:3000 simple-node-app
```
- `-p 3000:3000:` This maps port 3000 on your local machine to port 3000 in the Docker container.

## 5. Access the Application
Open your browser and go to:
```
http://localhost:3000
```

- You should see the message:
```
Hello, World from Docker!
```

## 6. Stop the Container
To stop the running container, press `CTRL + C` in the terminal where the container is running.


### List of running Docker Containers

```
docker ps -a
```

```
docker stop <container_id_or_name>
```

then do this commmand again to check:
```
docker ps -a
```
