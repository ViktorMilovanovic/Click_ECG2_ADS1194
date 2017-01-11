#line 1 "C:/Users/Viktor/Desktop/Klikovi/ECG2_click/Release/FT900/ecg2_hal.c"
#line 1 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hal.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for ft90x/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for ft90x/include/stdbool.h"



 typedef char _Bool;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for ft90x/include/stddef.h"



typedef long ptrdiff_t;


 typedef unsigned long size_t;

typedef unsigned long wchar_t;
#line 35 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hal.h"
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
#line 88 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hal.h"
void ecg2_hal_cs( uint8_t logic );
#line 95 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hal.h"
void ecg2_hal_rst( uint8_t logic );
#line 102 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hal.h"
void ecg2_hal_init ( void );
#line 116 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hal.h"
void ecg2_hal_write
(
 uint8_t* buffer,
 uint16_t count
);
#line 134 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hal.h"
void ecg2_hal_read
(
 uint8_t* buffer,
 uint16_t count
);
#line 153 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hal.h"
void ecg2_hal_transfer
(
 uint8_t* input,
 uint8_t* output,
 uint16_t count
);

int8_t ecg2_hal_read_bytes( uint8_t reg, uint8_t* buffer_in, uint8_t num_bytes);

int8_t ecg2_hal_write_bytes ( uint8_t reg, uint8_t* buffer_out, uint8_t num_bytes);

void ecg2_hal_send_command (uint8_t command);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for ft90x/include/stdint.h"
#line 25 "C:/Users/Viktor/Desktop/Klikovi/ECG2_click/Release/FT900/ecg2_hal.c"
extern sfr sbit ECG2_CS;
extern sfr sbit ECG2_RESET;

extern sfr sbit ECG2_DRDY;
extern sfr sbit ECG2_PWDN;
extern sfr sbit ECG2_RESET;
extern sfr sbit ECG2_PACE;
#line 51 "C:/Users/Viktor/Desktop/Klikovi/ECG2_click/Release/FT900/ecg2_hal.c"
typedef void ( *write_spi_t )( uint8_t data_ );
typedef uint8_t ( *read_spi_t )( uint8_t dummy );


static write_spi_t write_spi_ptr;
static read_spi_t read_spi_ptr;
#line 66 "C:/Users/Viktor/Desktop/Klikovi/ECG2_click/Release/FT900/ecg2_hal.c"
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
#line 87 "C:/Users/Viktor/Desktop/Klikovi/ECG2_click/Release/FT900/ecg2_hal.c"
 write_spi_ptr = SPIM_Write;
 read_spi_ptr = SPIM_Read;

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
 ECG2_CS = 0;
 Delay_us(1);
 write_spi_ptr( command );
 Delay_us(10);
 ECG2_CS = 1;
 Delay_us(10);
}
