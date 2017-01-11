_calculate_ecg_channel:
;ecg2_click_example.c,52 :: 		double calculate_ecg_channel( unsigned char *buffer, unsigned short index, double refv, double gain, double offset_voltage )
ADDIU	SP, SP, -8
SW	RA, 0(SP)
; offset_voltage start address is: 64 (R16)
LW	R16, 8(SP)
;ecg2_click_example.c,54 :: 		int adc_value = 0;
;ecg2_click_example.c,56 :: 		adc_value = buffer[index];
ANDI	R2, R26, 255
ADDU	R2, R25, R2
LBU	R2, 0(R2)
; adc_value start address is: 12 (R3)
ANDI	R3, R2, 255
;ecg2_click_example.c,57 :: 		adc_value <<= 8;
SEH	R2, R3
; adc_value end address is: 12 (R3)
SLL	R3, R2, 8
;ecg2_click_example.c,58 :: 		adc_value |= buffer[index + 1];
ANDI	R2, R26, 255
ADDIU	R2, R2, 1
SEH	R2, R2
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;ecg2_click_example.c,59 :: 		return ( ((double)adc_value * (refV / (32768 - 1))) / gain ) - offset_voltage;
SEH	R4, R2
JAL	__SignedIntegralToFLoat+0
NOP	
SW	R2, 4(SP)
LUI	R6, 18175
ORI	R6, R6, 65024
MOVZ	R4, R27, R0
JAL	__Div_FP+0
NOP	
LW	R4, 4(SP)
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
MOVZ	R6, R28, R0
MOVZ	R4, R2, R0
JAL	__Div_FP+0
NOP	
MOVZ	R6, R16, R0
MOVZ	R4, R2, R0
JAL	__Sub_FP+0
NOP	
; offset_voltage end address is: 64 (R16)
;ecg2_click_example.c,60 :: 		}
L_end_calculate_ecg_channel:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _calculate_ecg_channel
_setup_ecg:
;ecg2_click_example.c,62 :: 		void setup_ecg()
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;ecg2_click_example.c,64 :: 		uint8_t tempctr = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;ecg2_click_example.c,65 :: 		ecg2_hal_send_command(SDATAC_COMMAND);
ORI	R25, R0, 17
JAL	_ecg2_hal_send_command+0
NOP	
;ecg2_click_example.c,66 :: 		ecg2_oscillator_clock_enable(true);
ORI	R25, R0, 1
JAL	_ecg2_oscillator_clock_enable+0
NOP	
;ecg2_click_example.c,68 :: 		ecg2_set_output_data_rate(SPS_125);
ORI	R25, R0, 6
JAL	_ecg2_set_output_data_rate+0
NOP	
;ecg2_click_example.c,69 :: 		ecg2_set_test_source(TEST_SOURCE_EXTERNAL);
MOVZ	R25, R0, R0
JAL	_ecg2_set_test_source+0
NOP	
;ecg2_click_example.c,71 :: 		ecg2_power_down_reference_buffer_enable(true);
ORI	R25, R0, 1
JAL	_ecg2_power_down_reference_buffer_enable+0
NOP	
;ecg2_click_example.c,72 :: 		ecg2_set_reference_voltage(vref_2_4V);
MOVZ	R25, R0, R0
JAL	_ecg2_set_reference_voltage+0
NOP	
;ecg2_click_example.c,73 :: 		ecg2_rld_measurement_enable(true);
ORI	R25, R0, 1
JAL	_ecg2_rld_measurement_enable+0
NOP	
;ecg2_click_example.c,74 :: 		ecg2_rldref_source_select(RLDEF_SIGNAL_INTERNAL);
ORI	R25, R0, 1
JAL	_ecg2_rldref_source_select+0
NOP	
;ecg2_click_example.c,75 :: 		ecg2_rld_buffer_enable(true);
ORI	R25, R0, 1
JAL	_ecg2_rld_buffer_enable+0
NOP	
;ecg2_click_example.c,78 :: 		ecg2_lead_off_comparator_threshold_set(POSITIVE_70);
ORI	R25, R0, 7
JAL	_ecg2_lead_off_comparator_threshold_set+0
NOP	
;ecg2_click_example.c,79 :: 		ecg2_vlead_off_enable(false);
MOVZ	R25, R0, R0
JAL	_ecg2_vlead_off_enable+0
NOP	
;ecg2_click_example.c,80 :: 		ecg2_ilead_off_magnitude_set(NA_4);
MOVZ	R25, R0, R0
JAL	_ecg2_ilead_off_magnitude_set+0
NOP	
;ecg2_click_example.c,81 :: 		ecg2_flead_off_frequency_set(3);
ORI	R25, R0, 3
JAL	_ecg2_flead_off_frequency_set+0
NOP	
;ecg2_click_example.c,84 :: 		ecg2_configure_channel(1, false, 0, 1);
ORI	R28, R0, 1
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
ORI	R25, R0, 1
JAL	_ecg2_configure_channel+0
NOP	
;ecg2_click_example.c,87 :: 		ecg2_configure_channel(2, false, 0, 1);
ORI	R28, R0, 1
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
ORI	R25, R0, 2
JAL	_ecg2_configure_channel+0
NOP	
;ecg2_click_example.c,90 :: 		ecg2_configure_channel(3, false, 0, 1);
ORI	R28, R0, 1
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
ORI	R25, R0, 3
JAL	_ecg2_configure_channel+0
NOP	
;ecg2_click_example.c,93 :: 		ecg2_configure_channel(4, false, 0, 1);
ORI	R28, R0, 1
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
ORI	R25, R0, 4
JAL	_ecg2_configure_channel+0
NOP	
;ecg2_click_example.c,95 :: 		ecg2_right_leg_positive_drive_set(2);
ORI	R25, R0, 2
JAL	_ecg2_right_leg_positive_drive_set+0
NOP	
;ecg2_click_example.c,97 :: 		ecg2_right_leg_negative_drive_set(2);
ORI	R25, R0, 2
JAL	_ecg2_right_leg_negative_drive_set+0
NOP	
;ecg2_click_example.c,99 :: 		ecg2_lead_off_positive_channel_select(5);
ORI	R25, R0, 5
JAL	_ecg2_lead_off_positive_channel_select+0
NOP	
;ecg2_click_example.c,101 :: 		ecg2_lead_off_negative_channel_select(2);
ORI	R25, R0, 2
JAL	_ecg2_lead_off_negative_channel_select+0
NOP	
;ecg2_click_example.c,103 :: 		ecg2_lead_off_current_direction_select(0);
MOVZ	R25, R0, R0
JAL	_ecg2_lead_off_current_direction_select+0
NOP	
;ecg2_click_example.c,105 :: 		ecg2_lead_off_comparator_enable(true);
ORI	R25, R0, 1
JAL	_ecg2_lead_off_comparator_enable+0
NOP	
;ecg2_click_example.c,107 :: 		ecg2_hal_send_command(START_COMMAND); // send START command
ORI	R25, R0, 8
JAL	_ecg2_hal_send_command+0
NOP	
;ecg2_click_example.c,108 :: 		Delay_us(100);
LUI	R24, 0
ORI	R24, R24, 2666
L_setup_ecg0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_setup_ecg0
NOP	
;ecg2_click_example.c,109 :: 		ecg2_hal_send_command(RDATA_COMMAND); // enable read data once
ORI	R25, R0, 18
JAL	_ecg2_hal_send_command+0
NOP	
;ecg2_click_example.c,110 :: 		ECG2_CS = 0; // chip select
LUI	R2, BitMask(RC2_bit+0)
ORI	R2, R2, BitMask(RC2_bit+0)
_SX	
;ecg2_click_example.c,111 :: 		Delay_us(1);
LUI	R24, 0
ORI	R24, R24, 26
L_setup_ecg2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_setup_ecg2
NOP	
;ecg2_click_example.c,112 :: 		while (ECG2_DRDY) {} // Wait for ADS1194 device to prepare output data.
L_setup_ecg4:
_LX	
EXT	R2, R2, BitPos(RE8_bit+0), 1
BNE	R2, R0, L__setup_ecg42
NOP	
J	L_setup_ecg5
NOP	
L__setup_ecg42:
J	L_setup_ecg4
NOP	
L_setup_ecg5:
;ecg2_click_example.c,113 :: 		delay_us(5);
LUI	R24, 0
ORI	R24, R24, 132
L_setup_ecg6:
ADDIU	R24, R24, -1
BNE	R24, R0, L_setup_ecg6
NOP	
NOP	
NOP	
;ecg2_click_example.c,114 :: 		for (tempctr = 0; tempctr < num_bytes_sample; tempctr++) { ecg_data_sample[tempctr] = SPI_Read(0); } // read ADS1194 output data, one sample
; tempctr start address is: 16 (R4)
MOVZ	R4, R0, R0
; tempctr end address is: 16 (R4)
L_setup_ecg8:
; tempctr start address is: 16 (R4)
ANDI	R2, R4, 255
SLTI	R2, R2, 19
BNE	R2, R0, L__setup_ecg43
NOP	
J	L_setup_ecg9
NOP	
L__setup_ecg43:
ANDI	R3, R4, 255
LUI	R2, hi_addr(_ecg_data_sample+0)
ORI	R2, R2, lo_addr(_ecg_data_sample+0)
ADDU	R2, R2, R3
SW	R2, 24(SP)
SB	R4, 20(SP)
MOVZ	R25, R0, R0
JAL	_SPI_Read+0
NOP	
LBU	R4, 20(SP)
LW	R3, 24(SP)
SB	R2, 0(R3)
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
; tempctr end address is: 16 (R4)
J	L_setup_ecg8
NOP	
L_setup_ecg9:
;ecg2_click_example.c,117 :: 		channel1_voltage_offset = calculate_ecg_channel( ecg_data_sample, 3, vref, channel_gain, 0 );
LUI	R28, 16800
ORI	R28, R28, 0
LUI	R27, 17686
ORI	R27, R27, 0
ORI	R26, R0, 3
LUI	R25, hi_addr(_ecg_data_sample+0)
ORI	R25, R25, lo_addr(_ecg_data_sample+0)
ADDIU	SP, SP, -4
SW	R0, 0(SP)
JAL	_calculate_ecg_channel+0
NOP	
ADDIU	SP, SP, 4
SW	R2, Offset(_channel1_voltage_offset+0)(GP)
;ecg2_click_example.c,119 :: 		channel2_voltage_offset = calculate_ecg_channel( ecg_data_sample, 5, vref, channel_gain, 0 );
LUI	R28, 16800
ORI	R28, R28, 0
LUI	R27, 17686
ORI	R27, R27, 0
ORI	R26, R0, 5
LUI	R25, hi_addr(_ecg_data_sample+0)
ORI	R25, R25, lo_addr(_ecg_data_sample+0)
ADDIU	SP, SP, -4
SW	R0, 0(SP)
JAL	_calculate_ecg_channel+0
NOP	
ADDIU	SP, SP, 4
SW	R2, Offset(_channel2_voltage_offset+0)(GP)
;ecg2_click_example.c,121 :: 		channel3_voltage_offset = calculate_ecg_channel( ecg_data_sample, 7, vref, channel_gain, 0 );
LUI	R28, 16800
ORI	R28, R28, 0
LUI	R27, 17686
ORI	R27, R27, 0
ORI	R26, R0, 7
LUI	R25, hi_addr(_ecg_data_sample+0)
ORI	R25, R25, lo_addr(_ecg_data_sample+0)
ADDIU	SP, SP, -4
SW	R0, 0(SP)
JAL	_calculate_ecg_channel+0
NOP	
ADDIU	SP, SP, 4
SW	R2, Offset(_channel3_voltage_offset+0)(GP)
;ecg2_click_example.c,123 :: 		channel4_voltage_offset = calculate_ecg_channel( ecg_data_sample, 9, vref, channel_gain, 0 );
LUI	R28, 16800
ORI	R28, R28, 0
LUI	R27, 17686
ORI	R27, R27, 0
ORI	R26, R0, 9
LUI	R25, hi_addr(_ecg_data_sample+0)
ORI	R25, R25, lo_addr(_ecg_data_sample+0)
ADDIU	SP, SP, -4
SW	R0, 0(SP)
JAL	_calculate_ecg_channel+0
NOP	
ADDIU	SP, SP, 4
SW	R2, Offset(_channel4_voltage_offset+0)(GP)
;ecg2_click_example.c,124 :: 		ECG2_CS = 1;
LUI	R2, BitMask(RC2_bit+0)
ORI	R2, R2, BitMask(RC2_bit+0)
_SX	
;ecg2_click_example.c,125 :: 		Delay_us(10);
LUI	R24, 0
ORI	R24, R24, 266
L_setup_ecg11:
ADDIU	R24, R24, -1
BNE	R24, R0, L_setup_ecg11
NOP	
;ecg2_click_example.c,128 :: 		ecg2_hal_send_command(STOP_COMMAND); // send STOP command
ORI	R25, R0, 10
JAL	_ecg2_hal_send_command+0
NOP	
;ecg2_click_example.c,129 :: 		Delay_us(100);
LUI	R24, 0
ORI	R24, R24, 2666
L_setup_ecg13:
ADDIU	R24, R24, -1
BNE	R24, R0, L_setup_ecg13
NOP	
;ecg2_click_example.c,130 :: 		ecg2_hal_send_command(SDATAC_COMMAND); // SDATAC mode
ORI	R25, R0, 17
JAL	_ecg2_hal_send_command+0
NOP	
;ecg2_click_example.c,134 :: 		ecg2_configure_channel(1, false, 6, 0);
MOVZ	R28, R0, R0
ORI	R27, R0, 6
MOVZ	R26, R0, R0
ORI	R25, R0, 1
JAL	_ecg2_configure_channel+0
NOP	
;ecg2_click_example.c,136 :: 		ecg2_configure_channel(2, false, 6, 0);
MOVZ	R28, R0, R0
ORI	R27, R0, 6
MOVZ	R26, R0, R0
ORI	R25, R0, 2
JAL	_ecg2_configure_channel+0
NOP	
;ecg2_click_example.c,138 :: 		ecg2_configure_channel(3, false, 6, 0);
MOVZ	R28, R0, R0
ORI	R27, R0, 6
MOVZ	R26, R0, R0
ORI	R25, R0, 3
JAL	_ecg2_configure_channel+0
NOP	
;ecg2_click_example.c,141 :: 		ecg2_configure_channel(4, false, 6, 4);
ORI	R28, R0, 4
ORI	R27, R0, 6
MOVZ	R26, R0, R0
ORI	R25, R0, 4
JAL	_ecg2_configure_channel+0
NOP	
;ecg2_click_example.c,142 :: 		ecg2_hal_send_command(START_COMMAND); // send START command
ORI	R25, R0, 8
JAL	_ecg2_hal_send_command+0
NOP	
;ecg2_click_example.c,143 :: 		Delay_us(100);
LUI	R24, 0
ORI	R24, R24, 2666
L_setup_ecg15:
ADDIU	R24, R24, -1
BNE	R24, R0, L_setup_ecg15
NOP	
;ecg2_click_example.c,144 :: 		ecg2_hal_send_command(RDATAC_COMMAND); // enable read data in continuous mode
ORI	R25, R0, 16
JAL	_ecg2_hal_send_command+0
NOP	
;ecg2_click_example.c,145 :: 		ECG2_CS = 0; // chip select
LUI	R2, BitMask(RC2_bit+0)
ORI	R2, R2, BitMask(RC2_bit+0)
_SX	
;ecg2_click_example.c,146 :: 		Delay_us(1);
LUI	R24, 0
ORI	R24, R24, 26
L_setup_ecg17:
ADDIU	R24, R24, -1
BNE	R24, R0, L_setup_ecg17
NOP	
;ecg2_click_example.c,147 :: 		}
L_end_setup_ecg:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _setup_ecg
_main:
;ecg2_click_example.c,149 :: 		void main() {
ADDIU	SP, SP, -60
;ecg2_click_example.c,151 :: 		uint64_t i = 0;
;ecg2_click_example.c,155 :: 		double time_value = 0.0;
MOVZ	R30, R0, R0
SW	R30, 48(SP)
;ecg2_click_example.c,156 :: 		UART5_Init(57600);
ORI	R25, R0, 57600
JAL	_UART5_Init+0
NOP	
;ecg2_click_example.c,157 :: 		delay_ms(300);
LUI	R24, 122
ORI	R24, R24, 4607
L_main19:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main19
NOP	
NOP	
;ecg2_click_example.c,158 :: 		Uart_Write_Text("START\r\n");
LUI	R25, hi_addr(?lstr1_ecg2_click_example+0)
ORI	R25, R25, lo_addr(?lstr1_ecg2_click_example+0)
JAL	_UART_Write_Text+0
NOP	
;ecg2_click_example.c,160 :: 		AD1PCFG = 0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
;ecg2_click_example.c,162 :: 		ECG2_DRDY_DIR = 1;
LUI	R2, BitMask(TRISE8_bit+0)
ORI	R2, R2, BitMask(TRISE8_bit+0)
_SX	
;ecg2_click_example.c,164 :: 		ECG2_PWDN_DIR = 0;
LUI	R2, BitMask(TRISD0_bit+0)
ORI	R2, R2, BitMask(TRISD0_bit+0)
_SX	
;ecg2_click_example.c,165 :: 		ECG2_PWDN = 1; // ECG2 is powered up
LUI	R2, BitMask(RD0_bit+0)
ORI	R2, R2, BitMask(RD0_bit+0)
_SX	
;ecg2_click_example.c,167 :: 		ECG2_CS_DIR = 0;
LUI	R2, BitMask(TRISC2_bit+0)
ORI	R2, R2, BitMask(TRISC2_bit+0)
_SX	
;ecg2_click_example.c,168 :: 		ECG2_CS = 1; // deselect ECG2 click
LUI	R2, BitMask(RC2_bit+0)
ORI	R2, R2, BitMask(RC2_bit+0)
_SX	
;ecg2_click_example.c,170 :: 		ECG2_RESET_DIR = 0;
LUI	R2, BitMask(TRISC1_bit+0)
ORI	R2, R2, BitMask(TRISC1_bit+0)
_SX	
;ecg2_click_example.c,171 :: 		ECG2_RESET = 1; // pull RESET bit low for 18 CLK to RESET ECG device
LUI	R2, BitMask(RC1_bit+0)
ORI	R2, R2, BitMask(RC1_bit+0)
_SX	
;ecg2_click_example.c,174 :: 		SPI3_Init_Advanced ( _SPI_MASTER, _SPI_8_BIT, 1, _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_END, _SPI_CLK_IDLE_LOW, _SPI_ACTIVE_2_IDLE );
MOVZ	R28, R0, R0
ORI	R27, R0, 1
MOVZ	R26, R0, R0
ORI	R25, R0, 32
ADDIU	SP, SP, -8
SH	R0, 4(SP)
SH	R0, 2(SP)
ORI	R2, R0, 512
SH	R2, 0(SP)
JAL	_SPI3_Init_Advanced+0
NOP	
ADDIU	SP, SP, 8
;ecg2_click_example.c,175 :: 		delay_ms(300);
LUI	R24, 122
ORI	R24, R24, 4607
L_main21:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main21
NOP	
NOP	
;ecg2_click_example.c,177 :: 		ecg2_hal_init();
JAL	_ecg2_hal_init+0
NOP	
;ecg2_click_example.c,180 :: 		ECG2_RESET = 0;
LUI	R2, BitMask(RC1_bit+0)
ORI	R2, R2, BitMask(RC1_bit+0)
_SX	
;ecg2_click_example.c,181 :: 		Delay_us(100);
LUI	R24, 0
ORI	R24, R24, 2666
L_main23:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main23
NOP	
;ecg2_click_example.c,182 :: 		ECG2_RESET = 1;
LUI	R2, BitMask(RC1_bit+0)
ORI	R2, R2, BitMask(RC1_bit+0)
_SX	
;ecg2_click_example.c,184 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_main25:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main25
NOP	
;ecg2_click_example.c,187 :: 		while (SPI3STAT.B0 != 0) { SPI_Read(0); }
L_main27:
LBU	R2, Offset(SPI3STAT+0)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__main46
NOP	
J	L_main28
NOP	
L__main46:
MOVZ	R25, R0, R0
JAL	_SPI_Read+0
NOP	
J	L_main27
NOP	
L_main28:
;ecg2_click_example.c,190 :: 		ecg2_hal_send_command(SDATAC_COMMAND);
ORI	R25, R0, 17
JAL	_ecg2_hal_send_command+0
NOP	
;ecg2_click_example.c,191 :: 		setup_ecg();
JAL	_setup_ecg+0
NOP	
;ecg2_click_example.c,194 :: 		while (1)
L_main29:
;ecg2_click_example.c,197 :: 		while (ECG2_DRDY) {} // Wait for ADS1194 device to prepare output data. Data is ready every 8 milliseconds
L_main31:
_LX	
EXT	R2, R2, BitPos(RE8_bit+0), 1
BNE	R2, R0, L__main48
NOP	
J	L_main32
NOP	
L__main48:
J	L_main31
NOP	
L_main32:
;ecg2_click_example.c,198 :: 		Delay_us(5);
LUI	R24, 0
ORI	R24, R24, 132
L_main33:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main33
NOP	
NOP	
NOP	
;ecg2_click_example.c,199 :: 		for (i=0; i<num_bytes_sample; i++) { ecg_data_sample[i] = SPI_Read(0); } // read ADS1194 output data, one sample
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
MOVZ	R7, R0, R0
; i end address is: 24 (R6)
MOVZ	R4, R6, R0
MOVZ	R5, R7, R0
L_main35:
; i start address is: 16 (R4)
SLTIU	R2, R5, 0
BNE	R2, R0, L__main49
NOP	
XORI	R2, R5, 0
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main49
NOP	
SLTIU	R2, R4, 19
L__main49:
BNE	R2, R0, L__main50
NOP	
J	L_main36
NOP	
L__main50:
LUI	R2, hi_addr(_ecg_data_sample+0)
ORI	R2, R2, lo_addr(_ecg_data_sample+0)
ADDU	R2, R2, R4
SW	R2, 56(SP)
SW	R4, 0(SP)
SW	R5, 4(SP)
MOVZ	R25, R0, R0
JAL	_SPI_Read+0
NOP	
LW	R4, 0(SP)
LW	R5, 4(SP)
LW	R3, 56(SP)
SB	R2, 0(R3)
ADDIU	R2, R4, 1
SLTIU	R3, R2, 1
ADDU	R3, R3, R5
; i end address is: 16 (R4)
; i start address is: 24 (R6)
MOVZ	R6, R2, R0
MOVZ	R7, R3, R0
MOVZ	R4, R6, R0
MOVZ	R5, R7, R0
; i end address is: 24 (R6)
J	L_main35
NOP	
L_main36:
;ecg2_click_example.c,200 :: 		if (ecg_data_sample[5]  == 0 ) Uart_Write_Text("ERROR READING\r\n");
LBU	R2, Offset(_ecg_data_sample+5)(GP)
BEQ	R2, R0, L__main51
NOP	
J	L_main38
NOP	
L__main51:
LUI	R25, hi_addr(?lstr2_ecg2_click_example+0)
ORI	R25, R25, lo_addr(?lstr2_ecg2_click_example+0)
JAL	_UART_Write_Text+0
NOP	
L_main38:
;ecg2_click_example.c,202 :: 		time_value += 8.0;
LW	R6, 48(SP)
LUI	R4, 16640
ORI	R4, R4, 0
JAL	__Add_FP+0
NOP	
SW	R2, 48(SP)
;ecg2_click_example.c,205 :: 		channel1_voltage = calculate_ecg_channel( ecg_data_sample, 3, vref, channel_gain, channel1_voltage_offset );
LUI	R28, 16800
ORI	R28, R28, 0
LUI	R27, 17686
ORI	R27, R27, 0
ORI	R26, R0, 3
LUI	R25, hi_addr(_ecg_data_sample+0)
ORI	R25, R25, lo_addr(_ecg_data_sample+0)
LW	R2, Offset(_channel1_voltage_offset+0)(GP)
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_calculate_ecg_channel+0
NOP	
ADDIU	SP, SP, 4
SW	R2, Offset(_channel1_voltage+0)(GP)
;ecg2_click_example.c,206 :: 		channel2_voltage = calculate_ecg_channel( ecg_data_sample, 5, vref, channel_gain, channel2_voltage_offset );
LUI	R28, 16800
ORI	R28, R28, 0
LUI	R27, 17686
ORI	R27, R27, 0
ORI	R26, R0, 5
LUI	R25, hi_addr(_ecg_data_sample+0)
ORI	R25, R25, lo_addr(_ecg_data_sample+0)
LW	R2, Offset(_channel2_voltage_offset+0)(GP)
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_calculate_ecg_channel+0
NOP	
ADDIU	SP, SP, 4
SW	R2, Offset(_channel2_voltage+0)(GP)
;ecg2_click_example.c,207 :: 		sprintf(final_string,"%.2f", channel2_voltage);  // convert values to string and send to MikroPlot
ADDIU	R3, SP, 8
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_ecg2_click_example+0)
ORI	R2, R2, lo_addr(?lstr_3_ecg2_click_example+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ecg2_click_example.c,208 :: 		strcat(final_string, ",");
ADDIU	R2, SP, 8
LUI	R26, hi_addr(?lstr4_ecg2_click_example+0)
ORI	R26, R26, lo_addr(?lstr4_ecg2_click_example+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;ecg2_click_example.c,209 :: 		sprintf(time_string,"%.2f", time_value);
ADDIU	R3, SP, 28
LW	R2, 48(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_ecg2_click_example+0)
ORI	R2, R2, lo_addr(?lstr_5_ecg2_click_example+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ecg2_click_example.c,210 :: 		strcat(final_string, time_string);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 8
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;ecg2_click_example.c,211 :: 		Uart_Write_Text(final_string);
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART_Write_Text+0
NOP	
;ecg2_click_example.c,212 :: 		Uart_Write_Text("\r\n");
LUI	R25, hi_addr(?lstr6_ecg2_click_example+0)
ORI	R25, R25, lo_addr(?lstr6_ecg2_click_example+0)
JAL	_UART_Write_Text+0
NOP	
;ecg2_click_example.c,215 :: 		channel3_voltage = calculate_ecg_channel( ecg_data_sample, 7, vref, channel_gain, channel3_voltage_offset );
LUI	R28, 16800
ORI	R28, R28, 0
LUI	R27, 17686
ORI	R27, R27, 0
ORI	R26, R0, 7
LUI	R25, hi_addr(_ecg_data_sample+0)
ORI	R25, R25, lo_addr(_ecg_data_sample+0)
LW	R2, Offset(_channel3_voltage_offset+0)(GP)
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_calculate_ecg_channel+0
NOP	
ADDIU	SP, SP, 4
SW	R2, Offset(_channel3_voltage+0)(GP)
;ecg2_click_example.c,217 :: 		channel4_voltage = calculate_ecg_channel( ecg_data_sample, 9, vref, channel_gain, channel4_voltage_offset );
LUI	R28, 16800
ORI	R28, R28, 0
LUI	R27, 17686
ORI	R27, R27, 0
ORI	R26, R0, 9
LUI	R25, hi_addr(_ecg_data_sample+0)
ORI	R25, R25, lo_addr(_ecg_data_sample+0)
LW	R2, Offset(_channel4_voltage_offset+0)(GP)
ADDIU	SP, SP, -4
SW	R2, 0(SP)
JAL	_calculate_ecg_channel+0
NOP	
ADDIU	SP, SP, 4
SW	R2, Offset(_channel4_voltage+0)(GP)
;ecg2_click_example.c,219 :: 		}
J	L_main29
NOP	
;ecg2_click_example.c,220 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
