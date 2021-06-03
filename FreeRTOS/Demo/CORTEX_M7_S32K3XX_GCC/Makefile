#
#  Copyright 2018, 2020 NXP
#

CYGPATH := C:/cygwin64/bin/cygpath.exe
#Path to Tool Directory
CrossToolDir := C:/tools/gcc-9.2-arm32-eabi
#Path to FreeRtos Directory
OsPath := ../..
OutDir := Output

AS := $(CrossToolDir)/bin/arm-none-eabi-as.exe
CC := $(CrossToolDir)/bin/arm-none-eabi-gcc.exe
LD := $(CrossToolDir)/bin/arm-none-eabi-ld.exe

OSCFLAGS := -g \
            -O3 \
            -mcpu=cortex-m7 \
            -mthumb \
            -mfpu=fpv5-sp-d16 \
            -mfloat-abi=hard \
            -Wall \
            -I"$(OsPath)/Source/include" \
            -I"$(OsPath)/Source/portable/GCC/ARM_CM7/r0p1" \
            -I"include" \
            -specs=nano.specs \
            -specs=nosys.specs \
            --sysroot="$(CrossToolDir)/arm-none-eabi/newlib" \

OSASFLAGS := -g \
             -mcpu=cortex-m7 \
             -mthumb \
             -mfpu=fpv5-sp-d16 \
             -mfloat-abi=hard 

LDFLAGS := -mcpu=cortex-m7 \
           -nostartfiles  \
           -T image.ld -Wl,-Map=$(OutDir)/image.map \
           -specs=nano.specs \
           -specs=nosys.specs \
           --sysroot="$(CrossToolDir)/arm-none-eabi/newlib" \
           -mfpu=fpv5-sp-d16 -mfloat-abi=hard

OBJFILES_OS := $(OutDir)/tasks.o \
               $(OutDir)/timers.o \
               $(OutDir)/event_groups.o \
               $(OutDir)/queue.o \
               $(OutDir)/list.o \
               $(OutDir)/croutine.o \
               $(OutDir)/port.o \
               $(OutDir)/heap_4.o

$(OutDir)/%.o: $(OsPath)/Source/%.c
	$(CC) $(OSCFLAGS) -c -o $(shell $(CYGPATH) -m -i $@) $(shell $(CYGPATH) -m -i $<)

$(OutDir)/%.o: $(OsPath)/Source/portable/GCC/ARM_CM7/r0p1/%.c
	$(CC) $(OSCFLAGS) -c -o $(shell $(CYGPATH) -m -i $@) $(shell $(CYGPATH) -m -i $<)

$(OutDir)/%.o: $(OsPath)/Source/portable/MemMang/%.c
	$(CC) $(OSCFLAGS) -c -o $(shell $(CYGPATH) -m -i $@) $(shell $(CYGPATH) -m -i $<)

OBJFILES_APP := $(OutDir)/hw_system.o \
                $(OutDir)/vector.o \
                $(OutDir)/startup.o \
                $(OutDir)/main.o

$(OutDir)/%.o: source/%.c
	$(CC) $(OSCFLAGS) -c -o $(shell $(CYGPATH) -m -i $@) $(shell $(CYGPATH) -m -i $<)

$(OutDir)/%.o: source/%.asm
	$(AS) $(OSASFLAGS) -c -o $(shell $(CYGPATH) -m -i $@) $(shell $(CYGPATH) -m -i $<)

OBJFILES := $(OBJFILES_OS) $(OBJFILES_APP)


# default goal
all: clean make_dir $(OutDir)/image.elf

clean:
	rm -f $(OutDir)/*
	rm -fr $(OutDir)

make_dir:
	mkdir $(OutDir)

# Linking
$(OutDir)/image.elf: $(OBJFILES)
	$(CC) $(LDFLAGS) -o $(shell $(CYGPATH) -m -i $@) $(shell $(CYGPATH) -m -i $(OBJFILES))
