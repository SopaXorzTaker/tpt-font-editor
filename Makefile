# Use *.exe for Windows and * for anything POSIX compatible.

.PHONY: all
all: lin
lin: editor packer unpacker
win: editor.exe packer.exe unpacker.exe



editor: editor.c
	gcc -o build/editor -DSCALE=1 -DFONTEDITOR editor.c -lSDL -lm -O3 -ffast-math -march=k8 -Wall -std=c99 -Iinclude
	
editor.exe: editor.c
	gcc -o build/editor.exe -DSCALE=1 -DFONTEDITOR editor.c -lmingw32 -lm -lSDLmain -lSDL -O3 -ffast-math -march=k8 -Wall -std=c99 -mwindows -Iinclude
	
packer: packer.c
	gcc -o build/packer -DFONTEDITOR packer.c -lm -O3 -ffast-math -march=k8 -Wall -std=c99 -Iinclude
	
packer.exe: packer.c
	gcc -o build/packer.exe -DFONTEDITOR packer.c -lm -O3 -ffast-math -march=k8 -Wall -std=c99 -Iinclude
	
unpacker: unpacker.c
	gcc -o build/unpacker -DFONTEDITOR unpacker.c -lm -O3 -ffast-math -march=k8 -Wall -std=c99 -Iinclude

unpacker.exe: unpacker.c
	gcc -o build/unpacker.exe -DFONTEDITOR unpacker.c -lm -O3 -ffast-math -march=k8 -Wall -std=c99 -Iinclude
	
clean:
	rm -f build/editor build/packer build/unpacker build/editor.exe build/packer.exe build/unpacker.exe
