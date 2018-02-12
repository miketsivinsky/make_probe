#------------------------------------------------------------------------------
REF_DIR   = .
SRC_DIR   = .
INC_DIR   = $(REF_DIR)/../include
OBJ_DIR   = $(SRC_DIR)/obj
TRG_DIR   = $(REF_DIR)/../bin

TRG_NAME  = slonick

#-----------------------------------------------------------------------------
ifeq ($(OS),Windows_NT)
    detected_OS := Windows
else
    detected_OS := $(shell sh -c 'uname -s 2>/dev/null || echo not')
endif

ifeq ($(detected_OS),Windows)
    fixPath = $(subst /,\,$1)
    TRG_SFX := .exe
else
    fixPath = $1
    TRG_SFX := 
endif

#------------------------------------------------------------------------------
C_FLAGS   = -Wall -std=c99 -I $(INC_DIR) 
CPP_FLAGS = -Wall -std=c++0x -I $(INC_DIR)
LD_FLAGS  = 

#------------------------------------------------------------------------------
CC        = gcc
CXX       = g++
LD        = gcc

C_SRC     = $(wildcard $(SRC_DIR)/*.c)
CPP_SRC   = $(wildcard $(SRC_DIR)/*.cpp)
H_SRC     = $(wildcard $(SRC_DIR)/*.h) $(wildcard $(INC_DIR)/*.h)
TRG_FILE  = $(TRG_NAME)$(TRG_SFX)

OBJ_C     = $(patsubst %.c,$(OBJ_DIR)/%.o,$(C_SRC))
OBJ_CPP   = $(patsubst %.cpp,$(OBJ_DIR)/%.o,$(CPP_SRC))
TARGET    = $(TRG_DIR)/$(TRG_FILE)

#------------------------------------------------------------------------------
.PHONY: all clean print-%

all:    $(TARGET)

clean:
	@if exist $(OBJ_DIR) del $(OBJ_DIR)\*.o
	@if exist $(OBJ_DIR) rd  $(OBJ_DIR)
	@if exist $(TARGET)  del $(TARGET)

print-%:
	@echo $* = $($*)

#------------------------------------------------------------------------------
$(TARGET): $(OBJ_C) $(OBJ_CPP) | $(TRG_DIR)
	$(LD) $(LD_FLAGS) -o $@ $(OBJ_C) $(OBJ_CPP)

$(OBJ_C): $(OBJ_DIR)/%.o : %.c | $(OBJ_DIR)
	$(CC) $(C_FLAGS) -c $< -o $@

$(OBJ_CPP): $(OBJ_DIR)/%.o : %.cpp | $(OBJ_DIR)
	$(CXX) $(CPP_FLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir $(call fixPath, $(abspath $(OBJ_DIR)))		

$(TRG_DIR):
	mkdir $(call fixPath, $(abspath $(TRG_DIR)))		




