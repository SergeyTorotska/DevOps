1. Создаем рабочее пространство для наших конфигураций Packer. Типичная структура каталогов для Packer следующая:

Упаковщик /

       | --- ubuntu1804.json
       | --- http /
       |  | --- preseed.cfg
       | --- скрипты /
               | --- init.sh
               | --- cleanup.sh

2. Создаем новый файл JSON для образа Ubuntu 18.04. В структуре каталогов выше мы называем наш файл ubuntu1804.json. 


3. Создаем образ Ubuntu:

packer build ubuntu1804.json 

4.Добавляем образ в Vagrant

vagrant box add ubuntu1804-vagrant.box
