#!/bin/sh

for entry in `ls */docker-compose.yml`
do
    docker-compose -f $entry up --detach
done
