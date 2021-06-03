/******************************************************************************
*
*   Freescale(TM) and the Freescale logo are trademarks of Freescale Semiconductor, Inc.
*   All other product or service names are the property of their respective owners.
*   (c) Copyright 2016 Freescale Semiconductor Inc.
*   Copyright 2019 NXP.
*
*   Permission is hereby granted, free of charge, to any person obtaining a copy of
*   this software and associated documentation files (the "Software"), to deal in
*   the Software without restriction, including without limitation the rights to
*   use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
*   the Software, and to permit persons to whom the Software is furnished to do so,
*   subject to the following conditions:
*
*   The above copyright notice and this permission notice shall be included in all
*   copies or substantial portions of the Software.
*
*   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
*   FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
*   COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
*   IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
*   CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*
* Description:    Vector table for FreeRTOS sample application
*
* Notes:
*
******************************************************************************/
.extern Reset_Handler          
.extern OSNmiException         
.extern OSHardFaultException   
.extern OSMemManageException   
.extern OSBusFaultException    
.extern OSUsageFaultException  
.extern OSReservedException    
.extern OSReservedException    
.extern OSReservedException    
.extern OSReservedException    
.extern SVC_Handler     
.extern OSDebugMonitorException
.extern OSReservedException    
.extern PendSV_Handler      
.extern SysTick_Handler
.extern OSInterruptDispatcher

.section .vector,"ax"
.align 2
.thumb
.globl VTABLE
VTABLE:

.long _Stack_start             /* Top of Stack for Initial Stack Pointer */
.long Reset_Handler            /* Reset Handler */
.long OSNmiException           /* NMI Handler */
.long OSHardFaultException     /* Hard Fault Handler */
.long OSMemManageException     /* Mem Manage Handler */
.long OSBusFaultException      /* Bus Fault Handler */
.long OSUsageFaultException    /* Usage Fault Handler */
.long OSReservedException      /* Reserved */
.long OSReservedException      /* Reserved */
.long OSReservedException      /* Reserved */
.long OSReservedException      /* Reserved */
.long SVC_Handler              /* SVCall Handler */
.long OSDebugMonitorException  /* Debug Monitor Handler */
.long OSReservedException      /* Reserved */
.long PendSV_Handler           /* PendSV Handler */
.long SysTick_Handler          /* SysTick Handler */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 16 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 32 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 48 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 64 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 80 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 96 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 112 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 128 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 144 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 160 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 176 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 192 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 208 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 224 */

/* External interrupts */
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher
.long OSInterruptDispatcher     /* 240 */

.size VTABLE, . - VTABLE

