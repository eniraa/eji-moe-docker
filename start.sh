#!/bin/sh

apk add docker docker-compose ruby
rc-service docker start

ruby start.rb
