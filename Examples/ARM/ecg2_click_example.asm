_calculate_ecg_channel:
;ecg2_click_example.c,44 :: 		double calculate_ecg_channel( unsigned char *buffer, unsigned short index, double refv, double gain, double offset_voltage )
; gain start address is: 12 (R3)
; refv start address is: 8 (R2)
; index start address is: 4 (R1)
; buffer start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R8, R3
MOV	R3, R2
; gain end address is: 12 (R3)
; refv end address is: 8 (R2)
; index end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; index start address is: 4 (R1)
; refv start address is: 12 (R3)
; gain start address is: 32 (R8)
; offset_voltage start address is: 36 (R9)
LDR	R9, [SP, #8]
;ecg2_click_example.c,46 :: 		int adc_value = 0;
;ecg2_click_example.c,48 :: 		adc_value = buffer[index];
ADDS	R4, R0, R1
LDRB	R4, [R4, #0]
; adc_value start address is: 8 (R2)
UXTB	R2, R4
;ecg2_click_example.c,49 :: 		adc_value <<= 8;
LSLS	R5, R2, #8
SXTH	R5, R5
; adc_value end address is: 8 (R2)
;ecg2_click_example.c,50 :: 		adc_value |= buffer[index + 1];
ADDS	R4, R1, #1
SXTH	R4, R4
; index end address is: 4 (R1)
ADDS	R4, R0, R4
; buffer end address is: 0 (R0)
LDRB	R4, [R4, #0]
ORR	R4, R5, R4, LSL #0
SXTH	R4, R4
;ecg2_click_example.c,51 :: 		return ( ((double)adc_value * (refV / (32768 - 1))) / gain ) - offset_voltage;
SXTH	R0, R4
BL	__SignedIntegralToFloat+0
MOV	R4, R0
STR	R4, [SP, #4]
MOVW	R2, #65024
MOVT	R2, #18175
MOV	R0, R3
BL	__Div_FP+0
; refv end address is: 12 (R3)
LDR	R2, [SP, #4]
BL	__Mul_FP+0
MOV	R2, R8
BL	__Div_FP+0
; gain end address is: 32 (R8)
MOV	R2, R9
BL	__Sub_FP+0
; offset_voltage end address is: 36 (R9)
;ecg2_click_example.c,52 :: 		}
L_end_calculate_ecg_channel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _calculate_ecg_channel
_setup_ecg2:
;ecg2_click_example.c,54 :: 		void setup_ecg2()
SUB	SP, SP, #12
STR	LR, [SP, #0]
;ecg2_click_example.c,57 :: 		ecg2_oscillator_clock_enable(true);
MOVS	R0, #1
BL	_ecg2_oscillator_clock_enable+0
;ecg2_click_example.c,58 :: 		ecg2_set_output_data_rate(SPS_125);
MOVS	R0, #6
BL	_ecg2_set_output_data_rate+0
;ecg2_click_example.c,60 :: 		ecg2_set_test_source(TEST_SOURCE_EXTERNAL);
MOVS	R0, #0
BL	_ecg2_set_test_source+0
;ecg2_click_example.c,62 :: 		ecg2_power_down_reference_buffer_enable(true);
MOVS	R0, #1
BL	_ecg2_power_down_reference_buffer_enable+0
;ecg2_click_example.c,63 :: 		ecg2_set_reference_voltage(vref_2_4V);
MOVS	R0, #0
BL	_ecg2_set_reference_voltage+0
;ecg2_click_example.c,64 :: 		ecg2_rld_measurement_enable(true);
MOVS	R0, #1
BL	_ecg2_rld_measurement_enable+0
;ecg2_click_example.c,65 :: 		ecg2_rldref_source_select(RLDEF_SIGNAL_INTERNAL);
MOVS	R0, #1
BL	_ecg2_rldref_source_select+0
;ecg2_click_example.c,66 :: 		ecg2_rld_buffer_enable(true);
MOVS	R0, #1
BL	_ecg2_rld_buffer_enable+0
;ecg2_click_example.c,68 :: 		ecg2_lead_off_comparator_threshold_set(POSITIVE_70);
MOVS	R0, #7
BL	_ecg2_lead_off_comparator_threshold_set+0
;ecg2_click_example.c,69 :: 		ecg2_vlead_off_enable(false);
MOVS	R0, #0
BL	_ecg2_vlead_off_enable+0
;ecg2_click_example.c,70 :: 		ecg2_ilead_off_magnitude_set(NA_4);
MOVS	R0, #0
BL	_ecg2_ilead_off_magnitude_set+0
;ecg2_click_example.c,71 :: 		ecg2_flead_off_frequency_set(3);
MOVS	R0, #3
BL	_ecg2_flead_off_frequency_set+0
;ecg2_click_example.c,74 :: 		ecg2_configure_channel(1, false, 0, 1);
MOVS	R3, #1
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #1
BL	_ecg2_configure_channel+0
;ecg2_click_example.c,77 :: 		ecg2_configure_channel(2, false, 0, 1);
MOVS	R3, #1
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #2
BL	_ecg2_configure_channel+0
;ecg2_click_example.c,80 :: 		ecg2_configure_channel(3, false, 0, 1);
MOVS	R3, #1
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #3
BL	_ecg2_configure_channel+0
;ecg2_click_example.c,82 :: 		ecg2_configure_channel(4, false, 0, 1);
MOVS	R3, #1
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #4
BL	_ecg2_configure_channel+0
;ecg2_click_example.c,84 :: 		ecg2_right_leg_positive_drive_set(2);
MOVS	R0, #2
BL	_ecg2_right_leg_positive_drive_set+0
;ecg2_click_example.c,86 :: 		ecg2_right_leg_negative_drive_set(2);
MOVS	R0, #2
BL	_ecg2_right_leg_negative_drive_set+0
;ecg2_click_example.c,88 :: 		ecg2_lead_off_positive_channel_select(5);
MOVS	R0, #5
BL	_ecg2_lead_off_positive_channel_select+0
;ecg2_click_example.c,90 :: 		ecg2_lead_off_negative_channel_select(2);
MOVS	R0, #2
BL	_ecg2_lead_off_negative_channel_select+0
;ecg2_click_example.c,92 :: 		ecg2_lead_off_current_direction_select(0);
MOVS	R0, #0
BL	_ecg2_lead_off_current_direction_select+0
;ecg2_click_example.c,94 :: 		ecg2_lead_off_comparator_enable(true);
MOVS	R0, #1
BL	_ecg2_lead_off_comparator_enable+0
;ecg2_click_example.c,96 :: 		ecg2_hal_send_command(START_COMMAND); // send START command
MOVS	R0, #8
BL	_ecg2_hal_send_command+0
;ecg2_click_example.c,97 :: 		Delay_us(100);
MOVW	R7, #2399
MOVT	R7, #0
NOP
NOP
L_setup_ecg20:
SUBS	R7, R7, #1
BNE	L_setup_ecg20
NOP
NOP
;ecg2_click_example.c,98 :: 		ecg2_hal_send_command(RDATA_COMMAND); // enable read data once
MOVS	R0, #18
BL	_ecg2_hal_send_command+0
;ecg2_click_example.c,99 :: 		ECG2_CS = 0; // chip select
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIO_PORTG_DATA0_bit+0)
MOVT	R0, #hi_addr(GPIO_PORTG_DATA0_bit+0)
STR	R1, [R0, #0]
;ecg2_click_example.c,100 :: 		Delay_us(1);
MOVW	R7, #23
MOVT	R7, #0
NOP
NOP
L_setup_ecg22:
SUBS	R7, R7, #1
BNE	L_setup_ecg22
NOP
NOP
;ecg2_click_example.c,102 :: 		while (ECG2_DRDY) {} // Wait for ADS1194 device to prepare output data.
L_setup_ecg24:
MOVW	R1, #lo_addr(GPIO_PORTH_DATA0_bit+0)
MOVT	R1, #hi_addr(GPIO_PORTH_DATA0_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_setup_ecg25
IT	AL
BAL	L_setup_ecg24
L_setup_ecg25:
;ecg2_click_example.c,103 :: 		Delay_us(5);
MOVW	R7, #118
MOVT	R7, #0
NOP
NOP
L_setup_ecg26:
SUBS	R7, R7, #1
BNE	L_setup_ecg26
NOP
NOP
NOP
NOP
;ecg2_click_example.c,104 :: 		for (tempctr = 0; tempctr < num_bytes_sample; tempctr++) { ecg_data_sample[tempctr] = SPI_Read(0); } // read ADS1194 output data, one sample
; tempctr start address is: 8 (R2)
MOVS	R2, #0
; tempctr end address is: 8 (R2)
L_setup_ecg28:
; tempctr start address is: 8 (R2)
CMP	R2, #19
IT	GE
BGE	L_setup_ecg29
MOVW	R0, #lo_addr(_ecg_data_sample+0)
MOVT	R0, #hi_addr(_ecg_data_sample+0)
ADDS	R0, R0, R2
STR	R0, [SP, #8]
STRB	R2, [SP, #4]
MOVS	R0, #0
BL	_SPI_Read+0
LDRB	R2, [SP, #4]
LDR	R1, [SP, #8]
STRB	R0, [R1, #0]
ADDS	R2, R2, #1
UXTB	R2, R2
; tempctr end address is: 8 (R2)
IT	AL
BAL	L_setup_ecg28
L_setup_ecg29:
;ecg2_click_example.c,107 :: 		channel1_voltage_offset = calculate_ecg_channel( ecg_data_sample, 3, vref, channel_gain, 0 );
MOV	R0, #0
PUSH	(R0)
MOVW	R3, #0
MOVT	R3, #16800
MOVW	R2, #0
MOVT	R2, #17686
MOVS	R1, #3
MOVW	R0, #lo_addr(_ecg_data_sample+0)
MOVT	R0, #hi_addr(_ecg_data_sample+0)
BL	_calculate_ecg_channel+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_channel1_voltage_offset+0)
MOVT	R1, #hi_addr(_channel1_voltage_offset+0)
STR	R0, [R1, #0]
;ecg2_click_example.c,109 :: 		channel2_voltage_offset = calculate_ecg_channel( ecg_data_sample, 5, vref, channel_gain, 0 );
MOV	R0, #0
PUSH	(R0)
MOVW	R3, #0
MOVT	R3, #16800
MOVW	R2, #0
MOVT	R2, #17686
MOVS	R1, #5
MOVW	R0, #lo_addr(_ecg_data_sample+0)
MOVT	R0, #hi_addr(_ecg_data_sample+0)
BL	_calculate_ecg_channel+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_channel2_voltage_offset+0)
MOVT	R1, #hi_addr(_channel2_voltage_offset+0)
STR	R0, [R1, #0]
;ecg2_click_example.c,111 :: 		channel3_voltage_offset = calculate_ecg_channel( ecg_data_sample, 7, vref, channel_gain, 0 );
MOV	R0, #0
PUSH	(R0)
MOVW	R3, #0
MOVT	R3, #16800
MOVW	R2, #0
MOVT	R2, #17686
MOVS	R1, #7
MOVW	R0, #lo_addr(_ecg_data_sample+0)
MOVT	R0, #hi_addr(_ecg_data_sample+0)
BL	_calculate_ecg_channel+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_channel3_voltage_offset+0)
MOVT	R1, #hi_addr(_channel3_voltage_offset+0)
STR	R0, [R1, #0]
;ecg2_click_example.c,113 :: 		channel4_voltage_offset = calculate_ecg_channel( ecg_data_sample, 9, vref, channel_gain, 0 );
MOV	R0, #0
PUSH	(R0)
MOVW	R3, #0
MOVT	R3, #16800
MOVW	R2, #0
MOVT	R2, #17686
MOVS	R1, #9
MOVW	R0, #lo_addr(_ecg_data_sample+0)
MOVT	R0, #hi_addr(_ecg_data_sample+0)
BL	_calculate_ecg_channel+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_channel4_voltage_offset+0)
MOVT	R1, #hi_addr(_channel4_voltage_offset+0)
STR	R0, [R1, #0]
;ecg2_click_example.c,114 :: 		ECG2_CS = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIO_PORTG_DATA0_bit+0)
MOVT	R0, #hi_addr(GPIO_PORTG_DATA0_bit+0)
STR	R1, [R0, #0]
;ecg2_click_example.c,115 :: 		Delay_us(10);
MOVW	R7, #239
MOVT	R7, #0
NOP
NOP
L_setup_ecg211:
SUBS	R7, R7, #1
BNE	L_setup_ecg211
NOP
NOP
;ecg2_click_example.c,118 :: 		ecg2_hal_send_command(STOP_COMMAND); // send STOP command
MOVS	R0, #10
BL	_ecg2_hal_send_command+0
;ecg2_click_example.c,119 :: 		Delay_us(100);
MOVW	R7, #2399
MOVT	R7, #0
NOP
NOP
L_setup_ecg213:
SUBS	R7, R7, #1
BNE	L_setup_ecg213
NOP
NOP
;ecg2_click_example.c,120 :: 		ecg2_hal_send_command(SDATAC_COMMAND); // SDATAC mode
MOVS	R0, #17
BL	_ecg2_hal_send_command+0
;ecg2_click_example.c,125 :: 		ecg2_configure_channel(1, false, 6, 0);
MOVS	R3, #0
MOVS	R2, #6
MOVS	R1, #0
MOVS	R0, #1
BL	_ecg2_configure_channel+0
;ecg2_click_example.c,128 :: 		ecg2_configure_channel(2, false, 6, 0);
MOVS	R3, #0
MOVS	R2, #6
MOVS	R1, #0
MOVS	R0, #2
BL	_ecg2_configure_channel+0
;ecg2_click_example.c,131 :: 		ecg2_configure_channel(3, false, 6, 0);
MOVS	R3, #0
MOVS	R2, #6
MOVS	R1, #0
MOVS	R0, #3
BL	_ecg2_configure_channel+0
;ecg2_click_example.c,134 :: 		ecg2_configure_channel(4, false, 6, 4);
MOVS	R3, #4
MOVS	R2, #6
MOVS	R1, #0
MOVS	R0, #4
BL	_ecg2_configure_channel+0
;ecg2_click_example.c,135 :: 		ecg2_hal_send_command(START_COMMAND); // send START command
MOVS	R0, #8
BL	_ecg2_hal_send_command+0
;ecg2_click_example.c,136 :: 		Delay_us(100);
MOVW	R7, #2399
MOVT	R7, #0
NOP
NOP
L_setup_ecg215:
SUBS	R7, R7, #1
BNE	L_setup_ecg215
NOP
NOP
;ecg2_click_example.c,137 :: 		ecg2_hal_send_command(RDATAC_COMMAND); // enable read data in continuous mode
MOVS	R0, #16
BL	_ecg2_hal_send_command+0
;ecg2_click_example.c,139 :: 		ECG2_CS = 0; // chip select
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIO_PORTG_DATA0_bit+0)
MOVT	R0, #hi_addr(GPIO_PORTG_DATA0_bit+0)
STR	R1, [R0, #0]
;ecg2_click_example.c,140 :: 		Delay_us(1);
MOVW	R7, #23
MOVT	R7, #0
NOP
NOP
L_setup_ecg217:
SUBS	R7, R7, #1
BNE	L_setup_ecg217
NOP
NOP
;ecg2_click_example.c,141 :: 		}
L_end_setup_ecg2:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _setup_ecg2
_main:
;ecg2_click_example.c,143 :: 		void main() {
SUB	SP, SP, #56
;ecg2_click_example.c,145 :: 		uint16_t i = 0;
;ecg2_click_example.c,148 :: 		double time_value = 0.0;
MOV	R0, #0
STR	R0, [SP, #44]
;ecg2_click_example.c,149 :: 		UART0_Init(57600);
MOVW	R0, #57600
BL	_UART0_Init+0
;ecg2_click_example.c,150 :: 		delay_ms(300);
MOVW	R7, #56575
MOVT	R7, #109
NOP
NOP
L_main19:
SUBS	R7, R7, #1
BNE	L_main19
NOP
NOP
NOP
;ecg2_click_example.c,152 :: 		GPIO_Digital_Input(&GPIO_PORTH, _GPIO_PINMASK_0);  // pin DRDY is input
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIO_PORTH+0)
MOVT	R0, #hi_addr(GPIO_PORTH+0)
BL	_GPIO_Digital_Input+0
;ecg2_click_example.c,153 :: 		GPIO_Digital_Output(&GPIO_PORTC, _GPIO_PINMASK_4); // pin PWDN is output
MOVS	R1, #16
MOVW	R0, #lo_addr(GPIO_PORTC+0)
MOVT	R0, #hi_addr(GPIO_PORTC+0)
BL	_GPIO_Digital_Output+0
;ecg2_click_example.c,154 :: 		ECG2_PWDN = 1;                                     // ECG2 is powered up
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIO_PORTC_DATA4_bit+0)
MOVT	R0, #hi_addr(GPIO_PORTC_DATA4_bit+0)
STR	R1, [R0, #0]
;ecg2_click_example.c,155 :: 		GPIO_Digital_Output(&GPIO_PORTG, _GPIO_PINMASK_0); // pin CS is output
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIO_PORTG+0)
MOVT	R0, #hi_addr(GPIO_PORTG+0)
BL	_GPIO_Digital_Output+0
;ecg2_click_example.c,156 :: 		ECG2_CS = 1;                                       // deselect ECG2 click
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIO_PORTG_DATA0_bit+0)
MOVT	R0, #hi_addr(GPIO_PORTG_DATA0_bit+0)
STR	R1, [R0, #0]
;ecg2_click_example.c,157 :: 		GPIO_Digital_Output(&GPIO_PORTE, _GPIO_PINMASK_2); // pin RESET is output
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIO_PORTE+0)
MOVT	R0, #hi_addr(GPIO_PORTE+0)
BL	_GPIO_Digital_Output+0
;ecg2_click_example.c,158 :: 		ECG2_RESET = 1;                                    // pull RESET bit low for 18 CLK to RESET ECG device
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIO_PORTE_DATA2_bit+0)
MOVT	R0, #hi_addr(GPIO_PORTE_DATA2_bit+0)
STR	R1, [R0, #0]
;ecg2_click_example.c,161 :: 		SPI0_Init_Advanced(500000, _SPI_MASTER, _SPI_8_BIT | _SPI_CLK_IDLE_LOW | _SPI_SECOND_CLK_EDGE_TRANSITION, &_GPIO_MODULE_SPI0_A245);
MOVW	R3, #lo_addr(__GPIO_MODULE_SPI0_A245+0)
MOVT	R3, #hi_addr(__GPIO_MODULE_SPI0_A245+0)
MOVS	R2, #135
MOVW	R1, #0
MOVW	R0, #41248
MOVT	R0, #7
BL	_SPI0_Init_Advanced+0
;ecg2_click_example.c,162 :: 		ecg2_hal_init();
BL	_ecg2_hal_init+0
;ecg2_click_example.c,166 :: 		ECG2_RESET = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIO_PORTE_DATA2_bit+0)
MOVT	R0, #hi_addr(GPIO_PORTE_DATA2_bit+0)
STR	R1, [R0, #0]
;ecg2_click_example.c,167 :: 		Delay_us(100);
MOVW	R7, #2399
MOVT	R7, #0
NOP
NOP
L_main21:
SUBS	R7, R7, #1
BNE	L_main21
NOP
NOP
;ecg2_click_example.c,168 :: 		ECG2_RESET = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIO_PORTE_DATA2_bit+0)
MOVT	R0, #hi_addr(GPIO_PORTE_DATA2_bit+0)
STR	R1, [R0, #0]
;ecg2_click_example.c,170 :: 		Delay_ms(1000);
MOVW	R7, #13823
MOVT	R7, #366
NOP
NOP
L_main23:
SUBS	R7, R7, #1
BNE	L_main23
NOP
NOP
;ecg2_click_example.c,173 :: 		ecg2_hal_send_command(SDATAC_COMMAND);
MOVS	R0, #17
BL	_ecg2_hal_send_command+0
;ecg2_click_example.c,174 :: 		delay_ms(1000);
MOVW	R7, #13823
MOVT	R7, #366
NOP
NOP
L_main25:
SUBS	R7, R7, #1
BNE	L_main25
NOP
NOP
;ecg2_click_example.c,175 :: 		setup_ecg2();
BL	_setup_ecg2+0
;ecg2_click_example.c,177 :: 		while (1)
L_main27:
;ecg2_click_example.c,179 :: 		while (ECG2_DRDY) {} // Wait for ADS1194 device to prepare output data. Data is ready every 8 milliseconds
L_main29:
MOVW	R1, #lo_addr(GPIO_PORTH_DATA0_bit+0)
MOVT	R1, #hi_addr(GPIO_PORTH_DATA0_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main30
IT	AL
BAL	L_main29
L_main30:
;ecg2_click_example.c,180 :: 		Delay_us(5);
MOVW	R7, #118
MOVT	R7, #0
NOP
NOP
L_main31:
SUBS	R7, R7, #1
BNE	L_main31
NOP
NOP
NOP
NOP
;ecg2_click_example.c,181 :: 		for (i = 0; i < num_bytes_sample; i++)
; i start address is: 12 (R3)
MOVS	R3, #0
; i end address is: 12 (R3)
UXTH	R2, R3
L_main33:
; i start address is: 8 (R2)
CMP	R2, #19
IT	CS
BCS	L_main34
;ecg2_click_example.c,182 :: 		ecg_data_sample[i] = SPI_Read(0);   // read ADS1194 output data, one sample
MOVW	R0, #lo_addr(_ecg_data_sample+0)
MOVT	R0, #hi_addr(_ecg_data_sample+0)
ADDS	R0, R0, R2
STR	R0, [SP, #52]
STRH	R2, [SP, #0]
MOVS	R0, #0
BL	_SPI_Read+0
LDRH	R2, [SP, #0]
LDR	R1, [SP, #52]
STRB	R0, [R1, #0]
;ecg2_click_example.c,181 :: 		for (i = 0; i < num_bytes_sample; i++)
ADDS	R0, R2, #1
; i end address is: 8 (R2)
; i start address is: 12 (R3)
UXTH	R3, R0
;ecg2_click_example.c,182 :: 		ecg_data_sample[i] = SPI_Read(0);   // read ADS1194 output data, one sample
UXTH	R2, R3
; i end address is: 12 (R3)
IT	AL
BAL	L_main33
L_main34:
;ecg2_click_example.c,184 :: 		time_value += 8.0;     // increment time value
LDR	R0, [SP, #44]
MOV	R2, #1090519040
BL	__Add_FP+0
STR	R0, [SP, #44]
;ecg2_click_example.c,187 :: 		channel1_voltage = calculate_ecg_channel( ecg_data_sample, 3, Vref, channel_gain, channel1_voltage_offset );
MOVW	R0, #lo_addr(_channel1_voltage_offset+0)
MOVT	R0, #hi_addr(_channel1_voltage_offset+0)
LDR	R0, [R0, #0]
PUSH	(R0)
MOVW	R3, #0
MOVT	R3, #16800
MOVW	R2, #0
MOVT	R2, #17686
MOVS	R1, #3
MOVW	R0, #lo_addr(_ecg_data_sample+0)
MOVT	R0, #hi_addr(_ecg_data_sample+0)
BL	_calculate_ecg_channel+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_channel1_voltage+0)
MOVT	R1, #hi_addr(_channel1_voltage+0)
STR	R0, [R1, #0]
;ecg2_click_example.c,189 :: 		channel2_voltage = calculate_ecg_channel( ecg_data_sample, 5, Vref, channel_gain, channel2_voltage_offset );
MOVW	R0, #lo_addr(_channel2_voltage_offset+0)
MOVT	R0, #hi_addr(_channel2_voltage_offset+0)
LDR	R0, [R0, #0]
PUSH	(R0)
MOVW	R3, #0
MOVT	R3, #16800
MOVW	R2, #0
MOVT	R2, #17686
MOVS	R1, #5
MOVW	R0, #lo_addr(_ecg_data_sample+0)
MOVT	R0, #hi_addr(_ecg_data_sample+0)
BL	_calculate_ecg_channel+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_channel2_voltage+0)
MOVT	R1, #hi_addr(_channel2_voltage+0)
STR	R0, [R1, #0]
;ecg2_click_example.c,190 :: 		sprintf(final_string, "%.2f", channel2_voltage); // convert values to string and send to MikroPlot
MOV	R2, R0
MOVW	R1, #lo_addr(?lstr_1_ecg2_click_example+0)
MOVT	R1, #hi_addr(?lstr_1_ecg2_click_example+0)
ADD	R0, SP, #4
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
BL	_sprintf+0
ADD	SP, SP, #12
;ecg2_click_example.c,191 :: 		strcat(final_string, ",");
MOVW	R1, #lo_addr(?lstr2_ecg2_click_example+0)
MOVT	R1, #hi_addr(?lstr2_ecg2_click_example+0)
ADD	R0, SP, #4
BL	_strcat+0
;ecg2_click_example.c,192 :: 		sprintf(time_string, "%.2f", time_value);
LDR	R2, [SP, #44]
MOVW	R1, #lo_addr(?lstr_3_ecg2_click_example+0)
MOVT	R1, #hi_addr(?lstr_3_ecg2_click_example+0)
ADD	R0, SP, #24
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
BL	_sprintf+0
ADD	SP, SP, #12
;ecg2_click_example.c,193 :: 		strcat(final_string, time_string);
ADD	R1, SP, #24
ADD	R0, SP, #4
BL	_strcat+0
;ecg2_click_example.c,194 :: 		Uart_Write_Text(final_string);
ADD	R0, SP, #4
BL	_UART_Write_Text+0
;ecg2_click_example.c,195 :: 		Uart_Write_Text("\r\n");
MOVW	R0, #lo_addr(?lstr4_ecg2_click_example+0)
MOVT	R0, #hi_addr(?lstr4_ecg2_click_example+0)
BL	_UART_Write_Text+0
;ecg2_click_example.c,198 :: 		channel3_voltage = calculate_ecg_channel( ecg_data_sample, 7, vref, channel_gain, channel3_voltage_offset );
MOVW	R0, #lo_addr(_channel3_voltage_offset+0)
MOVT	R0, #hi_addr(_channel3_voltage_offset+0)
LDR	R0, [R0, #0]
PUSH	(R0)
MOVW	R3, #0
MOVT	R3, #16800
MOVW	R2, #0
MOVT	R2, #17686
MOVS	R1, #7
MOVW	R0, #lo_addr(_ecg_data_sample+0)
MOVT	R0, #hi_addr(_ecg_data_sample+0)
BL	_calculate_ecg_channel+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_channel3_voltage+0)
MOVT	R1, #hi_addr(_channel3_voltage+0)
STR	R0, [R1, #0]
;ecg2_click_example.c,200 :: 		channel4_voltage = calculate_ecg_channel( ecg_data_sample, 9, vref, channel_gain, channel4_voltage_offset );
MOVW	R0, #lo_addr(_channel4_voltage_offset+0)
MOVT	R0, #hi_addr(_channel4_voltage_offset+0)
LDR	R0, [R0, #0]
PUSH	(R0)
MOVW	R3, #0
MOVT	R3, #16800
MOVW	R2, #0
MOVT	R2, #17686
MOVS	R1, #9
MOVW	R0, #lo_addr(_ecg_data_sample+0)
MOVT	R0, #hi_addr(_ecg_data_sample+0)
BL	_calculate_ecg_channel+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_channel4_voltage+0)
MOVT	R1, #hi_addr(_channel4_voltage+0)
STR	R0, [R1, #0]
;ecg2_click_example.c,201 :: 		}
IT	AL
BAL	L_main27
;ecg2_click_example.c,202 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
