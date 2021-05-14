Создание группы ресурсов:

az group create --name ResourceGroupITR3 --location westus 

Деплой ресурсов:

az deployment  group create  -g ResourceGroupITR3 -f templatex.json


templatex.json деплоит Application Gateway с именем AppGw01 для балансировки нагрузки  IP-трафика на виртуальную машину Azure,
подключенную к public_ip1


![Снимок экрана от 2021-05-08 13-15-06](https://user-images.githubusercontent.com/73390744/118285306-fbc7a480-b4d9-11eb-82b1-4b39eecc2b8d.png)
