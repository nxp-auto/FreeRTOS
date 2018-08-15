/*
*   Copyright 2018 NXP
*/

#ifndef HW_PIT_H
#define HW_PIT_H

#include "hw_typedefs.h"
#include "hw_base.h"

#ifdef __cplusplus
extern "C" {
#endif

    #define HWPIT_MCR           HWREG32(HWPIT_BASE_ADDR)           /* PIT Module Control Register */

    #define HWPIT_RTI_LDVAL     HWREG32(HWPIT_BASE_ADDR + 0xF0U)   /* PIT_RTI Timer Load Value Register */
    #define HWPIT_RTI_CVAL      HWREG32(HWPIT_BASE_ADDR + 0xF4U)   /* PIT_RTI Timer Current Timer Value Register */
    #define HWPIT_RTI_TCTRL     HWREG32(HWPIT_BASE_ADDR + 0xF8U)   /* PIT_RTI Timer Control Register */
    #define HWPIT_RTI_TFLG      HWREG32(HWPIT_BASE_ADDR + 0xFCU)   /* PIT_RTI Timer Flag Register */

    #define HWPIT_LDVAL(chid)   HWREG32(HWPIT_BASE_ADDR + 0x100U + 16U*(chid))   /* PIT Timer Load Value Register */
    #define HWPIT_CVAL(chid)    HWREG32(HWPIT_BASE_ADDR + 0x104U + 16U*(chid))   /* PIT Timer Current Timer Value Register */
    #define HWPIT_TCTRL(chid)   HWREG32(HWPIT_BASE_ADDR + 0x108U + 16U*(chid))   /* PIT Timer Control Register */
    #define HWPIT_TFLG(chid)    HWREG32(HWPIT_BASE_ADDR + 0x10CU + 16U*(chid))   /* PIT Timer Flag Register */

    #define HWPIT_MCR_FRZ       (unsigned int)0x00000001U
    #define HWPIT_MCR_MDIS      (unsigned int)0x00000002U
    #define HWPIT_MCR_MDIS_RIT  (unsigned int)0x00000004U

    #define HWPIT_TCTRL_TEN     (unsigned int)0x00000001U
    #define HWPIT_TCTRL_TIE     (unsigned int)0x00000002U

    #define HWPIT_TFLG_TIF      (unsigned int)0x00000001U

    #if ((configUSE_PIT_CHANNEL<0) || (configUSE_PIT_CHANNEL>MAX_PIT_CHANNEL))
    #error "configUSE_PIT_CHANNEL parameter out of range"
    #endif

    #define HWPIT_GET_INTID(chid) (unsigned int)(chid + 301U)

#ifdef  __cplusplus
}
#endif

#endif /* HW_PIT_H */


