all:	babbler

babbler: babbler.c
	gcc -std=c99 -m64 -Os -lm babbler.c `pkg-config lua5.2 --cflags --libs` -o babbler
