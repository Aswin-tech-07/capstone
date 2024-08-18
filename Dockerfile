# Use an NGINX image as the base
FROM nginx:latest

# Copy the HTML and JavaScript files to NGINX's default directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
