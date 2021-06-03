/*
 * Copyright 2019 NXP.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

#ifndef HW_SYSTEM_H
#define HW_SYSTEM_H

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdint.h>

/* register access */
#define SYS_REG32(address)      ( *(volatile uint32_t   *)(address) ) /**<  32-bit register */
#define SYS_REG16(address)      ( *(volatile uint16_t *)(address) ) /**<  16-bit register */
#define SYS_REG8(address)       ( *(volatile uint8_t  *)(address) ) /**<   8-bit register */

/*! @} */

/* Interrupt Router base address */
#define IR_BASE_ADDR          0x40260000u
#define CPU_NUM_OFFSET        (0x4u)                        /**<  Processor number register */
#define CPU_NUM_MASK          (0x3u)

#define IR_SPRC(x) SYS_REG16( IR_BASE_ADDR + 0x880 + ((x)<<1) ) /**< Interrupt Router Shared Peripheral Routing Control */
#define IR_ROUTE_INT(id,core)    IR_SPRC(id)=(core)       /**< route interrupt to core, id=0->111, core={0,1} */

#define IR_ROUTE_NO_INT     240

/* Get core id */
#define GET_CORE_ID                                   (SYS_REG32(IR_BASE_ADDR + CPU_NUM_OFFSET) & (CPU_NUM_MASK))

/* route all interrupts to selected core */
#define IR_ROUTE_ALL_2_CPU(core)                 \
            {                                       \
                uint32_t x;                              \
                for (x=0; x<IR_ROUTE_NO_INT; x++) { \
                        IR_ROUTE_INT(x, (core)); \
                    }                               \
            }                                       \

/* Watchdog */
#define SWT_BASE(id)                            (0x40270000+ (id* 0x1FC000))
#define SWT_DISABLE(id)                                         \
            {                                                   \
              SYS_REG32(SWT_BASE(id) + 0x10) = 0xC520;          \
              SYS_REG32(SWT_BASE(id) + 0x10) = 0xD928;          \
              SYS_REG32(SWT_BASE(id)) = 0xFF000040;             \
            }                                                   \

#ifdef __cplusplus
}
#endif

#endif /** HW_SYSTEM_H */