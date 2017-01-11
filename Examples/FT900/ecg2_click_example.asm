_calculate_ecg_channel:
;ecg2_click_example.c,44 :: 		double calculate_ecg_channel( unsigned char *buffer, unsigned short index, double refv, double gain, double offset_voltage )
; offset_voltage start address is: 16 (R4)
; gain start address is: 12 (R3)
; refv start address is: 8 (R2)
; index start address is: 4 (R1)
; buffer start address is: 0 (R0)
LINK	LR, #4
MOVE.L	R9, R2
BEXTU.L	R2, R1, #256
MOVE.L	R1, R3
MOVE.L	R16, R4
; offset_voltage end address is: 16 (R4)
; gain end address is: 12 (R3)
; refv end address is: 8 (R2)
; index end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; index start address is: 8 (R2)
; refv start address is: 36 (R9)
; gain start address is: 4 (R1)
; offset_voltage start address is: 64 (R16)
;ecg2_click_example.c,46 :: 		int adc_value = 0;
;ecg2_click_example.c,48 :: 		adc_value = buffer[index];
ADD.L	R5, R0, R2
LDI.B	R5, R5, #0
; adc_value start address is: 12 (R3)
BEXTU.L	R3, R5, #256
;ecg2_click_example.c,49 :: 		adc_value <<= 8;
BEXTS.L	R5, R3, #0
; adc_value end address is: 12 (R3)
ASHL.L	R6, R5, #8
BEXTS.L	R6, R6, #0
;ecg2_click_example.c,50 :: 		adc_value |= buffer[index + 1];
ADD.L	R5, R2, #1
BEXTS.L	R5, R5, #0
; index end address is: 8 (R2)
ADD.L	R5, R0, R5
; buffer end address is: 0 (R0)
LDI.B	R5, R5, #0
OR.L	R5, R6, R5
BEXTS.L	R5, R5, #0
;ecg2_click_example.c,51 :: 		return ( ((double)adc_value * (refV / (32768 - 1))) / gain ) - offset_voltage;
BEXTS.L	R4, R5, #0
CALL	__SignedIntegralToFLoat+0
MOVE.L	R5, R0
STI.L	SP, #0, R5
LDK.L	R6, #1191181824
LDL.L	R6, R6, #1191181824
MOVE.L	R4, R9
CALL	__Div_FP+0
; refv end address is: 36 (R9)
LDI.L	R4, SP, #0
MOVE.L	R6, R0
CALL	__Mul_FP+0
MOVE.L	R6, R1
MOVE.L	R4, R0
CALL	__Div_FP+0
; gain end address is: 4 (R1)
MOVE.L	R6, R16
MOVE.L	R4, R0
CALL	__Sub_FP+0
; offset_voltage end address is: 64 (R16)
;ecg2_click_example.c,52 :: 		}
L_end_calculate_ecg_channel:
UNLINK	LR
RETURN	
; end of _calculate_ecg_channel
_setup_ecg2:
;ecg2_click_example.c,55 :: 		void setup_ecg2()
LINK	LR, #8
;ecg2_click_example.c,58 :: 		ecg2_oscillator_clock_enable(true);
LDK.L	R0, #1
CALL	_ecg2_oscillator_clock_enable+0
;ecg2_click_example.c,59 :: 		ecg2_set_output_data_rate(SPS_125);
LDK.L	R0, #6
CALL	_ecg2_set_output_data_rate+0
;ecg2_click_example.c,61 :: 		ecg2_set_test_source(TEST_SOURCE_EXTERNAL);
LDK.L	R0, #0
CALL	_ecg2_set_test_source+0
;ecg2_click_example.c,63 :: 		ecg2_power_down_reference_buffer_enable(true);
LDK.L	R0, #1
CALL	_ecg2_power_down_reference_buffer_enable+0
;ecg2_click_example.c,64 :: 		ecg2_set_reference_voltage(vref_2_4V);
LDK.L	R0, #0
CALL	_ecg2_set_reference_voltage+0
;ecg2_click_example.c,65 :: 		ecg2_rld_measurement_enable(true);
LDK.L	R0, #1
CALL	_ecg2_rld_measurement_enable+0
;ecg2_click_example.c,66 :: 		ecg2_rldref_source_select(RLDEF_SIGNAL_INTERNAL);
LDK.L	R0, #1
CALL	_ecg2_rldref_source_select+0
;ecg2_click_example.c,67 :: 		ecg2_rld_buffer_enable(true);
LDK.L	R0, #1
CALL	_ecg2_rld_buffer_enable+0
;ecg2_click_example.c,69 :: 		ecg2_lead_off_comparator_threshold_set(POSITIVE_70);
LDK.L	R0, #7
CALL	_ecg2_lead_off_comparator_threshold_set+0
;ecg2_click_example.c,70 :: 		ecg2_vlead_off_enable(false);
LDK.L	R0, #0
CALL	_ecg2_vlead_off_enable+0
;ecg2_click_example.c,71 :: 		ecg2_ilead_off_magnitude_set(NA_4);
LDK.L	R0, #0
CALL	_ecg2_ilead_off_magnitude_set+0
;ecg2_click_example.c,72 :: 		ecg2_flead_off_frequency_set(3);
LDK.L	R0, #3
CALL	_ecg2_flead_off_frequency_set+0
;ecg2_click_example.c,75 :: 		ecg2_configure_channel(1, false, 0, 1);
LDK.L	R3, #1
LDK.L	R2, #0
LDK.L	R1, #0
LDK.L	R0, #1
CALL	_ecg2_configure_channel+0
;ecg2_click_example.c,78 :: 		ecg2_configure_channel(2, false, 0, 1);
LDK.L	R3, #1
LDK.L	R2, #0
LDK.L	R1, #0
LDK.L	R0, #2
CALL	_ecg2_configure_channel+0
;ecg2_click_example.c,81 :: 		ecg2_configure_channel(3, false, 0, 1);
LDK.L	R3, #1
LDK.L	R2, #0
LDK.L	R1, #0
LDK.L	R0, #3
CALL	_ecg2_configure_channel+0
;ecg2_click_example.c,83 :: 		ecg2_configure_channel(4, false, 0, 1);
LDK.L	R3, #1
LDK.L	R2, #0
LDK.L	R1, #0
LDK.L	R0, #4
CALL	_ecg2_configure_channel+0
;ecg2_click_example.c,85 :: 		ecg2_right_leg_positive_drive_set(2);
LDK.L	R0, #2
CALL	_ecg2_right_leg_positive_drive_set+0
;ecg2_click_example.c,87 :: 		ecg2_right_leg_negative_drive_set(2);
LDK.L	R0, #2
CALL	_ecg2_right_leg_negative_drive_set+0
;ecg2_click_example.c,89 :: 		ecg2_lead_off_positive_channel_select(5);
LDK.L	R0, #5
CALL	_ecg2_lead_off_positive_channel_select+0
;ecg2_click_example.c,91 :: 		ecg2_lead_off_negative_channel_select(2);
LDK.L	R0, #2
CALL	_ecg2_lead_off_negative_channel_select+0
;ecg2_click_example.c,93 :: 		ecg2_lead_off_current_direction_select(0);
LDK.L	R0, #0
CALL	_ecg2_lead_off_current_direction_select+0
;ecg2_click_example.c,95 :: 		ecg2_lead_off_comparator_enable(true);
LDK.L	R0, #1
CALL	_ecg2_lead_off_comparator_enable+0
;ecg2_click_example.c,97 :: 		ecg2_hal_send_command(START_COMMAND); // send START command
LDK.L	R0, #8
CALL	_ecg2_hal_send_command+0
;ecg2_click_example.c,98 :: 		Delay_us(100);
LPM.L	R28, #3331
NOP	
L_setup_ecg20:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_setup_ecg20
JMP	$+8
	#3331
