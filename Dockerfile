FROM nginx:1.13.12-alpine
RUN apk update
RUN apk add dos2unix
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir /etc/nginx/ssl/
RUN chmod 777 /etc/nginx/ssl
COPY server.crt /etc/nginx/ssl/server.crt
COPY server.key /etc/nginx/ssl/server.key
RUN chmod 777 /etc/nginx/ssl/*
RUN dos2unix /etc/nginx/nginx.conf
RUN mkdir /etc/nginx/html/
RUN echo "<h2>This is from HTTP2 enabled container</h2>" > /etc/nginx/html/index.html
# Run NGINX
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
