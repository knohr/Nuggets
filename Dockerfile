#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM ubuntu

# Install Nginx.
#RUN apt-get install -y software-properties-common

RUN \ 
# add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
#VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
RUN rm /usr/share/nginx/html/index.html
COPY ./src/html/index.html /var/www/html/

#WORKDIR /etc/nginx
# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