NOP	
NOP	
;ecg2_click_example.c,99 :: 		ecg2_hal_send_command(RDATA_COMMAND); // enable read data once
LDK.L	R0, #18
CALL	_ecg2_hal_send_command+0
;ecg2_click_example.c,100 :: 		ECG2_CS = 0; // chip select
LDA.x	R0, #AlignedAddress(GPIO_PIN28_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN28_bit+0)=0
STI.x	GPIO_PIN28_bit+0, #AlignedAddress(R0)
;ecg2_click_example.c,101 :: 		Delay_us(1);
LPM.L	R28, #31
NOP	
L_setup_ecg22:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_setup_ecg22
JMP	$+8
	#31
NOP	
NOP	
;ecg2_click_example.c,103 :: 		while (ECG2_DRDY) {} // Wait for ADS1194 device to prepare output data.
L_setup_ecg24:
LDA.x	R0, #AlignedAddress(GPIO_PIN3_bit+0)
BEXTU.L	R0, R0, #BitPos(GPIO_PIN3_bit+0)
CMP.L	R0, #0
JMPC	R30, Z, #1, L_setup_ecg25
JMP	L_setup_ecg24
L_setup_ecg25:
;ecg2_click_example.c,104 :: 		Delay_us(5);
LPM.L	R28, #165
NOP	
L_setup_ecg26:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_setup_ecg26
JMP	$+8
	#165
