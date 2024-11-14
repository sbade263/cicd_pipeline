# Use an official Nginx image from Docker Hub
FROM nginx:alpine

# Copy the index.html into the container’s default Nginx directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
