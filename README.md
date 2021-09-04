# Server

This is a System Administration project. I was discover Docker and set up your first web server.
Server on Debian Buster through Docker with a Wordpress, Phpmyadmin and Mysql runnning.

# Describe

#### to build image :
docker build -t ft_server .

#### to run image :
docker run -it -p 80:80 -p 443:443 ft_server

SSL auto-certificate is created
MySQL is automatically created
Wordpress is automatically setup
