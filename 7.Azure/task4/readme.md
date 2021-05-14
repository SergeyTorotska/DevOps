Эта директория содержит веб-приложения для 4 задания Azure

Последовательность действий по созданию приложения и деплоя на Portal.Azure:

1.На VS code выполнил вход в учетную запись Azure

![изображение](https://user-images.githubusercontent.com/73390744/118292095-f28e0600-b4e0-11eb-8221-40c4fde99405.png)

![Снимок экрана от 2021-05-14 18-20-18](https://user-images.githubusercontent.com/73390744/118292255-1c472d00-b4e1-11eb-8e53-439abdceccb9.png)

2. Используя следующую базовую команду с git для клонирования репозитория, перешел в папку репозитория с именем myexpressapp, а затем установил зависимости npm

    git clone https://github.com/Azure-Samples/js-e2e-express-server.git myexpressapp && \
    cd myexpressapp && \
    npm install
    
3.Протестировал приложение командой npm start

4.Создал ресурс Службы приложений в Visual Studio Code

4.1 

    
