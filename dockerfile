# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install
RUN npm run start
RUN npm run build
RUN npm run bundle

# Copy the rest of the application source code to the working directory
COPY . .

# Expose a port for your Node.js application (replace 3000 with your app's port)
EXPOSE 3000

# Define the command to run your Node.js application
CMD [ "node", "app.js" ]
