# Контейнер с 1С сервером хранилища 8.3
### Любая версия платформы


Для запуска контейнера

```
docker run -v /путь/к/каталогу/с/хранилищем:/opt/1C/repository -d -i -t -p 8899:8899 --privileged=true --restart=always --name repository_server_1c  repository_server_1c
```

