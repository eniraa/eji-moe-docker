#!/bin/sh

for entry in */docker-compose.yml
do
    docker-compose -f "$entry" up --detach
done
