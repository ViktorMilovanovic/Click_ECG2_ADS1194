#line 1 "C:/Users/Viktor/Desktop/Klikovi/ECG2_click/Release/FT900/ecg2_hw.c"
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
#line 4 "C:/Users/Viktor/Desktop/Klikovi/ECG2_click/Release/FT900/ecg2_hw.c"
static inline void register_bit_set(uint8_t reg, uint8_t bit_num, uint8_t val)
{
 uint8_t tempbuff;

 ecg2_hal_read_bytes(reg, &tempbuff, 1);
 if (val == 1)
 tempbuff |= 1 << bit_num;
 else if (val == 0)
 tempbuff &= ~(1 << bit_num);
 ecg2_hal_write_bytes(reg, &tempbuff, 1);
}

uint8_t ecg2_get_device_id()
{
 uint8_t tempbuff;
 ecg2_hal_read_bytes(ID_REG, &tempbuff, 1);
 return tempbuff;
}

void ecg2_daisy_chain_enable( _Bool  enable)
{
 if (enable)
 register_bit_set(CONFIG1_REG, 6, 0);
 else
 register_bit_set(CONFIG1_REG, 6, 1);
}

void ecg2_oscillator_clock_enable (  _Bool  enable )
{

 if (enable)
 register_bit_set(CONFIG1_REG, 5, 0);
 else
 register_bit_set(CONFIG1_REG, 5, 1);
}


int8_t ecg2_set_output_data_rate(output_data_rate_t output_data_rate)
{
 uint8_t tempbuff = 0;
 if (output_data_rate > 7)
 return -1;

 ecg2_hal_read_bytes(CONFIG1_REG, &tempbuff, 1);
 tempbuff &= ~(7);

 tempbuff |= output_data_rate;
 ecg2_hal_write_bytes(CONFIG1_REG, &tempbuff, 1);
 return 0;
}

int8_t ecg2_set_test_source(test_source_t test_source)
{
 if ( test_source > 1)
 return -1;

 else
 register_bit_set(CONFIG2_REG, 4, test_source);

 return 0;
}

int8_t ecg2_set_test_amplitude (test_amplitude_t amplitutde)
{
 if (amplitutde > 1)
 return -1;
 else
 register_bit_set(CONFIG2_REG, 2, 1);

 return 0;
}


int8_t ecg2_set_test_frequency (test_frequency_t frequency)
{
 uint8_t tempbuff = 0;
 if (frequency > 3)
 return -1;

 ecg2_hal_read_bytes(CONFIG2_REG, &tempbuff, 1);

 tempbuff &= ~(3);
 tempbuff |= frequency;
 ecg2_hal_write_bytes(CONFIG2_REG, &tempbuff, 1);
 return 0;
}

void ecg2_power_down_reference_buffer_enable( _Bool  enable)
{
 if (enable)
 register_bit_set(CONFIG3_REG, 7, 1);
 else
 register_bit_set(CONFIG3_REG, 7, 0);
}

int8_t ecg2_set_reference_voltage(reference_voltage_t refvol)
{
 if (refvol > 1)
 return -1;

 else
 register_bit_set(CONFIG3_REG, 5, refvol);
}

void ecg2_rld_measurement_enable(  _Bool  enable )
{
 if (enable)
 register_bit_set(CONFIG3_REG, 4, 0);
 else
 register_bit_set(CONFIG3_REG, 4, 0);
}

int8_t ecg2_rldref_source_select(rldef_signal_t source)
{
 if (source > 1)
 return -1;
 else
 register_bit_set(CONFIG3_REG, 3, source);
}

void ecg2_rld_buffer_enable ( _Bool  enable)
{
 if (enable)
 register_bit_set(CONFIG3_REG, 2, 1);
 else
 register_bit_set(CONFIG3_REG, 2, 0);
}

int8_t ecg2_rld_sense_enable( _Bool  enable)
{
 if (enable)
 register_bit_set(CONFIG3_REG, 1, 1);
 else
 register_bit_set(CONFIG3_REG, 1, 0);
}

uint8_t ecg2_rld_get_status ()
{
 uint8_t tempbuff = 0;
 ecg2_hal_read_bytes(CONFIG3_REG, &tempbuff, 1);
 return (tempbuff & 1);
}

