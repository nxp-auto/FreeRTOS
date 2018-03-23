#==================================================================================================
#
#  (c) Copyright 2015 Freescale Semiconductor Inc.
#  Copyright 2017 NXP
#  
#  This program is free software; you can redistribute it and/or modify it under
#  the terms of the GNU General Public License (version 2) as published by the
#  Free Software Foundation >>>> AND MODIFIED BY <<<< the FreeRTOS exception.
#
#  ***************************************************************************
#  >>!   NOTE: The modification to the GPL is included to allow you to     !<<
#  >>!   distribute a combined work that includes FreeRTOS without being   !<<
#  >>!   obliged to provide the source code for proprietary components     !<<
#  >>!   outside of the FreeRTOS kernel.                                   !<<
#  ***************************************************************************
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
#================================================================================================*/
PLATFORM_DEF := $(shell echo $(PLATFORM) | tr a-z A-Z)
ASFLAGS  := -g --gdwarf-sections --gstabs+ -L -mregnames -mvle -I$(shell $(CYGPATH) -m -i $(CRT_DIR))/SOURCES -I$(shell $(CYGPATH) -m -i $(CRT_DIR))/SOURCES_MPC57XX/$(PLATFORM) \
            -I$(shell $(CYGPATH) -m -i $(OS_ROOT))/Source/portable/GCC/PowerPC

CPPFLAGS  := -g -L -mregnames -mvle -I$(shell $(CYGPATH) -m -i $(CRT_DIR))/SOURCES -I$(shell $(CYGPATH) -m -i $(CRT_DIR))/SOURCES_MPC57XX/$(PLATFORM) \
             -I$(shell $(CYGPATH) -m -i $(OS_ROOT))/Source/portable/GCC/PowerPC \
             -D$(PLATFORM_DEF)=1


CFLAGS   :=  --sysroot=$(shell $(CYGPATH) -m -i $(COMPILER_LIBS)) \
            -I$(shell $(CYGPATH) -m -i $(OS_ROOT))/Source/include \
			-I$(shell $(CYGPATH) -m -i $(OS_ROOT))/Source/portable/GCC/PowerPC \
			-I$(shell $(CYGPATH) -m -i $(CRT_DIR))/SOURCES \
			-I$(shell $(CYGPATH) -m -i $(CRT_DIR))/SOURCES_MPC57XX \
			-I$(shell $(CYGPATH) -m -i $(CRT_DIR))/SOURCES_MPC57XX/$(PLATFORM)\
			-mcpu=e200z4 -mfpu=sp_full -mvle -mfloat-gprs=yes -mhard-float -static \
			-O3 -g3 -fno-strict-aliasing -Wall -Wextra -Werror -Wdouble-promotion -Wfloat-equal \
			-Wconversion -Wpointer-arith -std=gnu99 -ffunction-sections -fdata-sections \
			-D$(PLATFORM_DEF)=1

CFLAGS += -DTEST_DYNAMIC=1 -DconfigSUPPORT_STATIC_ALLOCATION=0 -DconfigSUPPORT_DYNAMIC_ALLOCATION=1

LDFLAGS :=  --sysroot=$(shell $(CYGPATH) -m -i $(COMPILER_LIBS)) -mcpu=e200z4 -mfpu=sp_full -Xlinker -Map=$(shell $(CYGPATH) -m -i $(OUT_ROOT)/$(TEST_NAME).map) \
			-nostartfiles -T$(shell $(CYGPATH) -m -i $(CRT_DIR))/LINKERSCRIPTS/flash_$(PLATFORM).ld -static -Xlinker --gc-sections -Xlinker --print-gc-sections
			