;ecg2_click_example.c,105 :: 		for (tempctr = 0; tempctr < num_bytes_sample; tempctr++) { ecg_data_sample[tempctr] = SPIM_Read(0); } // read ADS1194 output data, one sample
; tempctr start address is: 8 (R2)
LDK.L	R2, #0
; tempctr end address is: 8 (R2)
L_setup_ecg28:
; tempctr start address is: 8 (R2)
CMP.S	R2, #19
JMPC	R30, GTE, #1, L_setup_ecg29
LDK.L	R0, #_ecg_data_sample+0
ADD.L	R0, R0, R2
STI.L	SP, #4, R0
STI.B	SP, #0, R2
LDK.L	R0, #0
CALL	_SPIM_Read+0
LDI.B	R2, SP, #0
LDI.L	R1, SP, #4
STI.B	R1, #0, R0
ADD.L	R2, R2, #1
BEXTU.L	R2, R2, #256
; tempctr end address is: 8 (R2)
JMP	L_setup_ecg28
L_setup_ecg29:
;ecg2_click_example.c,108 :: 		channel1_voltage_offset = calculate_ecg_channel( ecg_data_sample, 3, vref, channel_gain, 0 );
LDK.L	R4, #0
LDK.L	R3, #1101004800
LDL.L	R3, R3, #1101004800
LDK.L	R2, #1159069696
LDL.L	R2, R2, #1159069696
LDK.L	R1, #3
LDK.L	R0, #_ecg_data_sample+0
CALL	_calculate_ecg_channel+0
STA.L	_channel1_voltage_offset+0, R0
;ecg2_click_example.c,110 :: 		channel2_voltage_offset = calculate_ecg_channel( ecg_data_sample, 5, vref, channel_gain, 0 );
LDK.L	R4, #0
LDK.L	R3, #1101004800
LDL.L	R3, R3, #1101004800
LDK.L	R2, #1159069696
LDL.L	R2, R2, #1159069696
LDK.L	R1, #5
LDK.L	R0, #_ecg_data_sample+0
CALL	_calculate_ecg_channel+0
STA.L	_channel2_voltage_offset+0, R0
;ecg2_click_example.c,112 :: 		channel3_voltage_offset = calculate_ecg_channel( ecg_data_sample, 7, vref, channel_gain, 0 );
LDK.L	R4, #0
LDK.L	R3, #1101004800
LDL.L	R3, R3, #1101004800
LDK.L	R2, #1159069696
LDL.L	R2, R2, #1159069696
LDK.L	R1, #7
LDK.L	R0, #_ecg_data_sample+0
CALL	_calculate_ecg_channel+0
STA.L	_channel3_voltage_offset+0, R0
;ecg2_click_example.c,114 :: 		channel4_voltage_offset = calculate_ecg_channel( ecg_data_sample, 9, vref, channel_gain, 0 );
LDK.L	R4, #0
LDK.L	R3, #1101004800
LDL.L	R3, R3, #1101004800
LDK.L	R2, #1159069696
LDL.L	R2, R2, #1159069696
LDK.L	R1, #9
LDK.L	R0, #_ecg_data_sample+0
CALL	_calculate_ecg_channel+0
STA.L	_channel4_voltage_offset+0, R0
;ecg2_click_example.c,115 :: 		ECG2_CS = 1;
LDA.x	R0, #AlignedAddress(GPIO_PIN28_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN28_bit+0)=1
STI.x	GPIO_PIN28_bit+0, #AlignedAddress(R0)
;ecg2_click_example.c,116 :: 		Delay_us(10);
LPM.L	R28, #331
NOP	
L_setup_ecg211:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_setup_ecg211
JMP	$+8
	#331
