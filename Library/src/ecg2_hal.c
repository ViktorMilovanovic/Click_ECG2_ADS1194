/*******************************************************************************
* Title                 :   ECG2 HAL
* Filename              :   ECG2_hal.c
* Author                :   MSV
* Origin Date           :   01/02/2016
* Notes                 :   None
*******************************************************************************/
/*************** MODULE REVISION LOG ******************************************
*
*    Date    Software Version    Initials       Description
*  01/02/16       1.0.0             MSV        Module Created.
*
*******************************************************************************/
/**
 * @file ECG2_hal.c
 * @brief <h2> HAL layer </h2>
 */
/******************************************************************************
* Includes
*******************************************************************************/

#include "ecg2_hal.h"
#include <stdint.h>

extern sfr sbit ECG2_CS;
extern sfr sbit ECG2_RESET;

extern sfr sbit ECG2_DRDY;          // DRDY# pin, active low when conversion data are ready
extern sfr sbit ECG2_PWDN;          // PWDN is power down pin, when low ECG chip is in power down mode, this pin must be high for exit power down mode
extern sfr sbit ECG2_RESET;         // pull RESET pin low to reset ECG chip
extern sfr sbit ECG2_PACE;          // analog input for pulse detect

/******************************************************************************
* Module Typedefs
*******************************************************************************/
#if defined( __MIKROC_PRO_FOR_ARM__ )
typedef void ( *write_spi_t )( uint16_t data_ );
typedef uint16_t ( *read_spi_t )( uint16_t dummy );
#elif  defined( __MIKROC_PRO_FOR_AVR__ )
typedef void ( *write_spi_t )( uint8_t data_ );
typedef uint16_t ( *read_spi_t )( uint8_t dummy );
#elif  defined( __MIKROC_PRO_FOR_PIC__ )
typedef void ( *write_spi_t )( uint8_t data_ );
typedef uint16_t ( *read_spi_t )( uint8_t dummy );
#elif defined( __MIKROC_PRO_FOR_PIC32__ ) ||  \
       defined( __MIKROC_PRO_FOR_DSPIC__ ) ||  \
       defined( __MIKROC_PRO_FOR_8051__ )
typedef void ( *write_spi_t )( uint16_t data_ );
typedef uint16_t ( *read_spi_t )( uint16_t dummy );
#elif defined( __MIKROC_PRO_FOR_FT90x__ )
typedef void ( *write_spi_t )( uint8_t data_ );
typedef uint8_t ( *read_spi_t )( uint8_t dummy );
#endif

static write_spi_t write_spi_ptr;
static read_spi_t  read_spi_ptr;


/******************************************************************************
* Module Variable Definitions
*******************************************************************************/

/******************************************************************************
* Function Definitions
*******************************************************************************/
void ecg2_hal_cs( uint8_t logic )
{
    ECG2_CS = logic;
}

void ecg2_hal_rts ( uint8_t logic )
{
    ECG2_RESET = logic;
}

void ecg2_hal_init()
{
#if defined( __MIKROC_PRO_FOR_ARM__ )  ||  \
       defined( __MIKROC_PRO_FOR_AVR__ )   ||  \
       defined( __MIKROC_PRO_FOR_PIC__ )   ||  \
       defined( __MIKROC_PRO_FOR_PIC32__ ) ||  \
       defined( __MIKROC_PRO_FOR_DSPIC__ ) ||  \
       defined( __MIKROC_PRO_FOR_8051__ )
    write_spi_ptr = SPI_Write;
    read_spi_ptr  = SPI_Read;
#elif defined( __MIKROC_PRO_FOR_FT90x__ )
    write_spi_ptr = SPIM_Write;
    read_spi_ptr  = SPIM_Read;
#endif
}

int8_t ecg2_hal_read_bytes( uint8_t reg, uint8_t* buffer_in, uint8_t num_bytes)
{
    if (reg > 0b00011111)
        return -1;
    if (num_bytes > 0b00011111)
        return -1;
    else
    {
        uint8_t opcode[2];
        uint8_t *temp_bfr_ptr = buffer_in;
        opcode[0] = 0b00100000;
        opcode[0] |= reg;
        opcode[1] = 0;
        opcode[1] |= num_bytes;

        ECG2_hal_cs(0);
        delay_ms(1);
        write_spi_ptr( opcode[0] );
        write_spi_ptr( opcode[1] );
        delay_ms( 5 );

        while(num_bytes--)
            *(temp_bfr_ptr++) = read_spi_ptr(0);

        ECG2_hal_cs(1);
    }
}

int8_t ecg2_hal_write_bytes ( uint8_t reg, uint8_t* buffer_out, uint8_t num_bytes)
{
    if (reg > 0b00011111)
        return -1;
    if (num_bytes > 0b00011111)
        return -1;
    else
    {
        uint8_t opcode[2];
        uint8_t *temp_bfr_ptr = buffer_out;
        opcode[0] = 0b01000000;
        opcode[0] |= reg;
        opcode[1] = 0;
        opcode[1] |= num_bytes;

        ECG2_hal_cs(0);
        delay_ms(1);
        write_spi_ptr(opcode[0]);
        write_spi_ptr(opcode[1]);

        while(num_bytes--)
            write_spi_ptr(*(temp_bfr_ptr++));
        delay_ms(10);
        ECG2_hal_cs(1);
    }
}

void ecg2_hal_send_command (uint8_t command)
{
  ECG2_CS = 0; // select chip
  Delay_us(1);
  write_spi_ptr( command ); // send command
  Delay_us(10);
  ECG2_CS = 1; // deselect chip
  Delay_us(10);
}
/*************** END OF FUNCTIONS ***************************************************************************/