/****************************************************************************
* Title                 :   ECG2 HAL
* Filename              :   ECG2_hal.h
* Author                :   MSV
* Origin Date           :   01/02/2016
* Notes                 :   None
*****************************************************************************/
/**************************CHANGE LIST **************************************
*
*    Date    Software Version    Initials       Description
*  28/07/16       1.2.0             MSV        Module Improved.
*
*****************************************************************************/

/**
 * @file ECG2_hal.h
 * @brief <h2> HAL layer </h2>
 */

#ifndef ECG2_HAL_H_
#define ECG2_HAL_H_

/******************************************************************************
* Includes
*******************************************************************************/

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

/******************************************************************************
* Function Prototypes
*******************************************************************************/

typedef enum
{
    ID_REG = 0,
    CONFIG1_REG,
    CONFIG2_REG,
    CONFIG3_REG,
    LOFF_REG,
    CH1SET_REG,
    CH2SET_REG,
    CH3SET_REG,
    CH4SET_REG,
    CH5SET_REG,
    CH6SET_REG,
    CH7SET_REG,
    CH8SET_REG,
    RLD_SENSP_REG,
    RLD_SENSN_REG,
    LOFF_SENSP_REG,
    LOFF_SENSN_REG,
    LOFF_FLIP_REG,
    LOFF_STATP_REG,
    LOFF_STATN_REG,
    GPIO_REG,
    PACE_REG,
    CONFIG4_REG = 0x17,
    WCT1_REG,
    WCT2_REG
}registers;

typedef enum
{
   WAKEUP_COMMAND = 0x02,
   STANDBY_COMMAND = 0x04,
   RESET_COMMAND = 0x06,
   START_COMMAND = 0x08,
   STOP_COMMAND = 0x0A,
   RDATAC_COMMAND = 0x10,
   SDATAC_COMMAND,
   RDATA_COMMAND,
   RREG_COMMAND = 0x20,
   WREG_COMMAND = 0x40
}commands;

#ifdef __cplusplus
extern "C"{
#endif

/**
 * @brief <h3> CS Control </h3>
 *
 * @param[in] logic - logical state of CS pin
 */
void ecg2_hal_cs( uint8_t logic );

/**
 * @brief <h3> RST Control </h3>
 *
 * @param[in] logic - logical state of RST pin
 */
void ecg2_hal_rst( uint8_t logic );

/**
 * @brief <h3> HAL Initialization </h3>
 *
 * Hal layer initialization. Must be called before any other function.
 */
void ecg2_hal_init ( void );

/**
 * @brief <h3> SPI Write </h3>
 *
 * @par
 * Writes data through SPI bus
 *
 * @note Function have no affect to the CS PIN state - chip select is
 * controled directly from HW layer.
 *
 * @param[in] buffer
 * @param[in] count
 */
void ecg2_hal_write
(
        uint8_t* buffer,
        uint16_t count
);

/**
 * @brief <h3> SPI Read </h3>
 *
 * @par
 * Reads data from SPI bus
 *
 * @note Function have no affect to the CS PIN state - chip select is
 * controled directly from HW layer
 *
 * @param[out] buffer
 * @param[in] count
 */
void ecg2_hal_read
(
        uint8_t* buffer,
        uint16_t count
);

/**
 * @brief <h3> SPI Transfer </h3>
 *
 * @par
 * Transfers data through the SPI bus.
 *
 * @note Function have no affect to the CS PIN state - chip select is
 * controled directly from HW layer
 *
 * @param[in] input
 * @param[out] output
 * @param[in] count
 */
void ecg2_hal_transfer
(
        uint8_t* input,
        uint8_t* output,
        uint16_t count
);

int8_t ecg2_hal_read_bytes( uint8_t reg, uint8_t* buffer_in, uint8_t num_bytes);

int8_t ecg2_hal_write_bytes ( uint8_t reg, uint8_t* buffer_out, uint8_t num_bytes);

void ecg2_hal_send_command (uint8_t command);

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* ECG2_HAL_H_ */

/*** End of File **************************************************************/