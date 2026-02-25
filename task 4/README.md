# Задание 4. Кеширование
## sharding-repl-cache

![Результат 1.3](https://github.com/kuznechek/architecture-pro-black_friday/blob/feature/src/schemas_1.3.png)

## Как запустить

Запускаем mongodb и приложение из директории ./task 4/sharding-repl-cache

```shell
docker compose up -d
```

Заполняем mongodb данными из директории, запускаем сервер конфигурации и шардирование ./task 4/sharding-repl-cache

```shell
./scripts/init.sh
```

## Как проверить

### Если вы запускаете проект на локальной машине

Откройте в браузере http://localhost:8080

![Результат 4.1](https://github.com/kuznechek/architecture-pro-black_friday/blob/feature/src/result_4.1.png)

Откройте в браузере http://localhost:8080/helloDoc/users

![Результат 4.2](https://github.com/kuznechek/architecture-pro-black_friday/blob/feature/src/result_4.2.png)

### Если вы запускаете проект на предоставленной виртуальной машине

Узнать белый ip виртуальной машины

```shell
curl --silent http://ifconfig.me
```

Откройте в браузере http://<ip виртуальной машины>:8080
