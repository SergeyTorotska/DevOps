Создание группы ресурсов:

az group create --name ResourceGroupITR2 --location westus

Деплой ресурсов:

az deployment  group create  -g ResourceGroupITR2 -f azuredeploy1.json


azuredeploy1.json деплоит on-premise Windows file server, который бэкапит файлы в хранилище Azure. Бэкап файлы будут храниться в виде блобов. 
также создает учетную запись хранения corpstorage01devopss, Standard LRS LRS стоит меньше всего но обеспечивает самый низкий уровень избыточности, что не подходит для задания, можно использовать Standard_ZRS просто изменив azuredeploy1.json 

здесь я создал файловый ресурс который содержит заметку "Hello!"
![Снимок экрана от 2021-05-07 18-32-00](https://user-images.githubusercontent.com/73390744/118281982-78f11a80-b4d6-11eb-8669-36f6e105e07c.png)
![Снимок экрана от 2021-05-07 18-32-04](https://user-images.githubusercontent.com/73390744/118281990-7989b100-b4d6-11eb-9240-bc78afc4ab58.png)
подключил ресурс к виртуальной машине
![Снимок экрана от 2021-05-14 17-07-10](https://user-images.githubusercontent.com/73390744/118282360-dedda200-b4d6-11eb-9c61-8233051b44c1.png)
результат подключения к машине
![Снимок экрана от 2021-05-07 18-55-55](https://user-images.githubusercontent.com/73390744/118281994-7a224780-b4d6-11eb-9350-1a56d084f2e3.png)

![Снимок экрана от 2021-05-07 19-07-52](https://user-images.githubusercontent.com/73390744/118281995-7abade00-b4d6-11eb-89c0-9f6f2c251116.png)
файл доступен через drive mapping
![Снимок экрана от 2021-05-07 19-08-01](https://user-images.githubusercontent.com/73390744/118281998-7b537480-b4d6-11eb-87ad-6a55a95f4d55.png)