NOP	
NOP	
;ecg2_click_example.c,119 :: 		ecg2_hal_send_command(STOP_COMMAND); // send STOP command
LDK.L	R0, #10
CALL	_ecg2_hal_send_command+0
;ecg2_click_example.c,120 :: 		Delay_us(100);
LPM.L	R28, #3331
NOP	
L_setup_ecg213:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_setup_ecg213
JMP	$+8
	#3331
NOP	
NOP	
;ecg2_click_example.c,121 :: 		ecg2_hal_send_command(SDATAC_COMMAND); // SDATAC mode
LDK.L	R0, #17
CALL	_ecg2_hal_send_command+0
;ecg2_click_example.c,126 :: 		ecg2_configure_channel(1, false, 6, 0);
LDK.L	R3, #0
LDK.L	R2, #6
LDK.L	R1, #0
LDK.L	R0, #1
CALL	_ecg2_configure_channel+0
;ecg2_click_example.c,129 :: 		ecg2_configure_channel(2, false, 6, 0);
LDK.L	R3, #0
LDK.L	R2, #6
LDK.L	R1, #0
LDK.L	R0, #2
CALL	_ecg2_configure_channel+0
;ecg2_click_example.c,132 :: 		ecg2_configure_channel(3, false, 6, 0);
LDK.L	R3, #0
LDK.L	R2, #6
LDK.L	R1, #0
LDK.L	R0, #3
CALL	_ecg2_configure_channel+0
;ecg2_click_example.c,135 :: 		ecg2_configure_channel(4, false, 6, 4);
LDK.L	R3, #4
LDK.L	R2, #6
LDK.L	R1, #0
LDK.L	R0, #4
CALL	_ecg2_configure_channel+0
;ecg2_click_example.c,136 :: 		ecg2_hal_send_command(START_COMMAND); // send START command
LDK.L	R0, #8
CALL	_ecg2_hal_send_command+0
;ecg2_click_example.c,137 :: 		Delay_us(100);
LPM.L	R28, #3331
NOP	
L_setup_ecg215:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_setup_ecg215
JMP	$+8
	#3331
NOP	
NOP	
;ecg2_click_example.c,138 :: 		ecg2_hal_send_command(RDATAC_COMMAND); // enable read data in continuous mode
LDK.L	R0, #16
CALL	_ecg2_hal_send_command+0
;ecg2_click_example.c,140 :: 		ECG2_CS = 0; // chip select
LDA.x	R0, #AlignedAddress(GPIO_PIN28_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN28_bit+0)=0
STI.x	GPIO_PIN28_bit+0, #AlignedAddress(R0)
;ecg2_click_example.c,141 :: 		Delay_us(1);
LPM.L	R28, #31
NOP	
L_setup_ecg217:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_setup_ecg217
JMP	$+8
	#31
