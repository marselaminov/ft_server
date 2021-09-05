# Server

![image](https://user-images.githubusercontent.com/71525457/132119060-9fc6477e-a836-4444-86bb-505d6cc599e1.png)

This is a System Administration project. I was discover Docker and set up your first web server.
Server on Debian Buster through Docker with a Wordpress, Phpmyadmin and Mysql runnning.

# Describe

#### to build image :
docker build -t ft_server .

#### to run image :
docker run -it -p 80:80 -p 443:443 ft_server

# Result
SSL auto-certificate is created. MySQL is automatically created. Wordpress is automatically setup.
