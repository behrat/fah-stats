MYSQL_CONFIG = /usr/bin/mysql_config

CC = gcc
FLAGS = -std=gnu99 -O2 -Wall 
all: parse-lists convert-date

parse-lists: src/*.c
	$(CC) -o $@ src/parse-lists.c $(FLAGS) `$(MYSQL_CONFIG) --cflags` `$(MYSQL_CONFIG) --libs`

convert-date: src/convert-date.c
	$(CC) -o $@ $^ $(FLAGS)

clean:
	rm -f parse-lists convert-date
