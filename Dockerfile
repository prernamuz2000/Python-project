# Use the official Nginx image from the Docker Hub
FROM nginx:latest

# Copy custom Nginx config file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy static website files to the default Nginx public directory
COPY ./html/ /usr/share/nginx/html/

# Expose port 80 to the outside world
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon on;"]

