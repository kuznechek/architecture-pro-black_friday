# Задание 3. Репликация
## mongo-sharding-repl

![Результат 1.2](https://github.com/kuznechek/architecture-pro-black_friday/blob/feature/src/schemas_1.2.png)

## Как запустить

Запускаем mongodb и приложение из директории ./task 3/mongo-sharding-repl

```shell
docker compose up -d
```

Заполняем mongodb данными из директории, запускаем сервер конфигурации и шардирование ./task 3/mongo-sharding-repl

```shell
./scripts/init.sh
```

## Как проверить

### Если вы запускаете проект на локальной машине

Откройте в браузере http://localhost:8080

![Результат 3.1](https://github.com/kuznechek/architecture-pro-black_friday/blob/feature/src/result_3.1.png)

### Если вы запускаете проект на предоставленной виртуальной машине

Узнать белый ip виртуальной машины

```shell
curl --silent http://ifconfig.me
```

Откройте в браузере http://<ip виртуальной машины>:8080
