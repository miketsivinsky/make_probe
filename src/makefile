#------------------------------------------------------------------------------
REF_DIR = .
SRC_DIR = $(REF_DIR)
INC_DIR = $(REF_DIR)/../include

#------------------------------------------------------------------------------
C_FLAGS   = -Wall -std=c99 -I $(INC_DIR)
CPP_FLAGS = -Wall -std=c++0x -I $(INC_DIR)
LD_FLAGS  = 

#------------------------------------------------------------------------------
CC      = gcc
CXX     = g++
LD      = gcc

C_SRC   = $(wildcard $(SRC_DIR)/*.c)
CPP_SRC = $(wildcard $(SRC_DIR)/*.cpp)
H_SRC   = $(wildcard $(SRC_DIR)/*.h) $(wildcard $(INC_DIR)/*.h)
EXE     = slonick.exe

OBJ_C   := $(patsubst %.c,%.o,$(C_SRC))
OBJ_CPP := $(patsubst %.cpp,%.o,$(CPP_SRC))

#------------------------------------------------------------------------------
.PHONY: all clean print-%

all:    $(EXE)

clean:
	del *.o *.exe

print-%:
	@echo $* = $($*)

#------------------------------------------------------------------------------
$(EXE): $(OBJ_C) $(OBJ_CPP)
	$(LD) $(LD_FLAGS) -o $@ $(OBJ_C) $(OBJ_CPP)

$(OBJ_C): %.o: %.c
	$(CC) $(C_FLAGS) -c $< -o $@

$(OBJ_CPP): %.o: %.cpp
	$(CXX) $(CPP_FLAGS) -MMD -c $< -o $@

#------------------------------------------------------------------------------




