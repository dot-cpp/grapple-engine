BUILD_DIR=build
SRC_DIR=src

GXX=g++
CFLAGS=

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
	@$(GXX) $(CFLAGS) $< -c -o $@
$(BUILD_DIR)/out.exe: $(OBJECTS) | $(BUILD_DIR)
	@rm -f $(BUILD_DIR)/out.exe
	@echo Linking exec...
	@$(GXX) $(CFLAGS) $(OBJECTS) -o $(BUILD_DIR)/out.exe

clean:
	rm -rf $(BUILD_DIR)/*