#------------------------------------------------------------------------------
REF_DIR   := .
SRC_DIR   := .
INC_DIR   := $(REF_DIR)\..\include
OBJ_DIR   := $(SRC_DIR)\obj
TRG_DIR   := $(REF_DIR)\..\bin

#******************************************************************************
#   for experiments
# 

#SLON1 := .\obj\.\.\ss\sggs\.\s
#SLON1 := $(patsubst .\\%,%,$(SLON1))
#SLON2 := .\obj/./ss\sggs\.\s
#SLON2 := $(subst /./,/,$(SLON2))

#******************************************************************************

#******************************************************************************
#   for correct autodependency working when OBJ_DIR != SRC_DIR
#   I can't use foreach function because there are no change by reference possibility
#

INC_DIR := $(patsubst .\\%,%,$(INC_DIR))
OBJ_DIR := $(patsubst .\\%,%,$(OBJ_DIR))
TRG_DIR := $(patsubst .\\%,%,$(TRG_DIR))

#******************************************************************************

#------------------------------------------------------------------------------
DEPS_FLAGS = -MMD
C_FLAGS    = -Wall -std=c99   -I $(INC_DIR) $(DEPS_FLAGS)
CPP_FLAGS  = -Wall -std=c++0x -I $(INC_DIR) $(DEPS_FLAGS)
LD_FLAGS   = 

#------------------------------------------------------------------------------
CC        = gcc
CXX       = g++
LD        = gcc

C_SRC     = $(wildcard $(SRC_DIR)/*.c)
CPP_SRC   = $(wildcard $(SRC_DIR)/*.cpp)
H_SRC     = $(wildcard $(SRC_DIR)/*.h) $(wildcard $(INC_DIR)/*.h)
TRG_FILE  = slonick.exe

OBJ_C     := $(patsubst %.c,$(OBJ_DIR)/%.o,$(C_SRC))
OBJ_CPP   := $(patsubst %.cpp,$(OBJ_DIR)/%.o,$(CPP_SRC))
TARGET    = $(TRG_DIR)\$(TRG_FILE)

#******************************************************************************
#   replace all '/./' (except the last in multi '/./'-case) to '/'
#
OBJ_C    := $(subst /./,/,$(OBJ_C))
OBJ_CPP  := $(subst /./,/,$(OBJ_CPP))
#******************************************************************************

#------------------------------------------------------------------------------
DEPS      = $(patsubst %.o,%.d,$(OBJ_C) $(OBJ_CPP))

#------------------------------------------------------------------------------
.PHONY: all clean print-%

all:    $(TARGET)

clean:
	@if exist $(OBJ_DIR) del $(OBJ_DIR)\*.o
	@if exist $(OBJ_DIR) del $(OBJ_DIR)\*.d
	@if exist $(OBJ_DIR) rd  $(OBJ_DIR)
	@if exist $(TARGET)  del $(TARGET)

print-%:
	@echo $* = $($*)

#------------------------------------------------------------------------------
$(TARGET): $(OBJ_C) $(OBJ_CPP) | $(TRG_DIR)
	$(LD) $(LD_FLAGS) -o $@ $(OBJ_C) $(OBJ_CPP)

-include $(DEPS)

$(OBJ_C) : $(OBJ_DIR)/%.o : %.c | $(OBJ_DIR)
	$(CC) $(C_FLAGS) -c $< -o $@

$(OBJ_CPP): $(OBJ_DIR)/%.o : %.cpp | $(OBJ_DIR)
	$(CXX) $(CPP_FLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir $(OBJ_DIR)	

$(TRG_DIR):
	mkdir $(TRG_DIR)	



