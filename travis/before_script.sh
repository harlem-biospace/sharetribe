#!/bin/bash

echo "Running before_script"
echo "SUITE: ${SUITE}"

if [ "$SUITE" = "rspec" ]
then
	cp config/database.example.yml config/database.yml
	mysql -e 'create database sharetribe_test;'
	rake db:test:load
	exit
elif [ "$SUITE" = "cucumber" ]
then
	cp config/database.example.yml config/database.yml
	mysql -e 'create database sharetribe_test;'
	rake db:test:load
	exit
elif [ "$SUITE" = "mocha" ]
then
	cp config/database.example.yml config/database.yml
	mysql -e 'create database sharetribe_test;'
	rake db:test:load
	bundle exec rails server &
	echo "Waiting rails server to start..."
	sleep 30
	exit
elif [ "$SUITE" = "jshint" ]
then
	exit
else
	echo -e "Error: SUITE is illegal or not set\n"
	exit 1
fi