NOP	
NOP	
;ecg2_click_example.c,143 :: 		}
L_end_setup_ecg2:
UNLINK	LR
RETURN	
; end of _setup_ecg2
_main:
;ecg2_click_example.c,145 :: 		void main()
LDK.L	SP, #43605
LINK	LR, #48
;ecg2_click_example.c,147 :: 		uint16_t i = 0;
;ecg2_click_example.c,148 :: 		double time_value = 0.0;
LDK.L	R0, #0
STI.L	SP, #36, R0
;ecg2_click_example.c,151 :: 		GPIO_Digital_Input( &GPIO_PORT_00_07, _GPIO_PINMASK_3 );  // pin DRDY is input
LDK.L	R1, #8
LDK.L	R0, #GPIO_PORT_00_07+0
CALL	_GPIO_Digital_Input+0
;ecg2_click_example.c,152 :: 		GPIO_Digital_Output(&GPIO_PORT_56_63, _GPIO_PINMASK_0 );  // pin PWDN is output
LDK.L	R1, #1
LDK.L	R0, #GPIO_PORT_56_63+0
CALL	_GPIO_Digital_Output+0
;ecg2_click_example.c,153 :: 		ECG2_PWDN = 1;                                            // ECG chip is powered up
LDA.x	R0, #AlignedAddress(GPIO_PIN56_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN56_bit+0)=1
STI.x	GPIO_PIN56_bit+0, #AlignedAddress(R0)
;ecg2_click_example.c,154 :: 		GPIO_Digital_Output( &GPIO_PORT_24_31, _GPIO_PINMASK_4 ); // pin CS is output
LDK.L	R1, #16
LDK.L	R0, #GPIO_PORT_24_31+0
CALL	_GPIO_Digital_Output+0
;ecg2_click_example.c,155 :: 		ECG2_CS = 1;                                              // deselect ECG2 click
LDA.x	R0, #AlignedAddress(GPIO_PIN28_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN28_bit+0)=1
STI.x	GPIO_PIN28_bit+0, #AlignedAddress(R0)
;ecg2_click_example.c,156 :: 		GPIO_Digital_Output( &GPIO_PORT_00_07, _GPIO_PINMASK_1 ); // pin RESET is output
LDK.L	R1, #2
LDK.L	R0, #GPIO_PORT_00_07+0
CALL	_GPIO_Digital_Output+0
;ecg2_click_example.c,157 :: 		ECG2_RESET = 1;                                           // pull RESET bit low for 18 CLK for RESET ECG device
LDA.x	R0, #AlignedAddress(GPIO_PIN1_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN1_bit+0)=1
STI.x	GPIO_PIN1_bit+0, #AlignedAddress(R0)
;ecg2_click_example.c,159 :: 		UART1_Init(57600);
LDK.L	R0, #57600
CALL	_UART1_Init+0
;ecg2_click_example.c,160 :: 		delay_ms(300);
LPM.L	R28, #9999998
NOP	
L_main19:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_main19
JMP	$+8
	#9999998
NOP	
;ecg2_click_example.c,161 :: 		Uart_Write_Text("Uart init\r\n");
LDK.L	R0, #?lstr1_ecg2_click_example+0
CALL	_UART_Write_Text+0
;ecg2_click_example.c,165 :: 		_SPI_CFG_FIFO_DISABLE, _SPI_SS_LINE_NONE );
LDK.L	R2, #0
LDK.L	R1, #101
;ecg2_click_example.c,163 :: 		SPIM1_Init_Advanced( _SPI_MASTER_CLK_RATIO_64, _SPI_CFG_PHASE_CAPTURE_RISING |
LDK.L	R0, #32
;ecg2_click_example.c,165 :: 		_SPI_CFG_FIFO_DISABLE, _SPI_SS_LINE_NONE );
CALL	_SPIM1_Init_Advanced+0
;ecg2_click_example.c,166 :: 		delay_ms(300);
LPM.L	R28, #9999998
NOP	
L_main21:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_main21
JMP	$+8
	#9999998
NOP	
;ecg2_click_example.c,168 :: 		ecg2_hal_init();
CALL	_ecg2_hal_init+0
;ecg2_click_example.c,171 :: 		ECG2_RESET = 0;
LDA.x	R0, #AlignedAddress(GPIO_PIN1_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN1_bit+0)=0
STI.x	GPIO_PIN1_bit+0, #AlignedAddress(R0)
;ecg2_click_example.c,172 :: 		Delay_us(100);
LPM.L	R28, #3331
NOP	
L_main23:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_main23
JMP	$+8
	#3331
