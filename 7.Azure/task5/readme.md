В этом задании создал веб-приложение (Приложение имитирует гостиничную систему бронирования ) которое можно горизонтально скалировать.


Вручную создал план службы приложений и веб-приложение

Подробно о созданиии приложения:

1.Открыл Cloud Shell на портале Azure (в верхнем правом углу, похоже на квадрат с символами >_ внутри). Выполнил следующую команду, чтобы скачать исходный код для гостиничной системы бронирования:

git clone https://github.com/MicrosoftDocs/mslearn-hotel-reservation-system.git


2.Перешел к папке mslearn-hotel-reservation-system/src:

cd mslearn-hotel-reservation-system/src

3.Выполнил сборку приложения для гостиничной системы, клиентское приложение для нагрузочного тестирования веб-приложения.

dotnet build

4. Подготовил веб-приложение HotelReservationSystem для публикации: 

cd HotelReservationSystem
dotnet publish -o website

5. Перешел к папке website, которая содержит опубликованные файлы. Сжал файлы в ZIP-папку и развернул их в веб-приложении, созданном в предыдущей задаче. Заменил <your-webapp-name> именем своего веб-приложения.

cd website
zip website.zip *
az webapp deployment source config-zip --src website.zip --name WebAppScaleOut  --resource-group mslearn-scale
