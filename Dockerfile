FROM nginx:alpine
COPY newpage.html /usr/share/nginx/html/index.html
EXPOSE 80

