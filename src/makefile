slonick.exe: slon1.o slonPrint.o
	gcc slon1.o slonPrint.o -o slonick.exe
slon1.o: slon1.c slonPrint.h
	gcc -c slon1.c
slonPrint.o: slonPrint.c slonPrint.h
	gcc -c slonPrint.c
clean:
	del *.o *.exe
