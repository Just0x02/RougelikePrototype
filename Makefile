CPP = g++

OUT_FILE = ./main

CPP_OPTS = -Wall

LIB = -L ./lib/ -lsfml-graphics -lsfml-window -lsfml-system -lfreeglut -lopengl32
INCLUDE = -I ./include/

SOURCEDIR = ./src
HEADERDIR = ./src

SOURCES := $(shell find . -name '*.cpp')

ifeq '$(findstring ;,$(PATH))' ';'
    OS := Windows
else
    OS := $(shell uname 2>/dev/null || echo Unknown)
    OS := $(patsubst CYGWIN%,Cygwin,$(OS))
    OS := $(patsubst MSYS%,MSYS,$(OS))
    OS := $(patsubst MINGW%,MSYS,$(OS))
endif


ifeq ($(OS),MSYS)
    export TMP=C:\msys64\tmp
    LIB += -Wl,--subsystem,windows
endif


default:
	$(CPP) $(SOURCES) -o $(OUT_FILE) $(CPP_OPTS) $(INCLUDE) $(LIB)