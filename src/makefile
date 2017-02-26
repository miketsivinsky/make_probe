#------------------------------------------------------------------------------
REF_DIR = .
SRC_DIR = $(REF_DIR)
INC_DIR = $(REF_DIR)/../include
OBJ_DIR = $(SRC_DIR)\obj
#OBJ_DIR = $(SRC_DIR)
TGT_DIR = $(REF_DIR)\..\bin

#------------------------------------------------------------------------------
C_FLAGS   = -Wall -std=c99 -I $(INC_DIR) -MMD
CPP_FLAGS = -Wall -std=c++0x -I $(INC_DIR) -MMD
LD_FLAGS  = 

#------------------------------------------------------------------------------
CC      = gcc
CXX     = g++
LD      = gcc

C_SRC   = $(wildcard $(SRC_DIR)/*.c)
CPP_SRC = $(wildcard $(SRC_DIR)/*.cpp)
H_SRC   = $(wildcard $(SRC_DIR)/*.h) $(wildcard $(INC_DIR)/*.h)
TARGET  = slonick.exe

OBJ_C   = $(patsubst %.c,%.o,$(C_SRC))
OBJ_CPP = $(patsubst %.cpp,%.o,$(CPP_SRC))

OBJ_C_LIST   = $(foreach file, $(OBJ_C), $(OBJ_DIR)/$(file))  
OBJ_CPP_LIST = $(foreach file, $(OBJ_CPP), $(OBJ_DIR)/$(file))  

#------------------------------------------------------------------------------
$(OBJ_C): %.o : %.c
	@if not exist $(OBJ_DIR) mkdir $(OBJ_DIR) & if not exist $(OBJ_DIR) exit 1
	$(CC) $(C_FLAGS) -c $< -o $@


#------------------------------------------------------------------------------
.PHONY: all clean print-%

#all:    $(TARGET)

clean:
	@if exist $(OBJ_DIR) rd /s /q $(OBJ_DIR) 
	@if exist $(TGT_DIR)\$(TARGET) del $(TGT_DIR)\$(TARGET)

print-%:
	@echo $* = $($*)

#------------------------------------------------------------------------------
#$(TARGET): $(OBJ_C) $(OBJ_CPP)
#	@if not exist $(TGT_DIR) mkdir $(TGT_DIR) & if not exist $(TGT_DIR) exit 1
#	$(LD) $(LD_FLAGS) -o $(TGT_DIR)/$@ $(OBJ_C_LIST) $(OBJ_CPP_LIST)


#$(OBJ_CPP): %.o: %.cpp
#	@if not exist $(OBJ_DIR) mkdir $(OBJ_DIR) & if not exist $(OBJ_DIR) exit 1
#	$(CXX) $(CPP_FLAGS) -MMD -c $< -o $(OBJ_DIR)/$@

#------------------------------------------------------------------------------




