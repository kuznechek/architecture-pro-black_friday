# Задание 2. Шардирование
### mongo-sharding

![Результат 1.1](https://github.com/kuznechek/architecture-pro-black_friday/blob/feature/src/schemas_1.1.png)

## Как запустить

Запускаем mongodb и приложение из директории ./task 2/mongo-sharding

```shell
docker compose up -d
```

Заполняем mongodb данными из директории, запускаем сервер конфигурации и шардирование ./task 2/mongo-sharding

```shell
./scripts/init.sh
```

## Как проверить

### Если вы запускаете проект на локальной машине

Откройте в браузере http://localhost:8080

![Результат 2.1](https://github.com/kuznechek/architecture-pro-black_friday/blob/feature/src/result_2.1.png)

### Если вы запускаете проект на предоставленной виртуальной машине

Узнать белый ip виртуальной машины

```shell
curl --silent http://ifconfig.me
```

Откройте в браузере http://<ip виртуальной машины>:8080
