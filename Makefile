BUILD_DIR=build
SRC_DIR=src

GXX=g++

ifeq ($(OS),Windows_NT)
	INCLUDES=C:/msys64/include/SDL2 C:/msys64/include/c++
	LIBS=C:/msys64/lib
	LINKS=mingw32 SDL2main SDL2
	SUBSYS=windows
else
	INCLUDES=
	LIBS=
	LINKS=SDL2main SDL2
	SUBSYS=console
endif
CFLAGS+= $(patsubst %,-I%,$(INCLUDES)) $(patsubst %,-L%,$(LIBS)) $(patsubst %,-l%,$(LINKS)) -w -Wl,-subsystem,$(SUBSYS)

OBJ_DIR=$(BUILD_DIR)/obj

SOURCES := $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SOURCES))

all: $(OBJECTS) $(BUILD_DIR)/out.exe

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)
$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	@rm -f $@
	@echo Assembling $<
	@$(GXX) $< -c -o $@ $(CFLAGS) 
$(BUILD_DIR)/out.exe: $(OBJECTS) | $(BUILD_DIR)
	@rm -f $(BUILD_DIR)/out.exe
	@echo Linking exec...
	@$(GXX) $(OBJECTS) -o $(BUILD_DIR)/out.exe $(CFLAGS) 

clean:
	rm -rf $(BUILD_DIR)/*
