#line 1 "C:/Users/Viktor/Desktop/Klikovi/ECG2_click/Release/FT900/ecg2_click_example.c"
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
#line 1 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
typedef enum
{
 KSPS_8 = 0,
 KSPS_4,
 KSPS_2,
 KSPS_1,
 SPS_500,
 SPS_250,
 SPS_125
}output_data_rate_t;

typedef enum
{
 TEST_SOURCE_EXTERNAL = 0,
 TEST_SOURCE_INTERNAL
}test_source_t;

typedef enum
{
 NEGATIVE_1 = 0,
 NEGATIVE_2
}test_amplitude_t;

typedef enum
{
 F_DIV_2_TO_21,
 F_DIV_2_TO_20,
 NOT_USED,
 AT_DC
}test_frequency_t;

typedef enum
{
 VREF_2_4V,
 VREF_4V
}reference_voltage_t;

typedef enum
{
 RLDEF_SIGNAL_EXTERNAL,
 RLDEF_SIGNAL_INTERNAL
}rldef_signal_t;

typedef enum
{
 POSITIVE_50 = 0,
 POSITIVE_92_5,
 POSITIVE_90,
 POSITIVE_87_5,
 POSITIVE_85,
 POSITIVE_80,
 POSITIVE_75,
 POSITIVE_70,
 NEGATIVE_5 = 0,
 NEGATIVE_7_5,
 NEGATIVE_10,
 NEGATIVE_12_5,
 NEGATIVE_15,
 NEGATIVE_20,
 NEGATIVE_25,
 NEGATIVE_30
}lead_off_threshold_t;

typedef enum
{
 NA_4,
 NA_8,
 NA_12,
 NA_16
}ilead_off_magnitude_t;

typedef enum
{
 CHANNEL_2 = 0,
 CHANNEL_4,
 CHANNEL_6,
 CHANNEL_8,
}pace_even_channels_t;

typedef enum
{
 CHANNEL_1 = 0,
 CHANNEL_3,
 CHANNEL_5,
 CHANNEL_7
}pace_odd_channels_t;
#line 95 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
uint8_t ecg2_get_device_id();
#line 104 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_daisy_chain_enable( _Bool  enable);
#line 113 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_oscillator_clock_enable (  _Bool  enable );
#line 122 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
int8_t ecg2_set_output_data_rate(output_data_rate_t output_data_rate);
#line 132 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
int8_t ecg2_set_test_source(test_source_t test_source);
#line 142 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
int8_t ecg2_set_test_amplitude (test_amplitude_t amplitutde);
#line 152 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
int8_t ecg2_set_test_frequency (test_frequency_t frequency);
#line 161 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_power_down_reference_buffer_enable( _Bool  enable);
#line 171 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
int8_t ecg2_set_reference_voltage(reference_voltage_t refvol);
#line 179 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_rld_measurement_enable(  _Bool  enable );
#line 189 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
int8_t ecg2_rldref_source_select(rldef_signal_t source);
#line 197 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_rld_buffer_enable( _Bool  enable);
#line 205 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_rld_sense_enable( _Bool  enable);
#line 213 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
uint8_t ecg2_rld_get_status ();
#line 223 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
int8_t ecg2_lead_off_comparator_threshold_set(lead_off_threshold_t threshold);
#line 231 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_vlead_off_enable( _Bool  enable);
#line 241 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
int8_t ecg2_ilead_off_magnitude_set (ilead_off_magnitude_t set);
#line 251 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
int8_t ecg2_flead_off_frequency_set (uint8_t set);
#line 267 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
int8_t ecg2_configure_channel (uint8_t channel,  _Bool  power_down, uint8_t pga_gain, uint8_t channel_input);
#line 276 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_right_leg_positive_drive_set(uint8_t set);
#line 285 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_right_leg_negative_drive_set(uint8_t set);
#line 294 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_lead_off_positive_channel_select (uint8_t set);
#line 303 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_lead_off_negative_channel_select (uint8_t set);
#line 312 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_lead_off_current_direction_select (uint8_t set);
#line 323 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
int8_t ecg2_pace_detect_even_channels_select (pace_even_channels_t select);
#line 334 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
int8_t ecg2_pace_detect_odd_channels_select (pace_odd_channels_t select);
#line 342 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_pace_detect_buffer_enable (  _Bool  enable );
#line 350 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_single_shot_conversion_enable (  _Bool  enable );
#line 358 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_wct_to_rld_connection_enable (  _Bool  enable );
#line 366 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_lead_off_comparator_enable ( _Bool  enable );
#line 374 "c:/users/viktor/desktop/klikovi/ecg2_click/release/ft900/ecg2_hw.h"
void ecg2_wilson_center_terminal_configure (uint16_t set);
#line 5 "C:/Users/Viktor/Desktop/Klikovi/ECG2_click/Release/FT900/ecg2_click_example.c"
const num_bytes_sample = 19;
const double channel_gain = 20.00;
const double vref = 2400.00;