int8_t ecg2_lead_off_comparator_threshold_set(lead_off_threshold_t threshold)
{
 uint8_t tempbuf = 0;
 if (threshold > 7)
 return -1;

 ecg2_hal_read_bytes(LOFF_REG, &tempbuf, 1);
 tempbuf &= ~(7 << 5);
 tempbuf |= threshold << 5;
 ecg2_hal_write_bytes(LOFF_REG, &tempbuf, 1);
 return 0;
}

void ecg2_vlead_off_enable( _Bool  enable)
{
 if (enable)
 register_bit_set(LOFF_REG, 4, 0);
 else
 register_bit_set(LOFF_REG, 4, 1);
}

int8_t ecg2_ilead_off_magnitude_set (ilead_off_magnitude_t set)
{
 uint8_t tempbuf = 0;
 if (set > 3)
 return -1;

 ecg2_hal_read_bytes(LOFF_REG, &tempbuf, 1);
 tempbuf &= ~(3 << 2);
 tempbuf |= set << 2;
 ecg2_hal_write_bytes(LOFF_REG, &tempbuf, 1);
}

int8_t ecg2_flead_off_frequency_set (uint8_t set)
{
 uint8_t tempbuf = 0;
 if (set > 3 )
 return -1;
 ecg2_hal_read_bytes(LOFF_REG, &tempbuf, 1);
 tempbuf &= ~ 3;
 tempbuf |= set;
 ecg2_hal_write_bytes(LOFF_REG, &tempbuf, 1);
}

int8_t ecg2_configure_channel (uint8_t channel,  _Bool  power_down, uint8_t pga_gain, uint8_t channel_input)
{
 uint8_t tempbuff = 0;

 switch (channel)
 {
 case 1:
 if (pga_gain > 7)
 return -1;

 if ( channel_input > 7 )
 return -1;

 tempbuff |= pga_gain << 4;
 tempbuff |= channel_input;
 if (power_down)
 tempbuff |= 1 << 7;
 else
 tempbuff &= ~(1 << 7);

 ecg2_hal_write_bytes(CH1SET_REG, &tempbuff, 1);
 return 0;

 case 2:
 if (pga_gain > 15)
 return -1;

 if ( channel_input > 15 )
 return -1;

 if (power_down)
 tempbuff |= 1 << 7;
 else
 tempbuff &= ~(1 << 7);

 tempbuff |= pga_gain << 4;
 tempbuff |= channel_input;
 ecg2_hal_write_bytes(CH2SET_REG, &tempbuff, 1);
 return 0;

 case 3:
 if (pga_gain > 15)
 return -1;

 if ( channel_input > 15 )
 return -1;

 if (power_down)
 tempbuff |= 1 << 7;
 else
 tempbuff &= ~(1 << 7);

 tempbuff |= pga_gain << 4;
 tempbuff |= channel_input;
 ecg2_hal_write_bytes(CH3SET_REG, &tempbuff, 1);
 return 0;

 case 4:
 if (pga_gain > 15)
 return -1;

 if ( channel_input > 15 )
 return -1;

 if (power_down)
 tempbuff |= 1 << 7;
 else
 tempbuff &= ~(1 << 7);

 tempbuff |= pga_gain << 4;
 tempbuff |= channel_input;
 ecg2_hal_write_bytes(CH4SET_REG, &tempbuff, 1);
 return 0;
 case 5:
 if (pga_gain > 15)
 return -1;

 if ( channel_input > 15 )
 return -1;

 if (power_down)
 tempbuff |= 1 << 7;
 else
 tempbuff &= ~(1 << 7);

 tempbuff |= pga_gain << 4;
 tempbuff |= channel_input;
 ecg2_hal_write_bytes(CH5SET_REG, &tempbuff, 1);
 return 0;

 case 6:
 if (pga_gain > 15)
 return -1;

 if ( channel_input > 15 )
 return -1;

 if (power_down)
 tempbuff |= 1 << 7;
 else
 tempbuff &= ~(1 << 7);

 tempbuff |= pga_gain << 4;
 tempbuff |= channel_input;
 ecg2_hal_write_bytes(CH6SET_REG, &tempbuff, 1);
 return 0;

 case 7:
 if (pga_gain > 15)
 return -1;

 if ( channel_input > 15 )
 return -1;

 if (power_down)
 tempbuff |= 1 << 7;
 else
 tempbuff &= ~(1 << 7);

 tempbuff |= pga_gain << 4;
 tempbuff |= channel_input;
 ecg2_hal_write_bytes(CH7SET_REG, &tempbuff, 1);
 return 0;

 case 8:
 if (pga_gain > 15)
 return -1;

 if ( channel_input > 15 )
 return -1;

 if (power_down)
 tempbuff |= 1 << 7;
 else
 tempbuff &= ~(1 << 7);

 tempbuff |= pga_gain << 4;
 tempbuff |= channel_input;
 ecg2_hal_write_bytes(CH8SET_REG, &tempbuff, 1);
 return 0;

 default:
 return -1;
 }
}

