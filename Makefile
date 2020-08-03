led.hex: led
	avr-objcopy -O ihex -R .eeprom led led.hex

led: led.o
	avr-gcc -mmcu=atmega328p led.o -o led

led.o: led.c
	avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o led.o led.c


.PHONY: flash
flash:
	avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:led.hex
