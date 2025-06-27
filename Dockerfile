# Use a lightweight web server like Nginx
FROM nginx:alpine

# Copy HTML files into the Nginx web directory
COPY . /usr/share/nginx/html

# Expose default HTTP port
EXPOSE 8081