NOP	
NOP	
;ecg2_click_example.c,173 :: 		ECG2_RESET = 1;
LDA.x	R0, #AlignedAddress(GPIO_PIN1_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN1_bit+0)=1
STI.x	GPIO_PIN1_bit+0, #AlignedAddress(R0)
;ecg2_click_example.c,175 :: 		Delay_ms(1000);
LPM.L	R28, #33333331
NOP	
L_main25:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_main25
JMP	$+8
	#33333331
NOP	
NOP	
;ecg2_click_example.c,178 :: 		ecg2_hal_send_Command(SDATAC_COMMAND);
LDK.L	R0, #17
CALL	_ecg2_hal_send_command+0
;ecg2_click_example.c,180 :: 		Delay_ms(1000);
LPM.L	R28, #33333331
NOP	
L_main27:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_main27
JMP	$+8
	#33333331
NOP	
NOP	
;ecg2_click_example.c,182 :: 		setup_ecg2();
CALL	_setup_ecg2+0
;ecg2_click_example.c,183 :: 		Uart_Write_Text("START\r\n");
LDK.L	R0, #?lstr2_ecg2_click_example+0
CALL	_UART_Write_Text+0
;ecg2_click_example.c,184 :: 		while (1)
L_main29:
;ecg2_click_example.c,187 :: 		while (ECG2_DRDY) {} // Wait for ADS1194 device to prepare output data. Data is ready every 8 milliseconds
L_main31:
LDA.x	R0, #AlignedAddress(GPIO_PIN3_bit+0)
BEXTU.L	R0, R0, #BitPos(GPIO_PIN3_bit+0)
CMP.L	R0, #0
JMPC	R30, Z, #1, L_main32
JMP	L_main31
L_main32:
;ecg2_click_example.c,188 :: 		Delay_us(5);
LPM.L	R28, #165
NOP	
L_main33:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_main33
JMP	$+8
	#165
