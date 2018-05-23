/*
*   Copyright 2018 NXP
*/

#ifndef PLATFORM_H
#define PLATFORM_H

#include "hw_clock.h"
#include "hw_gpio.h"
#include "hw_intc.h"
#include "hw_pit.h"
#include "hw_wdg.h"

#ifdef __cplusplus
extern "C" {
#endif

    #define OSMSYNC  asm("msync\n")

    /* interrupt handlers type */
    typedef void(*OSInterruptHandlerPtr)(void);
    /* for unused/unexpected interrupts */
    void prvPortTimerSetup(OSInterruptHandlerPtr paramF, uint32_t tick_interval);
    void resetTimer(void);
    void OS_UnusedInterruptHandler(void);
    void OS_InstallInterruptHandler(OSInterruptHandlerPtr handlerFn, unsigned int vectorNum, unsigned char Priority);
    void OS_DisableINTCInput (unsigned int vectorNum);
    void OS_PlatformInit(void);
    void stmOpen(uint32_t, uint32_t);
    void stmUpdate(uint32_t, uint32_t);

#ifdef __cplusplus
}
#endif

#endif /* PLATFORM_H */

