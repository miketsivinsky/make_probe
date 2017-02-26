CC      = gcc
CFLAGS  = -c -Wall
LDFLAGS =  

C_SRC = slon1.c slonPrint.c
OBJ   = $(C_SRC:.c=.o)
EXE   = slonick.exe

all: $(C_SRC) $(EXE)

$(EXE): $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) -o $@
.c.o:
	$(CC) $(CFLAGS) $< -o $@
clean:
	del *.o *.exe
