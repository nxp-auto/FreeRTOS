/**************************************************************************************
*
*   Freescale(TM) and the Freescale logo are trademarks of Freescale Semiconductor, Inc.
*   All other product or service names are the property of their respective owners.
*   (c) Copyright 2014 - 2015 Freescale Semiconductor Inc.
*   Copyright 2017 NXP
*   All Rights Reserved.
*
*   You can use this example for any purpose on any computer system with the
*   following restrictions:
*
*   1. This example is provided "as is", without warranty.
*
*   2. You don't remove this copyright notice from this example or any direct derivation
*      thereof.
*
*  Description:  GNU GCC linker command file for FreeRTOS sample application
*
**************************************************************************************/
HEAP_SIZE  = DEFINED(__heap_size__)  ? __heap_size__  : 0x00003000;
ENTRY(Reset_Handler)

MEMORY
{
    OsInternalRAM (rwx)  : ORIGIN = 0x20400000, LENGTH = 0x20000  /* 128K should be enough for sample */
}

SECTIONS
{
    .vector :
    {
        . = ALIGN(4);
        VTABLE = .;     /* define VTABLE start address */
        KEEP(*(.vector)) /* Startup code */
        . = ALIGN(4);
    } > OsInternalRAM
    .startup :
    {
        . = ALIGN(4);
        KEEP(*(.startup)) /* Startup code */
        . = ALIGN(4);
    } > OsInternalRAM
    .text :
    {
        . = ALIGN(4);
        *(.text)           /* .text sections (code) */
        *(.text*)          /* .text* sections (code) */
        *(.rodata)         /* .rodata sections (constants, strings, etc.) */
        *(.rodata*)        /* .rodata* sections (constants, strings, etc.) */
        *(.glue_7)         /* glue arm to thumb code */
        *(.glue_7t)        /* glue thumb to arm code */
        *(.eh_frame)
        KEEP (*(.init))
        KEEP (*(.fini))
        . = ALIGN(4);
        _etext = .;        /* define a global symbols at end of code */
    } > OsInternalRAM
    /* Initialized data sections goes into RAM, load LMA copy after code */
    .data : 
    {
        . = ALIGN(4);
        _sdata = .;        /* create a global symbol at data start */
        *(.data)           /* .data sections */
        *(.data*)          /* .data* sections */

        . = ALIGN(4);
        _edata = .;        /* define a global symbol at data end */
      } > OsInternalRAM

    /* Uninitialized data section */
    . = ALIGN(4);
    .bss :
    {
        /* This is used by the startup in order to initialize the .bss secion */
        _sbss = .;         /* define a global symbol at bss start */
        __bss_start__ = _sbss;
        *(.bss)
        *(.bss*)
        *(COMMON)

        . = ALIGN(4);
        _ebss = .;         /* define a global symbol at bss end */
        __bss_end__ = _ebss;
    } > OsInternalRAM

    .heap (NOLOAD):
    {
        . += ALIGN(4);
        _end = .;
        end = .;
        _heap_start = .;
        . += HEAP_SIZE;
        _heap_end = .;
    } > OsInternalRAM

    .stack_main :
    {
        . = ALIGN(4);
        _Stack_end = .;
        *(.stack_main)
        _Stack_start = .;
    } > OsInternalRAM
}