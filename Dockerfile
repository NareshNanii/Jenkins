# Use a lightweight web server as base
FROM nginx:alpine

# Remove the default Nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML and assets into the web server directory
COPY . /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 8081

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
