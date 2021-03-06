## Directories for source files
SRC_DIRS := ui image shaders mesh


## Directories to build files into
OBJ_DIR := obj
BIN_DIR := bin
EXE     := Ultimate

## List of all c++ files to compile
CPP_FILES := $(wildcard $(SRC_DIRS:%=src/%/*.cpp)) $(wildcard src/*.cpp)

## List of all object files to generate
OBJ_FILES = $(addprefix $(OBJ_DIR)/,$(CPP_FILES:src/%.cpp=%.o))


## Compiler, compiler and linker flags and libaries to use
CXX := g++
#CXXLIBS := `pkg-config --cflags gtkmm-3.0` `Magick++-config --cppflags --cxxflags`
#LDLIBS := `pkg-config --libs gtkmm-3.0` -lGL -lGLEW -lsfml-system -lsfml-window -lsfml-graphics `Magick++-config --ldflags --libs`

CXXFLAGS := -Wall -Iinclude --std=c++11 $(CXXLIBS)
#LDFLAGS := -std=c++11 $(LDLIBS)


## Build applications
all: $(BIN_DIR)/$(EXE)

$(BIN_DIR)/$(EXE): $(OBJ_FILES) | $(BIN_DIR)
	$(CXX) -o $@ $^ $(LDFLAGS)

$(OBJ_DIR)/%.o: src/%.cpp | $(OBJ_DIR)
	$(CXX) -c -o $@ $< $(CXXFLAGS)


$(BIN_DIR):
	mkdir $(BIN_DIR)

$(OBJ_DIR):
	mkdir $(OBJ_DIR) $(SRC_DIRS:%=$(OBJ_DIR)/%)


## Clean up everything
clean:
	rm -rf obj
	rm -rf bin


## Include auto-generated dependencies rules
#-include $(OBJ_FILES:.o=.d)
