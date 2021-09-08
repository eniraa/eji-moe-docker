#!/bin/sh

for entry in $(find . -name 'docker-compose.yml')
do
    docker-compose -f "$entry" up --detach
done
