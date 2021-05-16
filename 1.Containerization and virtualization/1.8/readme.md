Установка:

sudo apt-get install docker-compose


Запуск 

docker-compose up -d

 Удалить контейнеры, но сохранить БД 

docker-compose down

 Удалить все (включая db) 

docker-compose down --volumes
