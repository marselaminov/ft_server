# запуск сервисов
service nginx start
service mysql start
service php7.3-fpm start

# настройка wordpress database
mysql -e "CREATE DATABASE wordpress;" # просто создание схемы с именем вордпресс
mysql -e "GRANT ALL PRIVILEGES ON wordpress.tablename TO 'root'@'localhost' WITH GRANT OPTION;" # создание учетной записи, которая может получить доступ к определенной схеме. в нашем случае мы создаем учетную запись рут, которая может получить доступ ко всем таблицам в схеме вордпресс
mysql -e "FLUSH PRIVILEGES;" # указываем серверу перезагрузить таблицы предоставления, выполнив операцию сброса привилегий
mysql -e "UPDATE mysql.user set plugin='' where user='root';" # для входа

bash