sbit ECG2_CS at GPIO_PIN28_bit;
sbit ECG2_DRDY at GPIO_PIN3_bit;
sbit ECG2_PWDN at GPIO_PIN56_bit;
sbit ECG2_RESET at GPIO_PIN1_bit;
sbit ECG2_PACE at GPIO_PIN9_bit;



unsigned char ecg_data_sample[num_bytes_sample];
double channel1_voltage;
double channel2_voltage;
double channel3_voltage;
double channel4_voltage;
double channel1_voltage_offset;
double channel2_voltage_offset;
double channel3_voltage_offset;
double channel4_voltage_offset;
#line 44 "C:/Users/Viktor/Desktop/Klikovi/ECG2_click/Release/FT900/ecg2_click_example.c"
double calculate_ecg_channel( unsigned char *buffer, unsigned short index, double refv, double gain, double offset_voltage )
{
 int adc_value = 0;
 adc_value = 0;
 adc_value = buffer[index];
 adc_value <<= 8;
 adc_value |= buffer[index + 1];
 return ( ((double)adc_value * (refV / (32768 - 1))) / gain ) - offset_voltage;
}


void setup_ecg2()
{
 uint8_t tempread, tempctr;
 ecg2_oscillator_clock_enable( 1 );
 ecg2_set_output_data_rate(SPS_125);

 ecg2_set_test_source(TEST_SOURCE_EXTERNAL);

 ecg2_power_down_reference_buffer_enable( 1 );
 ecg2_set_reference_voltage(vref_2_4V);
 ecg2_rld_measurement_enable( 1 );
 ecg2_rldref_source_select(RLDEF_SIGNAL_INTERNAL);
 ecg2_rld_buffer_enable( 1 );

 ecg2_lead_off_comparator_threshold_set(POSITIVE_70);
 ecg2_vlead_off_enable( 0 );
 ecg2_ilead_off_magnitude_set(NA_4);
 ecg2_flead_off_frequency_set(3);


 ecg2_configure_channel(1,  0 , 0, 1);


 ecg2_configure_channel(2,  0 , 0, 1);


 ecg2_configure_channel(3,  0 , 0, 1);

 ecg2_configure_channel(4,  0 , 0, 1);

 ecg2_right_leg_positive_drive_set(2);

 ecg2_right_leg_negative_drive_set(2);

 ecg2_lead_off_positive_channel_select(5);

 ecg2_lead_off_negative_channel_select(2);

 ecg2_lead_off_current_direction_select(0);

 ecg2_lead_off_comparator_enable( 1 );

 ecg2_hal_send_command(START_COMMAND);
 Delay_us(100);
 ecg2_hal_send_command(RDATA_COMMAND);
 ECG2_CS = 0;
 Delay_us(1);

 while (ECG2_DRDY) {}
 Delay_us(5);
 for (tempctr = 0; tempctr < num_bytes_sample; tempctr++) { ecg_data_sample[tempctr] = SPIM_Read(0); }


 channel1_voltage_offset = calculate_ecg_channel( ecg_data_sample, 3, vref, channel_gain, 0 );

 channel2_voltage_offset = calculate_ecg_channel( ecg_data_sample, 5, vref, channel_gain, 0 );

 channel3_voltage_offset = calculate_ecg_channel( ecg_data_sample, 7, vref, channel_gain, 0 );

 channel4_voltage_offset = calculate_ecg_channel( ecg_data_sample, 9, vref, channel_gain, 0 );
 ECG2_CS = 1;
 Delay_us(10);


 ecg2_hal_send_command(STOP_COMMAND);
 Delay_us(100);
 ecg2_hal_send_command(SDATAC_COMMAND);




 ecg2_configure_channel(1,  0 , 6, 0);


 ecg2_configure_channel(2,  0 , 6, 0);


 ecg2_configure_channel(3,  0 , 6, 0);


 ecg2_configure_channel(4,  0 , 6, 4);
 ecg2_hal_send_command(START_COMMAND);
 Delay_us(100);
 ecg2_hal_send_command(RDATAC_COMMAND);

 ECG2_CS = 0;
 Delay_us(1);

}

