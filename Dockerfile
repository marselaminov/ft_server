# установка контейнерной ОС
FROM debian:buster

# установка и обновление образов
RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get -y install wget nginx vim mariadb-server php php-mysql php-fpm php-mbstring

# копируем конфиг nginx
COPY ./srcs/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled

# переходим сюда чтобы установить и распаковать phpmyadmin в этом каталоге
WORKDIR /var/www/root

# устанавливаем phpmyadmin, используя wget
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz

# разархивируем и удаляем архив
RUN tar -xf phpMyAdmin-5.0.4-english.tar.gz && rm -rf phpMyAdmin-5.0.4-english.tar.gz

# переименовываем
RUN mv phpMyAdmin-5.0.4-english phpmyadmin

# копируем наш конфиг 
COPY ./srcs/config.inc.php phpmyadmin

# устанавливаем вордпресс
RUN wget https://wordpress.org/latest.tar.gz

# разархивируем и удаляем архив
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

RUN mkdir /var/srcs

# копируем наш инит
COPY ./srcs/init.sh /var/srcs
# закидываю автоиндекс
COPY ./srcs/autoindex.sh /var/srcs

# копируем конфиг вордпресса
COPY ./srcs/wp-config.php /var/www/root/wordpress

# настройка ssl сертификата (поскольку существует настройка конфигурации для порта 443 (в конфиге nginx), мы должны установить ключ SSL в Dockerfile)
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/L=KAZAN/OU=21school/" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

# change owner (меняем владельца)
RUN chown -R www-data:www-data *

# меняем права
RUN chmod -R 755 /var/www/*

# запускаем
CMD bash /var/srcs/init.sh
