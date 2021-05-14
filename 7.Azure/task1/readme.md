Создание группы ресурсов:

az group create --name ResourceGroupITR --location eastus 

Деплой ресурсов:

az deployment  group create  -g ResourceGroupITR -f template1.json

Template1.json деплоит две виртуальные машины с управляемыми дисками в одной группе доступности,что обеспечивает возможность подключения виртуальной машины хотя бы к одному экземпляру не менее 99,95% времени 

Также имеется возможность увеличения количества рабочих машин и изменения образа на Windows


![Снимок экрана от 2021-05-14 16-46-48](https://user-images.githubusercontent.com/73390744/118280508-f4ea6300-b4d4-11eb-8b2e-ac4010be0ab4.png)
![Снимок экрана от 2021-05-14 16-45-34](https://user-images.githubusercontent.com/73390744/118280523-f9168080-b4d4-11eb-8f57-ba8068a83633.png)
![Снимок экрана от 2021-05-14 16-45-25](https://user-images.githubusercontent.com/73390744/118280540-fddb3480-b4d4-11eb-820c-524c6c56160f.png)
![Снимок экрана от 2021-05-14 16-45-20](https://user-images.githubusercontent.com/73390744/118280551-00d62500-b4d5-11eb-9a7f-2cec28ae1b5a.png)