void main()
{
 uint16_t i = 0;
 double time_value = 0.0;
 char timer_read_string[10];
 char final_string [20];
 GPIO_Digital_Input( &GPIO_PORT_00_07, _GPIO_PINMASK_3 );
 GPIO_Digital_Output(&GPIO_PORT_56_63, _GPIO_PINMASK_0 );
 ECG2_PWDN = 1;
 GPIO_Digital_Output( &GPIO_PORT_24_31, _GPIO_PINMASK_4 );
 ECG2_CS = 1;
 GPIO_Digital_Output( &GPIO_PORT_00_07, _GPIO_PINMASK_1 );
 ECG2_RESET = 1;

 UART1_Init(57600);
 delay_ms(300);
 Uart_Write_Text("Uart init\r\n");

 SPIM1_Init_Advanced( _SPI_MASTER_CLK_RATIO_64, _SPI_CFG_PHASE_CAPTURE_RISING |
 _SPI_CFG_POLARITY_IDLE_LOW | _SPI_CFG_SS_AUTO_DISABLE |
 _SPI_CFG_FIFO_DISABLE, _SPI_SS_LINE_NONE );
 delay_ms(300);

 ecg2_hal_init();


 ECG2_RESET = 0;
 Delay_us(100);
 ECG2_RESET = 1;

 Delay_ms(1000);


 ecg2_hal_send_Command(SDATAC_COMMAND);

 Delay_ms(1000);

 setup_ecg2();
 Uart_Write_Text("START\r\n");
 while (1)
 {

 while (ECG2_DRDY) {}
 Delay_us(5);
 for (i = 0; i < num_bytes_sample; i++)
 ecg_data_sample[i] = SPIM_Read(0);


 time_value += 8.0;


 channel1_voltage = calculate_ecg_channel( ecg_data_sample, 3, vref, channel_gain, channel1_voltage_offset );

 channel2_voltage = calculate_ecg_channel( ecg_data_sample, 5, vref, channel_gain, channel2_voltage_offset );
 sprintf(final_string, "%.2f", channel2_voltage);
 strcat(final_string, ",");
 sprintf(timer_read_string, "%.2f", time_value);
 strcat(final_string, timer_read_string);
 Uart_Write_Text(final_string);
 Uart_Write_Text("\r\n");


 channel3_voltage = calculate_ecg_channel( ecg_data_sample, 7, vref, channel_gain, channel3_voltage_offset );

 channel4_voltage = calculate_ecg_channel( ecg_data_sample, 9, vref, channel_gain, channel4_voltage_offset );
 }
}
