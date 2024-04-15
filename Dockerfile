# Use a specific version of Node.js runtime as the base image
FROM node:8.17.0-alpine as build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install npm version 6.13.4
RUN npm install -g npm@6.13.4

# Install Angular CLI version 6.0.3
RUN npm install -g @angular/cli@6.0.3

# Install dependencies
RUN npm install

# Copy the Angular project files into the container
COPY . .

# Build the Angular app in production mode
RUN ng build

# Use Nginx as the web server to serve the Angular app
FROM nginx:alpine

# Copy the built Angular app from the 'build' stage to the NGINX html directory
COPY --from=build /app/dist/my-pizza-order-online /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# CMD to start NGINX, the default command for the NGINX image
CMD ["nginx", "-g", "daemon off;"]
