Скачал образ nginx из DockerHub:

![Снимок экрана от 2021-05-15 21-41-11](https://user-images.githubusercontent.com/73390744/118375080-18daa100-b5c8-11eb-81da-faae7fdae7d9.png)


![Снимок экрана от 2021-05-15 21-53-51](https://user-images.githubusercontent.com/73390744/118375077-12e4c000-b5c8-11eb-89f1-d9590c3edff3.png)


![Снимок экрана от 2021-05-16 12-22-01](https://user-images.githubusercontent.com/73390744/118392552-e3bf6480-b642-11eb-9e12-ad822d88c1d1.png)
![Снимок экрана от 2021-05-16 12-22-47](https://user-images.githubusercontent.com/73390744/118392560-ef129000-b642-11eb-98cb-afd73d8a2d8a.png)
![Снимок экрана от 2021-05-16 12-25-48](https://user-images.githubusercontent.com/73390744/118392561-f0dc5380-b642-11eb-905a-f8973782246b.png)
![Снимок экрана от 2021-05-16 12-32-51](https://user-images.githubusercontent.com/73390744/118392562-f20d8080-b642-11eb-807d-9425c9e96761.png)



-v ~/mysql_data:/var/lib/mysql означает что директория ~/mysql_data на нашей машине смонтирована в директорию /var/lib/mysql внутри контейнера. Всё, что находилось в нашей директории ~/mysql_data при старте контейнера попадет в директорию /var/lib/mysql. В процессе работы контейнера эти директории будут синхронизироваться. То есть если какие-то данные будут изменены в MySQL, то и данные в ~/mysql_data также будут изменены.

Если контейнер удалить, то данные никуда не пропадут. Они будут находиться в директории ~/mysql_data.