void ecg2_right_leg_positive_drive_set(uint8_t set)
{
 uint8_t tempbuff = set;
 ecg2_hal_write_bytes(RLD_SENSP_REG, &tempbuff, 1);
}

void ecg2_right_leg_negative_drive_set(uint8_t set)
{
 uint8_t tempbuff = set;
 ecg2_hal_write_bytes(RLD_SENSN_REG, &tempbuff, 1);
}

void ecg2_lead_off_positive_channel_select (uint8_t set)
{
 uint8_t tempbuff = set;
 ecg2_hal_write_bytes(LOFF_SENSP_REG, &tempbuff, 1);
}

void ecg2_lead_off_negative_channel_select (uint8_t set)
{
 uint8_t tempbuff = set;
 ecg2_hal_write_bytes(LOFF_SENSN_REG, &tempbuff, 1);
}

void ecg2_lead_off_current_direction_select (uint8_t set)
{
 uint8_t tempbuff = set;
 ecg2_hal_write_bytes(LOFF_FLIP_REG, &tempbuff, 1);
}

int8_t ecg2_pace_detect_even_channels_select (pace_even_channels_t select)
{
 if (select > 3)
 return -1;

 else
 {
 uint8_t tempbuff = select;
 ecg2_hal_read_bytes(PACE_REG, &tempbuff, 1);
 tempbuff &= ~(3 << 3);
 tempbuff |= select << 3;
 ecg2_hal_write_bytes(PACE_REG, &tempbuff, 1 );
 return 0;
 }
}

int8_t ecg2_pace_detect_odd_channels_select (pace_odd_channels_t select)
{
 if (select > 3)
 return -1;

 else
 {
 uint8_t tempbuff = select;
 ecg2_hal_read_bytes(PACE_REG, &tempbuff, 1 );
 tempbuff &= ~(3 << 1);
 tempbuff |= select << 1;
 ecg2_hal_write_bytes(PACE_REG, &tempbuff, 1 );
 return 0;
 }
}

int8_t ecg2_pace_detect_buffer_enable (  _Bool  enable )
{
 if (enable)
 register_bit_set(PACE_REG, 0, 1);
 else
 register_bit_set(PACE_REG, 0, 0);
}

void ecg2_single_shot_conversion_enable (  _Bool  enable )
{
 if (enable)
 register_bit_set(CONFIG4_REG, 3, 1);
 else
 register_bit_set(CONFIG4_REG, 3, 0);
}

void ecg2_wct_to_rld_connection_enable (  _Bool  enable )
{
 if (enable)
 register_bit_set(CONFIG4_REG, 2, 1);
 else
 register_bit_set(CONFIG4_REG, 2, 0);
}

void ecg2_lead_off_comparator_enable ( _Bool  enable )
{
 if (enable)
 register_bit_set(CONFIG4_REG, 1, 1);
 else
 register_bit_set(CONFIG4_REG, 1, 0);
}

void ecg2_wilson_center_terminal_configure (uint16_t set)
{
 uint8_t tempbuff[2];
 tempbuff[0] = (uint8_t) set;
 tempbuff[1] = (uint8_t) (set >> 8);

 ecg2_hal_write_bytes(WCT1_REG, tempbuff, 2);
}