;ecg2_click_example.c,189 :: 		for (i = 0; i < num_bytes_sample; i++)
; i start address is: 12 (R3)
LDK.L	R3, #0
; i end address is: 12 (R3)
BEXTU.L	R2, R3, #0
L_main35:
; i start address is: 8 (R2)
CMP.S	R2, #19
JMPC	R30, C, #0, L_main36
;ecg2_click_example.c,190 :: 		ecg_data_sample[i] = SPIM_Read(0); // read ADS1194 output data, one sample
LDK.L	R0, #_ecg_data_sample+0
ADD.L	R0, R0, R2
STI.L	SP, #44, R0
STI.S	SP, #0, R2
LDK.L	R0, #0
CALL	_SPIM_Read+0
LDI.S	R2, SP, #0
LDI.L	R1, SP, #44
STI.B	R1, #0, R0
;ecg2_click_example.c,189 :: 		for (i = 0; i < num_bytes_sample; i++)
ADD.L	R0, R2, #1
; i end address is: 8 (R2)
; i start address is: 12 (R3)
BEXTU.L	R3, R0, #0
;ecg2_click_example.c,190 :: 		ecg_data_sample[i] = SPIM_Read(0); // read ADS1194 output data, one sample
BEXTU.L	R2, R3, #0
; i end address is: 12 (R3)
JMP	L_main35
L_main36:
;ecg2_click_example.c,193 :: 		time_value += 8.0;                     // increment the time value
LDI.L	R4, SP, #36
LDK.L	R6, #1090519040
LDL.L	R6, R6, #1090519040
CALL	__Add_FP+0
STI.L	SP, #36, R0
;ecg2_click_example.c,196 :: 		channel1_voltage = calculate_ecg_channel( ecg_data_sample, 3, vref, channel_gain, channel1_voltage_offset );
LDA.L	R0, _channel1_voltage_offset+0
MOVE.L	R4, R0
LDK.L	R3, #1101004800
LDL.L	R3, R3, #1101004800
LDK.L	R2, #1159069696
LDL.L	R2, R2, #1159069696
LDK.L	R1, #3
LDK.L	R0, #_ecg_data_sample+0
CALL	_calculate_ecg_channel+0
STA.L	_channel1_voltage+0, R0
;ecg2_click_example.c,198 :: 		channel2_voltage = calculate_ecg_channel( ecg_data_sample, 5, vref, channel_gain, channel2_voltage_offset );
LDA.L	R0, _channel2_voltage_offset+0
MOVE.L	R4, R0
LDK.L	R3, #1101004800
LDL.L	R3, R3, #1101004800
LDK.L	R2, #1159069696
LDL.L	R2, R2, #1159069696
LDK.L	R1, #5
LDK.L	R0, #_ecg_data_sample+0
CALL	_calculate_ecg_channel+0
STA.L	_channel2_voltage+0, R0
;ecg2_click_example.c,199 :: 		sprintf(final_string, "%.2f", channel2_voltage);     // convert values to string and send to MikroPlot
MOVE.L	R2, R0
LDK.L	R1, #?lstr_3_ecg2_click_example+0
ADD.L	R0, SP, #14
PUSH.L	R2
PUSH.L	R1
PUSH.L	R0
CALL	_sprintf+0
ADD.L	SP, SP, #12
;ecg2_click_example.c,200 :: 		strcat(final_string, ",");
LDK.L	R1, #?lstr4_ecg2_click_example+0
ADD.L	R0, SP, #14
CALL	_strcat+0
;ecg2_click_example.c,201 :: 		sprintf(timer_read_string, "%.2f", time_value);
LDI.L	R2, SP, #36
LDK.L	R1, #?lstr_5_ecg2_click_example+0
ADD.L	R0, SP, #4
PUSH.L	R2
PUSH.L	R1
PUSH.L	R0
CALL	_sprintf+0
ADD.L	SP, SP, #12
;ecg2_click_example.c,202 :: 		strcat(final_string, timer_read_string);
ADD.L	R1, SP, #4
ADD.L	R0, SP, #14
CALL	_strcat+0
;ecg2_click_example.c,203 :: 		Uart_Write_Text(final_string);
ADD.L	R0, SP, #14
CALL	_UART_Write_Text+0
;ecg2_click_example.c,204 :: 		Uart_Write_Text("\r\n");
LDK.L	R0, #?lstr6_ecg2_click_example+0
CALL	_UART_Write_Text+0
;ecg2_click_example.c,207 :: 		channel3_voltage = calculate_ecg_channel( ecg_data_sample, 7, vref, channel_gain, channel3_voltage_offset );
LDA.L	R0, _channel3_voltage_offset+0
MOVE.L	R4, R0
LDK.L	R3, #1101004800
LDL.L	R3, R3, #1101004800
LDK.L	R2, #1159069696
LDL.L	R2, R2, #1159069696
LDK.L	R1, #7
LDK.L	R0, #_ecg_data_sample+0
CALL	_calculate_ecg_channel+0
STA.L	_channel3_voltage+0, R0
;ecg2_click_example.c,209 :: 		channel4_voltage = calculate_ecg_channel( ecg_data_sample, 9, vref, channel_gain, channel4_voltage_offset );
LDA.L	R0, _channel4_voltage_offset+0
MOVE.L	R4, R0
LDK.L	R3, #1101004800
LDL.L	R3, R3, #1101004800
LDK.L	R2, #1159069696
LDL.L	R2, R2, #1159069696
LDK.L	R1, #9
LDK.L	R0, #_ecg_data_sample+0
CALL	_calculate_ecg_channel+0
STA.L	_channel4_voltage+0, R0
;ecg2_click_example.c,210 :: 		}
JMP	L_main29
;ecg2_click_example.c,211 :: 		}
L_end_main:
L__main_end_loop:
JMP	L__main_end_loop
; end of _main
