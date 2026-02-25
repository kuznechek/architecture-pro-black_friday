#!/bin/bash

# Инициализация базы данных
function db_init() {
    printf "SomeDB is initializing . . .\n"

    docker compose exec -T mongos_router mongosh --port 27020 --eval "
    sh.enableSharding('somedb');
    sh.shardCollection('somedb.helloDoc', { 'name': 'hashed' });
    db = db.getSiblingDB('somedb');

    for(var i = 0; i < 1000; i++)
        db.helloDoc.insertOne({age:i, name:'ly'+i})
    db.helloDoc.countDocuments();"

    printf "SomeDB was initialized sucessfully!\n"
}

# Инициализация сервиса конфигурации
function configSrv_init() {
    printf "Configuration Server is initializing . . .\n"

    docker compose exec -T configSrv mongosh --eval "
    rs.initiate({
        _id: 'config_server',
        configsvr: true,
        members: [{
            _id : 0, host : 'configSrv:27017'
        }]
    })"

    printf "Configuration Server was initialized sucessfully!\n"
}

# Инициализация шарда 1
function shard1_init() {
    printf "Shard 1 is initializing . . .\n"

    docker compose exec -T shard1 mongosh --port 27018 --eval "
    rs.initiate({
        _id: 'shard1',
        members: [
            { _id : 1, host : 'shard1:27018' },
            { _id : 2, host : 'shard1-1:27028' },
            { _id : 3, host : 'shard1-2:27038' }
        ]
    })"

    printf "Shard 1 was initialized sucessfully!\n"
}

# Инициализация шарда 2
function shard2_init() {
    printf "Shard 2 is initializing . . .\n"

    docker compose exec -T shard2 mongosh --port 27019 --eval "
    rs.initiate({
        _id: 'shard2',
        members: [
            { _id : 1, host : 'shard2:27019' },
            { _id : 2, host : 'shard2-1:27029' },
            { _id : 3, host : 'shard2-2:27039' }
        ]
    })"

    printf "Shard 2 was initialized sucessfully!\n"
}

# Инициализация роутера
function router_start() {
    printf "Router is starting . . .\n"

    docker compose exec -T mongos_router mongosh --port 27020 --eval "
    sh.addShard('shard1/shard1:27018');
    sh.addShard('shard2/shard2:27019');"

    printf "Router was started sucessfully!\n"
}


configSrv_init

shard1_init
shard2_init

router_start

db_init