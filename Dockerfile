# Use the official Nginx base image from the Docker Hub
FROM nginx:latest

# Copy custom configuration file from the current directory
# to the Nginx configuration directory in the container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy website files to the default Nginx public directory
COPY html/ /usr/share/nginx/html/

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]

