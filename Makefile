.PHONY: all clean

CC65DIR=$(HOME)
#CC65DIR=/data/data/com.termux/files/home/cc65-master

all: crt0.o neslib2.lib
	cp crt0.o ~/8bitworkshop/src/worker/lib/nes/
	cp neslib.h ~/8bitworkshop/presets/nes/

neslib2.lib: crt0.o
	$(CC65DIR)/bin/ar65 a neslib2.lib crt0.o

crt0.o: $(wildcard *.s *.sinc)
	$(CC65DIR)/bin/cl65 --verbose --listing crt0.lst -t nes -Oisr -g -c crt0.s 

clean:
	rm -f *.o
