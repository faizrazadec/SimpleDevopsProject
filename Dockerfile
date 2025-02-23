# Use nginx as the base image
FROM nginx:latest

# Remove default nginx html files
RUN rm -rf /usr/share/nginx/html/*

# Copy our HTML file into the container
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
