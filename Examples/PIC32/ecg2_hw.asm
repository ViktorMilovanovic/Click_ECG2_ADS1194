_register_bit_set:
;ecg2_hw.c,5 :: 		void register_bit_set(uint8_t reg, uint8_t bit_num, uint8_t val)
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,9 :: 		ecg2_hal_read_bytes(reg, &tempbuff, 1);
SW	R26, 4(SP)
SW	R27, 8(SP)
ADDIU	R2, SP, 15
SB	R27, 12(SP)
SB	R26, 13(SP)
SB	R25, 14(SP)
ORI	R27, R0, 1
MOVZ	R26, R2, R0
JAL	_ecg2_hal_read_bytes+0
NOP	
LBU	R25, 14(SP)
LBU	R26, 13(SP)
LBU	R27, 12(SP)
;ecg2_hw.c,10 :: 		if (val == 1)
ANDI	R3, R27, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__register_bit_set86
NOP	
J	L_register_bit_set0
NOP	
L__register_bit_set86:
;ecg2_hw.c,11 :: 		tempbuff |= 1 << bit_num;
ANDI	R3, R26, 255
ORI	R2, R0, 1
SLLV	R3, R2, R3
LBU	R2, 15(SP)
OR	R2, R2, R3
SB	R2, 15(SP)
J	L_register_bit_set1
NOP	
L_register_bit_set0:
;ecg2_hw.c,12 :: 		else if (val == 0)
ANDI	R2, R27, 255
BEQ	R2, R0, L__register_bit_set87
NOP	
J	L_register_bit_set2
NOP	
L__register_bit_set87:
;ecg2_hw.c,13 :: 		tempbuff &= ~(1 << bit_num);
ANDI	R3, R26, 255
ORI	R2, R0, 1
SLLV	R2, R2, R3
NOR	R3, R2, R0
LBU	R2, 15(SP)
AND	R2, R2, R3
SB	R2, 15(SP)
L_register_bit_set2:
L_register_bit_set1:
;ecg2_hw.c,14 :: 		ecg2_hal_write_bytes(reg, &tempbuff, 1);
ADDIU	R2, SP, 15
ORI	R27, R0, 1
MOVZ	R26, R2, R0
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,15 :: 		}
L_end_register_bit_set:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _register_bit_set
_ecg2_get_device_id:
;ecg2_hw.c,17 :: 		uint8_t ecg2_get_device_id()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,20 :: 		ecg2_hal_read_bytes(ID_REG, &tempbuff, 1);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
MOVZ	R25, R0, R0
JAL	_ecg2_hal_read_bytes+0
NOP	
;ecg2_hw.c,21 :: 		return tempbuff;
LBU	R2, 16(SP)
;ecg2_hw.c,22 :: 		}
;ecg2_hw.c,21 :: 		return tempbuff;
;ecg2_hw.c,22 :: 		}
L_end_ecg2_get_device_id:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_get_device_id
_ecg2_daisy_chain_enable:
;ecg2_hw.c,24 :: 		void ecg2_daisy_chain_enable(bool enable)
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,26 :: 		if (enable)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
BNE	R25, R0, L__ecg2_daisy_chain_enable91
NOP	
J	L_ecg2_daisy_chain_enable3
NOP	
L__ecg2_daisy_chain_enable91:
;ecg2_hw.c,27 :: 		register_bit_set(CONFIG1_REG, 6, 0);
MOVZ	R27, R0, R0
ORI	R26, R0, 6
ORI	R25, R0, 1
JAL	_register_bit_set+0
NOP	
J	L_ecg2_daisy_chain_enable4
NOP	
L_ecg2_daisy_chain_enable3:
;ecg2_hw.c,29 :: 		register_bit_set(CONFIG1_REG, 6, 1);
ORI	R27, R0, 1
ORI	R26, R0, 6
ORI	R25, R0, 1
JAL	_register_bit_set+0
NOP	
L_ecg2_daisy_chain_enable4:
;ecg2_hw.c,30 :: 		}
L_end_ecg2_daisy_chain_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_daisy_chain_enable
_ecg2_oscillator_clock_enable:
;ecg2_hw.c,32 :: 		void ecg2_oscillator_clock_enable ( bool enable )
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,35 :: 		if (enable)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
BNE	R25, R0, L__ecg2_oscillator_clock_enable94
NOP	
J	L_ecg2_oscillator_clock_enable5
NOP	
L__ecg2_oscillator_clock_enable94:
;ecg2_hw.c,36 :: 		register_bit_set(CONFIG1_REG, 5, 0);
MOVZ	R27, R0, R0
ORI	R26, R0, 5
ORI	R25, R0, 1
JAL	_register_bit_set+0
NOP	
J	L_ecg2_oscillator_clock_enable6
NOP	
L_ecg2_oscillator_clock_enable5:
;ecg2_hw.c,38 :: 		register_bit_set(CONFIG1_REG, 5, 1);
ORI	R27, R0, 1
ORI	R26, R0, 5
ORI	R25, R0, 1
JAL	_register_bit_set+0
NOP	
L_ecg2_oscillator_clock_enable6:
;ecg2_hw.c,39 :: 		}
L_end_ecg2_oscillator_clock_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_oscillator_clock_enable
_ecg2_set_output_data_rate:
;ecg2_hw.c,42 :: 		int8_t ecg2_set_output_data_rate(output_data_rate_t output_data_rate)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,44 :: 		uint8_t tempbuff = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
;ecg2_hw.c,45 :: 		if (output_data_rate > 7)
ANDI	R2, R25, 255
SLTIU	R2, R2, 8
BEQ	R2, R0, L__ecg2_set_output_data_rate96
NOP	
J	L_ecg2_set_output_data_rate7
NOP	
L__ecg2_set_output_data_rate96:
;ecg2_hw.c,46 :: 		return  -1;
ORI	R2, R0, 255
J	L_end_ecg2_set_output_data_rate
NOP	
L_ecg2_set_output_data_rate7:
;ecg2_hw.c,48 :: 		ecg2_hal_read_bytes(CONFIG1_REG, &tempbuff, 1);
ADDIU	R2, SP, 17
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 1
JAL	_ecg2_hal_read_bytes+0
NOP	
LBU	R25, 16(SP)
;ecg2_hw.c,49 :: 		tempbuff &= ~(7);
LBU	R3, 17(SP)
ORI	R2, R0, 248
AND	R2, R3, R2
SB	R2, 17(SP)
;ecg2_hw.c,51 :: 		tempbuff |= output_data_rate;
OR	R2, R2, R25
SB	R2, 17(SP)
;ecg2_hw.c,52 :: 		ecg2_hal_write_bytes(CONFIG1_REG, &tempbuff, 1);
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 1
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,53 :: 		return 0;
MOVZ	R2, R0, R0
;ecg2_hw.c,54 :: 		}
;ecg2_hw.c,53 :: 		return 0;
;ecg2_hw.c,54 :: 		}
L_end_ecg2_set_output_data_rate:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_set_output_data_rate
_ecg2_set_test_source:
;ecg2_hw.c,56 :: 		int8_t ecg2_set_test_source(test_source_t test_source)
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,58 :: 		if ( test_source > 1)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ANDI	R2, R25, 255
SLTIU	R2, R2, 2
BEQ	R2, R0, L__ecg2_set_test_source98
NOP	
J	L_ecg2_set_test_source8
NOP	
L__ecg2_set_test_source98:
;ecg2_hw.c,59 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_set_test_source
NOP	
L_ecg2_set_test_source8:
;ecg2_hw.c,62 :: 		register_bit_set(CONFIG2_REG, 4, test_source);
ANDI	R27, R25, 255
ORI	R26, R0, 4
ORI	R25, R0, 2
JAL	_register_bit_set+0
NOP	
;ecg2_hw.c,64 :: 		return 0;
MOVZ	R2, R0, R0
;ecg2_hw.c,65 :: 		}
;ecg2_hw.c,64 :: 		return 0;
;ecg2_hw.c,65 :: 		}
L_end_ecg2_set_test_source:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_set_test_source
_ecg2_set_test_amplitude:
;ecg2_hw.c,67 :: 		int8_t ecg2_set_test_amplitude (test_amplitude_t amplitutde)
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,69 :: 		if (amplitutde > 1)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ANDI	R2, R25, 255
SLTIU	R2, R2, 2
BEQ	R2, R0, L__ecg2_set_test_amplitude100
NOP	
J	L_ecg2_set_test_amplitude10
NOP	
L__ecg2_set_test_amplitude100:
;ecg2_hw.c,70 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_set_test_amplitude
NOP	
L_ecg2_set_test_amplitude10:
;ecg2_hw.c,72 :: 		register_bit_set(CONFIG2_REG, 2, 1);
ORI	R27, R0, 1
ORI	R26, R0, 2
ORI	R25, R0, 2
JAL	_register_bit_set+0
NOP	
;ecg2_hw.c,74 :: 		return 0;
MOVZ	R2, R0, R0
;ecg2_hw.c,75 :: 		}
;ecg2_hw.c,74 :: 		return 0;
;ecg2_hw.c,75 :: 		}
L_end_ecg2_set_test_amplitude:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_set_test_amplitude
_ecg2_set_test_frequency:
;ecg2_hw.c,78 :: 		int8_t ecg2_set_test_frequency (test_frequency_t frequency)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,80 :: 		uint8_t tempbuff = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
;ecg2_hw.c,81 :: 		if (frequency > 3)
ANDI	R2, R25, 255
SLTIU	R2, R2, 4
BEQ	R2, R0, L__ecg2_set_test_frequency102
NOP	
J	L_ecg2_set_test_frequency12
NOP	
L__ecg2_set_test_frequency102:
;ecg2_hw.c,82 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_set_test_frequency
NOP	
L_ecg2_set_test_frequency12:
;ecg2_hw.c,84 :: 		ecg2_hal_read_bytes(CONFIG2_REG, &tempbuff, 1);
ADDIU	R2, SP, 17
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 2
JAL	_ecg2_hal_read_bytes+0
NOP	
LBU	R25, 16(SP)
;ecg2_hw.c,86 :: 		tempbuff &= ~(3);
LBU	R3, 17(SP)
ORI	R2, R0, 252
AND	R2, R3, R2
SB	R2, 17(SP)
;ecg2_hw.c,87 :: 		tempbuff |= frequency;
OR	R2, R2, R25
SB	R2, 17(SP)
;ecg2_hw.c,88 :: 		ecg2_hal_write_bytes(CONFIG2_REG, &tempbuff, 1);
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 2
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,89 :: 		return 0;
MOVZ	R2, R0, R0
;ecg2_hw.c,90 :: 		}
;ecg2_hw.c,89 :: 		return 0;
;ecg2_hw.c,90 :: 		}
L_end_ecg2_set_test_frequency:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_set_test_frequency
_ecg2_power_down_reference_buffer_enable:
;ecg2_hw.c,92 :: 		void ecg2_power_down_reference_buffer_enable(bool enable)
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,94 :: 		if (enable)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
BNE	R25, R0, L__ecg2_power_down_reference_buffer_enable105
NOP	
J	L_ecg2_power_down_reference_buffer_enable13
NOP	
L__ecg2_power_down_reference_buffer_enable105:
;ecg2_hw.c,95 :: 		register_bit_set(CONFIG3_REG, 7, 1);
ORI	R27, R0, 1
ORI	R26, R0, 7
ORI	R25, R0, 3
JAL	_register_bit_set+0
NOP	
J	L_ecg2_power_down_reference_buffer_enable14
NOP	
L_ecg2_power_down_reference_buffer_enable13:
;ecg2_hw.c,97 :: 		register_bit_set(CONFIG3_REG, 7, 0);
MOVZ	R27, R0, R0
ORI	R26, R0, 7
ORI	R25, R0, 3
JAL	_register_bit_set+0
NOP	
L_ecg2_power_down_reference_buffer_enable14:
;ecg2_hw.c,98 :: 		}
L_end_ecg2_power_down_reference_buffer_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_power_down_reference_buffer_enable
_ecg2_set_reference_voltage:
;ecg2_hw.c,100 :: 		int8_t ecg2_set_reference_voltage(reference_voltage_t refvol)
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,102 :: 		if (refvol > 1)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ANDI	R2, R25, 255
SLTIU	R2, R2, 2
BEQ	R2, R0, L__ecg2_set_reference_voltage107
NOP	
J	L_ecg2_set_reference_voltage15
NOP	
L__ecg2_set_reference_voltage107:
;ecg2_hw.c,103 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_set_reference_voltage
NOP	
L_ecg2_set_reference_voltage15:
;ecg2_hw.c,106 :: 		register_bit_set(CONFIG3_REG, 5, refvol);
ANDI	R27, R25, 255
ORI	R26, R0, 5
ORI	R25, R0, 3
JAL	_register_bit_set+0
NOP	
;ecg2_hw.c,107 :: 		}
L_end_ecg2_set_reference_voltage:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_set_reference_voltage
_ecg2_rld_measurement_enable:
;ecg2_hw.c,109 :: 		void ecg2_rld_measurement_enable( bool enable )
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,111 :: 		if (enable)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
BNE	R25, R0, L__ecg2_rld_measurement_enable110
NOP	
J	L_ecg2_rld_measurement_enable17
NOP	
L__ecg2_rld_measurement_enable110:
;ecg2_hw.c,112 :: 		register_bit_set(CONFIG3_REG, 4, 0);
MOVZ	R27, R0, R0
ORI	R26, R0, 4
ORI	R25, R0, 3
JAL	_register_bit_set+0
NOP	
J	L_ecg2_rld_measurement_enable18
NOP	
L_ecg2_rld_measurement_enable17:
;ecg2_hw.c,114 :: 		register_bit_set(CONFIG3_REG, 4, 0);
MOVZ	R27, R0, R0
ORI	R26, R0, 4
ORI	R25, R0, 3
JAL	_register_bit_set+0
NOP	
L_ecg2_rld_measurement_enable18:
;ecg2_hw.c,115 :: 		}
L_end_ecg2_rld_measurement_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_rld_measurement_enable
_ecg2_rldref_source_select:
;ecg2_hw.c,117 :: 		int8_t ecg2_rldref_source_select(rldef_signal_t source)
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,119 :: 		if (source > 1)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ANDI	R2, R25, 255
SLTIU	R2, R2, 2
BEQ	R2, R0, L__ecg2_rldref_source_select112
NOP	
J	L_ecg2_rldref_source_select19
NOP	
L__ecg2_rldref_source_select112:
;ecg2_hw.c,120 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_rldref_source_select
NOP	
L_ecg2_rldref_source_select19:
;ecg2_hw.c,122 :: 		register_bit_set(CONFIG3_REG, 3, source);
ANDI	R27, R25, 255
ORI	R26, R0, 3
ORI	R25, R0, 3
JAL	_register_bit_set+0
NOP	
;ecg2_hw.c,123 :: 		}
L_end_ecg2_rldref_source_select:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_rldref_source_select
_ecg2_rld_buffer_enable:
;ecg2_hw.c,125 :: 		void ecg2_rld_buffer_enable (bool enable)
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,127 :: 		if (enable)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
BNE	R25, R0, L__ecg2_rld_buffer_enable115
NOP	
J	L_ecg2_rld_buffer_enable21
NOP	
L__ecg2_rld_buffer_enable115:
;ecg2_hw.c,128 :: 		register_bit_set(CONFIG3_REG, 2, 1);
ORI	R27, R0, 1
ORI	R26, R0, 2
ORI	R25, R0, 3
JAL	_register_bit_set+0
NOP	
J	L_ecg2_rld_buffer_enable22
NOP	
L_ecg2_rld_buffer_enable21:
;ecg2_hw.c,130 :: 		register_bit_set(CONFIG3_REG, 2, 0);
MOVZ	R27, R0, R0
ORI	R26, R0, 2
ORI	R25, R0, 3
JAL	_register_bit_set+0
NOP	
L_ecg2_rld_buffer_enable22:
;ecg2_hw.c,131 :: 		}
L_end_ecg2_rld_buffer_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_rld_buffer_enable
_ecg2_rld_sense_enable:
;ecg2_hw.c,133 :: 		int8_t ecg2_rld_sense_enable(bool enable)
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,135 :: 		if (enable)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
BNE	R25, R0, L__ecg2_rld_sense_enable118
NOP	
J	L_ecg2_rld_sense_enable23
NOP	
L__ecg2_rld_sense_enable118:
;ecg2_hw.c,136 :: 		register_bit_set(CONFIG3_REG, 1, 1);
ORI	R27, R0, 1
ORI	R26, R0, 1
ORI	R25, R0, 3
JAL	_register_bit_set+0
NOP	
J	L_ecg2_rld_sense_enable24
NOP	
L_ecg2_rld_sense_enable23:
;ecg2_hw.c,138 :: 		register_bit_set(CONFIG3_REG, 1, 0);
MOVZ	R27, R0, R0
ORI	R26, R0, 1
ORI	R25, R0, 3
JAL	_register_bit_set+0
NOP	
L_ecg2_rld_sense_enable24:
;ecg2_hw.c,139 :: 		}
L_end_ecg2_rld_sense_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_rld_sense_enable
_ecg2_rld_get_status:
;ecg2_hw.c,141 :: 		uint8_t ecg2_rld_get_status ()
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,143 :: 		uint8_t tempbuff = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
MOVZ	R30, R0, R0
SB	R30, 16(SP)
;ecg2_hw.c,144 :: 		ecg2_hal_read_bytes(CONFIG3_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 3
JAL	_ecg2_hal_read_bytes+0
NOP	
;ecg2_hw.c,145 :: 		return (tempbuff & 1);
LBU	R2, 16(SP)
ANDI	R2, R2, 1
;ecg2_hw.c,146 :: 		}
;ecg2_hw.c,145 :: 		return (tempbuff & 1);
;ecg2_hw.c,146 :: 		}
L_end_ecg2_rld_get_status:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_rld_get_status
_ecg2_lead_off_comparator_threshold_set:
;ecg2_hw.c,148 :: 		int8_t ecg2_lead_off_comparator_threshold_set(lead_off_threshold_t threshold)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,150 :: 		uint8_t tempbuf = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
;ecg2_hw.c,151 :: 		if (threshold > 7)
ANDI	R2, R25, 255
SLTIU	R2, R2, 8
BEQ	R2, R0, L__ecg2_lead_off_comparator_threshold_set121
NOP	
J	L_ecg2_lead_off_comparator_threshold_set25
NOP	
L__ecg2_lead_off_comparator_threshold_set121:
;ecg2_hw.c,152 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_lead_off_comparator_threshold_set
NOP	
L_ecg2_lead_off_comparator_threshold_set25:
;ecg2_hw.c,154 :: 		ecg2_hal_read_bytes(LOFF_REG, &tempbuf, 1);
ADDIU	R2, SP, 17
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 4
JAL	_ecg2_hal_read_bytes+0
NOP	
LBU	R25, 16(SP)
;ecg2_hw.c,155 :: 		tempbuf &= ~(7 << 5);
LBU	R2, 17(SP)
ANDI	R3, R2, 31
SB	R3, 17(SP)
;ecg2_hw.c,156 :: 		tempbuf |= threshold << 5;
ANDI	R2, R25, 255
SLL	R2, R2, 5
OR	R2, R3, R2
SB	R2, 17(SP)
;ecg2_hw.c,157 :: 		ecg2_hal_write_bytes(LOFF_REG, &tempbuf, 1);
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 4
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,158 :: 		return 0;
MOVZ	R2, R0, R0
;ecg2_hw.c,159 :: 		}
;ecg2_hw.c,158 :: 		return 0;
;ecg2_hw.c,159 :: 		}
L_end_ecg2_lead_off_comparator_threshold_set:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_lead_off_comparator_threshold_set
_ecg2_vlead_off_enable:
;ecg2_hw.c,161 :: 		void ecg2_vlead_off_enable(bool enable)
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,163 :: 		if (enable)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
BNE	R25, R0, L__ecg2_vlead_off_enable124
NOP	
J	L_ecg2_vlead_off_enable26
NOP	
L__ecg2_vlead_off_enable124:
;ecg2_hw.c,164 :: 		register_bit_set(LOFF_REG, 4, 0);
MOVZ	R27, R0, R0
ORI	R26, R0, 4
ORI	R25, R0, 4
JAL	_register_bit_set+0
NOP	
J	L_ecg2_vlead_off_enable27
NOP	
L_ecg2_vlead_off_enable26:
;ecg2_hw.c,166 :: 		register_bit_set(LOFF_REG, 4, 1);
ORI	R27, R0, 1
ORI	R26, R0, 4
ORI	R25, R0, 4
JAL	_register_bit_set+0
NOP	
L_ecg2_vlead_off_enable27:
;ecg2_hw.c,167 :: 		}
L_end_ecg2_vlead_off_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_vlead_off_enable
_ecg2_ilead_off_magnitude_set:
;ecg2_hw.c,169 :: 		int8_t ecg2_ilead_off_magnitude_set (ilead_off_magnitude_t set)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,171 :: 		uint8_t tempbuf = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
;ecg2_hw.c,172 :: 		if (set > 3)
ANDI	R2, R25, 255
SLTIU	R2, R2, 4
BEQ	R2, R0, L__ecg2_ilead_off_magnitude_set126
NOP	
J	L_ecg2_ilead_off_magnitude_set28
NOP	
L__ecg2_ilead_off_magnitude_set126:
;ecg2_hw.c,173 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_ilead_off_magnitude_set
NOP	
L_ecg2_ilead_off_magnitude_set28:
;ecg2_hw.c,175 :: 		ecg2_hal_read_bytes(LOFF_REG, &tempbuf, 1);
ADDIU	R2, SP, 17
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 4
JAL	_ecg2_hal_read_bytes+0
NOP	
LBU	R25, 16(SP)
;ecg2_hw.c,176 :: 		tempbuf &= ~(3 << 2);
LBU	R3, 17(SP)
ORI	R2, R0, 243
AND	R3, R3, R2
SB	R3, 17(SP)
;ecg2_hw.c,177 :: 		tempbuf |= set << 2;
ANDI	R2, R25, 255
SLL	R2, R2, 2
OR	R2, R3, R2
SB	R2, 17(SP)
;ecg2_hw.c,178 :: 		ecg2_hal_write_bytes(LOFF_REG, &tempbuf, 1);
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 4
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,179 :: 		}
L_end_ecg2_ilead_off_magnitude_set:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_ilead_off_magnitude_set
_ecg2_flead_off_frequency_set:
;ecg2_hw.c,181 :: 		int8_t ecg2_flead_off_frequency_set (uint8_t set)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,183 :: 		uint8_t tempbuf = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
;ecg2_hw.c,184 :: 		if (set > 3 )
ANDI	R2, R25, 255
SLTIU	R2, R2, 4
BEQ	R2, R0, L__ecg2_flead_off_frequency_set128
NOP	
J	L_ecg2_flead_off_frequency_set29
NOP	
L__ecg2_flead_off_frequency_set128:
;ecg2_hw.c,185 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_flead_off_frequency_set
NOP	
L_ecg2_flead_off_frequency_set29:
;ecg2_hw.c,186 :: 		ecg2_hal_read_bytes(LOFF_REG, &tempbuf, 1);
ADDIU	R2, SP, 17
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 4
JAL	_ecg2_hal_read_bytes+0
NOP	
LBU	R25, 16(SP)
;ecg2_hw.c,187 :: 		tempbuf &= ~ 3;
LBU	R3, 17(SP)
ORI	R2, R0, 252
AND	R2, R3, R2
SB	R2, 17(SP)
;ecg2_hw.c,188 :: 		tempbuf |= set;
OR	R2, R2, R25
SB	R2, 17(SP)
;ecg2_hw.c,189 :: 		ecg2_hal_write_bytes(LOFF_REG, &tempbuf, 1);
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 4
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,190 :: 		}
L_end_ecg2_flead_off_frequency_set:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_flead_off_frequency_set
_ecg2_configure_channel:
;ecg2_hw.c,192 :: 		int8_t ecg2_configure_channel (uint8_t channel, bool power_down, uint8_t pga_gain, uint8_t channel_input)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,194 :: 		uint8_t tempbuff = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
MOVZ	R30, R0, R0
SB	R30, 16(SP)
;ecg2_hw.c,196 :: 		switch (channel)
J	L_ecg2_configure_channel30
NOP	
;ecg2_hw.c,198 :: 		case 1:
L_ecg2_configure_channel32:
;ecg2_hw.c,199 :: 		if (pga_gain > 7)
ANDI	R2, R27, 255
SLTIU	R2, R2, 8
BEQ	R2, R0, L__ecg2_configure_channel130
NOP	
J	L_ecg2_configure_channel33
NOP	
L__ecg2_configure_channel130:
;ecg2_hw.c,200 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel33:
;ecg2_hw.c,202 :: 		if ( channel_input > 7 )
ANDI	R2, R28, 255
SLTIU	R2, R2, 8
BEQ	R2, R0, L__ecg2_configure_channel131
NOP	
J	L_ecg2_configure_channel34
NOP	
L__ecg2_configure_channel131:
;ecg2_hw.c,203 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel34:
;ecg2_hw.c,205 :: 		tempbuff |= pga_gain << 4;
ANDI	R2, R27, 255
SLL	R3, R2, 4
LBU	R2, 16(SP)
OR	R2, R2, R3
SB	R2, 16(SP)
;ecg2_hw.c,206 :: 		tempbuff |= channel_input;
OR	R2, R2, R28
SB	R2, 16(SP)
;ecg2_hw.c,207 :: 		if (power_down)
BNE	R26, R0, L__ecg2_configure_channel133
NOP	
J	L_ecg2_configure_channel35
NOP	
L__ecg2_configure_channel133:
;ecg2_hw.c,208 :: 		tempbuff |= 1 << 7;
LBU	R2, 16(SP)
ORI	R2, R2, 128
SB	R2, 16(SP)
J	L_ecg2_configure_channel36
NOP	
L_ecg2_configure_channel35:
;ecg2_hw.c,210 :: 		tempbuff &= ~(1 << 7);
LBU	R2, 16(SP)
ANDI	R2, R2, 127
SB	R2, 16(SP)
L_ecg2_configure_channel36:
;ecg2_hw.c,212 :: 		ecg2_hal_write_bytes(CH1SET_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 5
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,213 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_ecg2_configure_channel
NOP	
;ecg2_hw.c,215 :: 		case 2:
L_ecg2_configure_channel37:
;ecg2_hw.c,216 :: 		if (pga_gain > 15)
ANDI	R2, R27, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel134
NOP	
J	L_ecg2_configure_channel38
NOP	
L__ecg2_configure_channel134:
;ecg2_hw.c,217 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel38:
;ecg2_hw.c,219 :: 		if ( channel_input > 15 )
ANDI	R2, R28, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel135
NOP	
J	L_ecg2_configure_channel39
NOP	
L__ecg2_configure_channel135:
;ecg2_hw.c,220 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel39:
;ecg2_hw.c,222 :: 		if (power_down)
BNE	R26, R0, L__ecg2_configure_channel137
NOP	
J	L_ecg2_configure_channel40
NOP	
L__ecg2_configure_channel137:
;ecg2_hw.c,223 :: 		tempbuff |= 1 << 7;
LBU	R2, 16(SP)
ORI	R2, R2, 128
SB	R2, 16(SP)
J	L_ecg2_configure_channel41
NOP	
L_ecg2_configure_channel40:
;ecg2_hw.c,225 :: 		tempbuff &= ~(1 << 7);
LBU	R2, 16(SP)
ANDI	R2, R2, 127
SB	R2, 16(SP)
L_ecg2_configure_channel41:
;ecg2_hw.c,227 :: 		tempbuff |= pga_gain << 4;
ANDI	R2, R27, 255
SLL	R3, R2, 4
LBU	R2, 16(SP)
OR	R2, R2, R3
SB	R2, 16(SP)
;ecg2_hw.c,228 :: 		tempbuff |= channel_input;
OR	R2, R2, R28
SB	R2, 16(SP)
;ecg2_hw.c,229 :: 		ecg2_hal_write_bytes(CH2SET_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 6
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,230 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_ecg2_configure_channel
NOP	
;ecg2_hw.c,232 :: 		case 3:
L_ecg2_configure_channel42:
;ecg2_hw.c,233 :: 		if (pga_gain > 15)
ANDI	R2, R27, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel138
NOP	
J	L_ecg2_configure_channel43
NOP	
L__ecg2_configure_channel138:
;ecg2_hw.c,234 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel43:
;ecg2_hw.c,236 :: 		if ( channel_input > 15 )
ANDI	R2, R28, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel139
NOP	
J	L_ecg2_configure_channel44
NOP	
L__ecg2_configure_channel139:
;ecg2_hw.c,237 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel44:
;ecg2_hw.c,239 :: 		if (power_down)
BNE	R26, R0, L__ecg2_configure_channel141
NOP	
J	L_ecg2_configure_channel45
NOP	
L__ecg2_configure_channel141:
;ecg2_hw.c,240 :: 		tempbuff |= 1 << 7;
LBU	R2, 16(SP)
ORI	R2, R2, 128
SB	R2, 16(SP)
J	L_ecg2_configure_channel46
NOP	
L_ecg2_configure_channel45:
;ecg2_hw.c,242 :: 		tempbuff &= ~(1 << 7);
LBU	R2, 16(SP)
ANDI	R2, R2, 127
SB	R2, 16(SP)
L_ecg2_configure_channel46:
;ecg2_hw.c,244 :: 		tempbuff |= pga_gain << 4;
ANDI	R2, R27, 255
SLL	R3, R2, 4
LBU	R2, 16(SP)
OR	R2, R2, R3
SB	R2, 16(SP)
;ecg2_hw.c,245 :: 		tempbuff |= channel_input;
OR	R2, R2, R28
SB	R2, 16(SP)
;ecg2_hw.c,246 :: 		ecg2_hal_write_bytes(CH3SET_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 7
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,247 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_ecg2_configure_channel
NOP	
;ecg2_hw.c,249 :: 		case 4:
L_ecg2_configure_channel47:
;ecg2_hw.c,250 :: 		if (pga_gain > 15)
ANDI	R2, R27, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel142
NOP	
J	L_ecg2_configure_channel48
NOP	
L__ecg2_configure_channel142:
;ecg2_hw.c,251 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel48:
;ecg2_hw.c,253 :: 		if ( channel_input > 15 )
ANDI	R2, R28, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel143
NOP	
J	L_ecg2_configure_channel49
NOP	
L__ecg2_configure_channel143:
;ecg2_hw.c,254 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel49:
;ecg2_hw.c,256 :: 		if (power_down)
BNE	R26, R0, L__ecg2_configure_channel145
NOP	
J	L_ecg2_configure_channel50
NOP	
L__ecg2_configure_channel145:
;ecg2_hw.c,257 :: 		tempbuff |= 1 << 7;
LBU	R2, 16(SP)
ORI	R2, R2, 128
SB	R2, 16(SP)
J	L_ecg2_configure_channel51
NOP	
L_ecg2_configure_channel50:
;ecg2_hw.c,259 :: 		tempbuff &= ~(1 << 7);
LBU	R2, 16(SP)
ANDI	R2, R2, 127
SB	R2, 16(SP)
L_ecg2_configure_channel51:
;ecg2_hw.c,261 :: 		tempbuff |= pga_gain << 4;
ANDI	R2, R27, 255
SLL	R3, R2, 4
LBU	R2, 16(SP)
OR	R2, R2, R3
SB	R2, 16(SP)
;ecg2_hw.c,262 :: 		tempbuff |= channel_input;
OR	R2, R2, R28
SB	R2, 16(SP)
;ecg2_hw.c,263 :: 		ecg2_hal_write_bytes(CH4SET_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 8
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,264 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_ecg2_configure_channel
NOP	
;ecg2_hw.c,265 :: 		case 5:
L_ecg2_configure_channel52:
;ecg2_hw.c,266 :: 		if (pga_gain > 15)
ANDI	R2, R27, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel146
NOP	
J	L_ecg2_configure_channel53
NOP	
L__ecg2_configure_channel146:
;ecg2_hw.c,267 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel53:
;ecg2_hw.c,269 :: 		if ( channel_input > 15 )
ANDI	R2, R28, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel147
NOP	
J	L_ecg2_configure_channel54
NOP	
L__ecg2_configure_channel147:
;ecg2_hw.c,270 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel54:
;ecg2_hw.c,272 :: 		if (power_down)
BNE	R26, R0, L__ecg2_configure_channel149
NOP	
J	L_ecg2_configure_channel55
NOP	
L__ecg2_configure_channel149:
;ecg2_hw.c,273 :: 		tempbuff |= 1 << 7;
LBU	R2, 16(SP)
ORI	R2, R2, 128
SB	R2, 16(SP)
J	L_ecg2_configure_channel56
NOP	
L_ecg2_configure_channel55:
;ecg2_hw.c,275 :: 		tempbuff &= ~(1 << 7);
LBU	R2, 16(SP)
ANDI	R2, R2, 127
SB	R2, 16(SP)
L_ecg2_configure_channel56:
;ecg2_hw.c,277 :: 		tempbuff |= pga_gain << 4;
ANDI	R2, R27, 255
SLL	R3, R2, 4
LBU	R2, 16(SP)
OR	R2, R2, R3
SB	R2, 16(SP)
;ecg2_hw.c,278 :: 		tempbuff |= channel_input;
OR	R2, R2, R28
SB	R2, 16(SP)
;ecg2_hw.c,279 :: 		ecg2_hal_write_bytes(CH5SET_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 9
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,280 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_ecg2_configure_channel
NOP	
;ecg2_hw.c,282 :: 		case 6:
L_ecg2_configure_channel57:
;ecg2_hw.c,283 :: 		if (pga_gain > 15)
ANDI	R2, R27, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel150
NOP	
J	L_ecg2_configure_channel58
NOP	
L__ecg2_configure_channel150:
;ecg2_hw.c,284 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel58:
;ecg2_hw.c,286 :: 		if ( channel_input > 15 )
ANDI	R2, R28, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel151
NOP	
J	L_ecg2_configure_channel59
NOP	
L__ecg2_configure_channel151:
;ecg2_hw.c,287 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel59:
;ecg2_hw.c,289 :: 		if (power_down)
BNE	R26, R0, L__ecg2_configure_channel153
NOP	
J	L_ecg2_configure_channel60
NOP	
L__ecg2_configure_channel153:
;ecg2_hw.c,290 :: 		tempbuff |= 1 << 7;
LBU	R2, 16(SP)
ORI	R2, R2, 128
SB	R2, 16(SP)
J	L_ecg2_configure_channel61
NOP	
L_ecg2_configure_channel60:
;ecg2_hw.c,292 :: 		tempbuff &= ~(1 << 7);
LBU	R2, 16(SP)
ANDI	R2, R2, 127
SB	R2, 16(SP)
L_ecg2_configure_channel61:
;ecg2_hw.c,294 :: 		tempbuff |= pga_gain << 4;
ANDI	R2, R27, 255
SLL	R3, R2, 4
LBU	R2, 16(SP)
OR	R2, R2, R3
SB	R2, 16(SP)
;ecg2_hw.c,295 :: 		tempbuff |= channel_input;
OR	R2, R2, R28
SB	R2, 16(SP)
;ecg2_hw.c,296 :: 		ecg2_hal_write_bytes(CH6SET_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 10
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,297 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_ecg2_configure_channel
NOP	
;ecg2_hw.c,299 :: 		case 7:
L_ecg2_configure_channel62:
;ecg2_hw.c,300 :: 		if (pga_gain > 15)
ANDI	R2, R27, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel154
NOP	
J	L_ecg2_configure_channel63
NOP	
L__ecg2_configure_channel154:
;ecg2_hw.c,301 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel63:
;ecg2_hw.c,303 :: 		if ( channel_input > 15 )
ANDI	R2, R28, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel155
NOP	
J	L_ecg2_configure_channel64
NOP	
L__ecg2_configure_channel155:
;ecg2_hw.c,304 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel64:
;ecg2_hw.c,306 :: 		if (power_down)
BNE	R26, R0, L__ecg2_configure_channel157
NOP	
J	L_ecg2_configure_channel65
NOP	
L__ecg2_configure_channel157:
;ecg2_hw.c,307 :: 		tempbuff |= 1 << 7;
LBU	R2, 16(SP)
ORI	R2, R2, 128
SB	R2, 16(SP)
J	L_ecg2_configure_channel66
NOP	
L_ecg2_configure_channel65:
;ecg2_hw.c,309 :: 		tempbuff &= ~(1 << 7);
LBU	R2, 16(SP)
ANDI	R2, R2, 127
SB	R2, 16(SP)
L_ecg2_configure_channel66:
;ecg2_hw.c,311 :: 		tempbuff |= pga_gain << 4;
ANDI	R2, R27, 255
SLL	R3, R2, 4
LBU	R2, 16(SP)
OR	R2, R2, R3
SB	R2, 16(SP)
;ecg2_hw.c,312 :: 		tempbuff |= channel_input;
OR	R2, R2, R28
SB	R2, 16(SP)
;ecg2_hw.c,313 :: 		ecg2_hal_write_bytes(CH7SET_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 11
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,314 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_ecg2_configure_channel
NOP	
;ecg2_hw.c,316 :: 		case 8:
L_ecg2_configure_channel67:
;ecg2_hw.c,317 :: 		if (pga_gain > 15)
ANDI	R2, R27, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel158
NOP	
J	L_ecg2_configure_channel68
NOP	
L__ecg2_configure_channel158:
;ecg2_hw.c,318 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel68:
;ecg2_hw.c,320 :: 		if ( channel_input > 15 )
ANDI	R2, R28, 255
SLTIU	R2, R2, 16
BEQ	R2, R0, L__ecg2_configure_channel159
NOP	
J	L_ecg2_configure_channel69
NOP	
L__ecg2_configure_channel159:
;ecg2_hw.c,321 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
L_ecg2_configure_channel69:
;ecg2_hw.c,323 :: 		if (power_down)
BNE	R26, R0, L__ecg2_configure_channel161
NOP	
J	L_ecg2_configure_channel70
NOP	
L__ecg2_configure_channel161:
;ecg2_hw.c,324 :: 		tempbuff |= 1 << 7;
LBU	R2, 16(SP)
ORI	R2, R2, 128
SB	R2, 16(SP)
J	L_ecg2_configure_channel71
NOP	
L_ecg2_configure_channel70:
;ecg2_hw.c,326 :: 		tempbuff &= ~(1 << 7);
LBU	R2, 16(SP)
ANDI	R2, R2, 127
SB	R2, 16(SP)
L_ecg2_configure_channel71:
;ecg2_hw.c,328 :: 		tempbuff |= pga_gain << 4;
ANDI	R2, R27, 255
SLL	R3, R2, 4
LBU	R2, 16(SP)
OR	R2, R2, R3
SB	R2, 16(SP)
;ecg2_hw.c,329 :: 		tempbuff |= channel_input;
OR	R2, R2, R28
SB	R2, 16(SP)
;ecg2_hw.c,330 :: 		ecg2_hal_write_bytes(CH8SET_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 12
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,331 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_ecg2_configure_channel
NOP	
;ecg2_hw.c,333 :: 		default:
L_ecg2_configure_channel72:
;ecg2_hw.c,334 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_configure_channel
NOP	
;ecg2_hw.c,335 :: 		}
L_ecg2_configure_channel30:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__ecg2_configure_channel163
NOP	
J	L_ecg2_configure_channel32
NOP	
L__ecg2_configure_channel163:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__ecg2_configure_channel165
NOP	
J	L_ecg2_configure_channel37
NOP	
L__ecg2_configure_channel165:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__ecg2_configure_channel167
NOP	
J	L_ecg2_configure_channel42
NOP	
L__ecg2_configure_channel167:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__ecg2_configure_channel169
NOP	
J	L_ecg2_configure_channel47
NOP	
L__ecg2_configure_channel169:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__ecg2_configure_channel171
NOP	
J	L_ecg2_configure_channel52
NOP	
L__ecg2_configure_channel171:
ANDI	R3, R25, 255
ORI	R2, R0, 6
BNE	R3, R2, L__ecg2_configure_channel173
NOP	
J	L_ecg2_configure_channel57
NOP	
L__ecg2_configure_channel173:
ANDI	R3, R25, 255
ORI	R2, R0, 7
BNE	R3, R2, L__ecg2_configure_channel175
NOP	
J	L_ecg2_configure_channel62
NOP	
L__ecg2_configure_channel175:
ANDI	R3, R25, 255
ORI	R2, R0, 8
BNE	R3, R2, L__ecg2_configure_channel177
NOP	
J	L_ecg2_configure_channel67
NOP	
L__ecg2_configure_channel177:
J	L_ecg2_configure_channel72
NOP	
;ecg2_hw.c,336 :: 		}
L_end_ecg2_configure_channel:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_configure_channel
_ecg2_right_leg_positive_drive_set:
;ecg2_hw.c,338 :: 		void ecg2_right_leg_positive_drive_set(uint8_t set)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,340 :: 		uint8_t tempbuff = set;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R25, 16(SP)
;ecg2_hw.c,341 :: 		ecg2_hal_write_bytes(RLD_SENSP_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 13
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,342 :: 		}
L_end_ecg2_right_leg_positive_drive_set:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_right_leg_positive_drive_set
_ecg2_right_leg_negative_drive_set:
;ecg2_hw.c,344 :: 		void ecg2_right_leg_negative_drive_set(uint8_t set)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,346 :: 		uint8_t tempbuff = set;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R25, 16(SP)
;ecg2_hw.c,347 :: 		ecg2_hal_write_bytes(RLD_SENSN_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 14
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,348 :: 		}
L_end_ecg2_right_leg_negative_drive_set:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_right_leg_negative_drive_set
_ecg2_lead_off_positive_channel_select:
;ecg2_hw.c,350 :: 		void ecg2_lead_off_positive_channel_select (uint8_t set)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,352 :: 		uint8_t tempbuff = set;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R25, 16(SP)
;ecg2_hw.c,353 :: 		ecg2_hal_write_bytes(LOFF_SENSP_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 15
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,354 :: 		}
L_end_ecg2_lead_off_positive_channel_select:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_lead_off_positive_channel_select
_ecg2_lead_off_negative_channel_select:
;ecg2_hw.c,356 :: 		void ecg2_lead_off_negative_channel_select (uint8_t set)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,358 :: 		uint8_t tempbuff = set;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R25, 16(SP)
;ecg2_hw.c,359 :: 		ecg2_hal_write_bytes(LOFF_SENSN_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 16
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,360 :: 		}
L_end_ecg2_lead_off_negative_channel_select:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_lead_off_negative_channel_select
_ecg2_lead_off_current_direction_select:
;ecg2_hw.c,362 :: 		void ecg2_lead_off_current_direction_select (uint8_t set)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,364 :: 		uint8_t tempbuff = set;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R25, 16(SP)
;ecg2_hw.c,365 :: 		ecg2_hal_write_bytes(LOFF_FLIP_REG, &tempbuff, 1);
ADDIU	R2, SP, 16
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 17
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,366 :: 		}
L_end_ecg2_lead_off_current_direction_select:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_lead_off_current_direction_select
_ecg2_pace_detect_even_channels_select:
;ecg2_hw.c,368 :: 		int8_t ecg2_pace_detect_even_channels_select (pace_even_channels_t select)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,370 :: 		if (select > 3)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ANDI	R2, R25, 255
SLTIU	R2, R2, 4
BEQ	R2, R0, L__ecg2_pace_detect_even_channels_select184
NOP	
J	L_ecg2_pace_detect_even_channels_select73
NOP	
L__ecg2_pace_detect_even_channels_select184:
;ecg2_hw.c,371 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_pace_detect_even_channels_select
NOP	
L_ecg2_pace_detect_even_channels_select73:
;ecg2_hw.c,375 :: 		uint8_t tempbuff = select;
SB	R25, 17(SP)
;ecg2_hw.c,376 :: 		ecg2_hal_read_bytes(PACE_REG, &tempbuff, 1);
ADDIU	R2, SP, 17
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 21
JAL	_ecg2_hal_read_bytes+0
NOP	
LBU	R25, 16(SP)
;ecg2_hw.c,377 :: 		tempbuff &= ~(3 << 3);
LBU	R3, 17(SP)
ORI	R2, R0, 231
AND	R3, R3, R2
SB	R3, 17(SP)
;ecg2_hw.c,378 :: 		tempbuff |= select << 3;
ANDI	R2, R25, 255
SLL	R2, R2, 3
OR	R2, R3, R2
SB	R2, 17(SP)
;ecg2_hw.c,379 :: 		ecg2_hal_write_bytes(PACE_REG, &tempbuff, 1 );
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 21
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,380 :: 		return 0;
MOVZ	R2, R0, R0
;ecg2_hw.c,382 :: 		}
;ecg2_hw.c,380 :: 		return 0;
;ecg2_hw.c,382 :: 		}
L_end_ecg2_pace_detect_even_channels_select:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_pace_detect_even_channels_select
_ecg2_pace_detect_odd_channels_select:
;ecg2_hw.c,384 :: 		int8_t ecg2_pace_detect_odd_channels_select (pace_odd_channels_t select)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,386 :: 		if (select > 3)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ANDI	R2, R25, 255
SLTIU	R2, R2, 4
BEQ	R2, R0, L__ecg2_pace_detect_odd_channels_select186
NOP	
J	L_ecg2_pace_detect_odd_channels_select75
NOP	
L__ecg2_pace_detect_odd_channels_select186:
;ecg2_hw.c,387 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_pace_detect_odd_channels_select
NOP	
L_ecg2_pace_detect_odd_channels_select75:
;ecg2_hw.c,391 :: 		uint8_t tempbuff = select;
SB	R25, 17(SP)
;ecg2_hw.c,392 :: 		ecg2_hal_read_bytes(PACE_REG, &tempbuff, 1 );
ADDIU	R2, SP, 17
SB	R25, 16(SP)
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 21
JAL	_ecg2_hal_read_bytes+0
NOP	
LBU	R25, 16(SP)
;ecg2_hw.c,393 :: 		tempbuff &= ~(3 << 1);
LBU	R3, 17(SP)
ORI	R2, R0, 249
AND	R3, R3, R2
SB	R3, 17(SP)
;ecg2_hw.c,394 :: 		tempbuff |= select << 1;
ANDI	R2, R25, 255
SLL	R2, R2, 1
OR	R2, R3, R2
SB	R2, 17(SP)
;ecg2_hw.c,395 :: 		ecg2_hal_write_bytes(PACE_REG, &tempbuff, 1 );
ADDIU	R2, SP, 17
ORI	R27, R0, 1
MOVZ	R26, R2, R0
ORI	R25, R0, 21
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,396 :: 		return 0;
MOVZ	R2, R0, R0
;ecg2_hw.c,398 :: 		}
;ecg2_hw.c,396 :: 		return 0;
;ecg2_hw.c,398 :: 		}
L_end_ecg2_pace_detect_odd_channels_select:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_pace_detect_odd_channels_select
_ecg2_pace_detect_buffer_enable:
;ecg2_hw.c,400 :: 		int8_t ecg2_pace_detect_buffer_enable ( bool enable )
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,402 :: 		if (enable)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
BNE	R25, R0, L__ecg2_pace_detect_buffer_enable189
NOP	
J	L_ecg2_pace_detect_buffer_enable77
NOP	
L__ecg2_pace_detect_buffer_enable189:
;ecg2_hw.c,403 :: 		register_bit_set(PACE_REG, 0, 1);
ORI	R27, R0, 1
MOVZ	R26, R0, R0
ORI	R25, R0, 21
JAL	_register_bit_set+0
NOP	
J	L_ecg2_pace_detect_buffer_enable78
NOP	
L_ecg2_pace_detect_buffer_enable77:
;ecg2_hw.c,405 :: 		register_bit_set(PACE_REG, 0, 0);
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
ORI	R25, R0, 21
JAL	_register_bit_set+0
NOP	
L_ecg2_pace_detect_buffer_enable78:
;ecg2_hw.c,406 :: 		}
L_end_ecg2_pace_detect_buffer_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_pace_detect_buffer_enable
_ecg2_single_shot_conversion_enable:
;ecg2_hw.c,408 :: 		void ecg2_single_shot_conversion_enable ( bool enable )
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,410 :: 		if (enable)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
BNE	R25, R0, L__ecg2_single_shot_conversion_enable192
NOP	
J	L_ecg2_single_shot_conversion_enable79
NOP	
L__ecg2_single_shot_conversion_enable192:
;ecg2_hw.c,411 :: 		register_bit_set(CONFIG4_REG, 3, 1);
ORI	R27, R0, 1
ORI	R26, R0, 3
ORI	R25, R0, 23
JAL	_register_bit_set+0
NOP	
J	L_ecg2_single_shot_conversion_enable80
NOP	
L_ecg2_single_shot_conversion_enable79:
;ecg2_hw.c,413 :: 		register_bit_set(CONFIG4_REG, 3, 0);
MOVZ	R27, R0, R0
ORI	R26, R0, 3
ORI	R25, R0, 23
JAL	_register_bit_set+0
NOP	
L_ecg2_single_shot_conversion_enable80:
;ecg2_hw.c,414 :: 		}
L_end_ecg2_single_shot_conversion_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_single_shot_conversion_enable
_ecg2_wct_to_rld_connection_enable:
;ecg2_hw.c,416 :: 		void ecg2_wct_to_rld_connection_enable ( bool enable )
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,418 :: 		if (enable)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
BNE	R25, R0, L__ecg2_wct_to_rld_connection_enable195
NOP	
J	L_ecg2_wct_to_rld_connection_enable81
NOP	
L__ecg2_wct_to_rld_connection_enable195:
;ecg2_hw.c,419 :: 		register_bit_set(CONFIG4_REG, 2, 1);
ORI	R27, R0, 1
ORI	R26, R0, 2
ORI	R25, R0, 23
JAL	_register_bit_set+0
NOP	
J	L_ecg2_wct_to_rld_connection_enable82
NOP	
L_ecg2_wct_to_rld_connection_enable81:
;ecg2_hw.c,421 :: 		register_bit_set(CONFIG4_REG, 2, 0);
MOVZ	R27, R0, R0
ORI	R26, R0, 2
ORI	R25, R0, 23
JAL	_register_bit_set+0
NOP	
L_ecg2_wct_to_rld_connection_enable82:
;ecg2_hw.c,422 :: 		}
L_end_ecg2_wct_to_rld_connection_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_wct_to_rld_connection_enable
_ecg2_lead_off_comparator_enable:
;ecg2_hw.c,424 :: 		void ecg2_lead_off_comparator_enable (bool enable )
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;ecg2_hw.c,426 :: 		if (enable)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
BNE	R25, R0, L__ecg2_lead_off_comparator_enable198
NOP	
J	L_ecg2_lead_off_comparator_enable83
NOP	
L__ecg2_lead_off_comparator_enable198:
;ecg2_hw.c,427 :: 		register_bit_set(CONFIG4_REG, 1, 1);
ORI	R27, R0, 1
ORI	R26, R0, 1
ORI	R25, R0, 23
JAL	_register_bit_set+0
NOP	
J	L_ecg2_lead_off_comparator_enable84
NOP	
L_ecg2_lead_off_comparator_enable83:
;ecg2_hw.c,429 :: 		register_bit_set(CONFIG4_REG, 1, 0);
MOVZ	R27, R0, R0
ORI	R26, R0, 1
ORI	R25, R0, 23
JAL	_register_bit_set+0
NOP	
L_ecg2_lead_off_comparator_enable84:
;ecg2_hw.c,430 :: 		}
L_end_ecg2_lead_off_comparator_enable:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _ecg2_lead_off_comparator_enable
_ecg2_wilson_center_terminal_configure:
;ecg2_hw.c,432 :: 		void ecg2_wilson_center_terminal_configure (uint16_t set)
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;ecg2_hw.c,435 :: 		tempbuff[0] = (uint8_t) set; // lsb
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R4, SP, 16
SB	R25, 0(R4)
;ecg2_hw.c,436 :: 		tempbuff[1] = (uint8_t) (set >> 8); // msb
ADDIU	R3, R4, 1
ANDI	R2, R25, 65535
SRL	R2, R2, 8
SB	R2, 0(R3)
;ecg2_hw.c,438 :: 		ecg2_hal_write_bytes(WCT1_REG, tempbuff, 2);
ORI	R27, R0, 2
MOVZ	R26, R4, R0
ORI	R25, R0, 24
JAL	_ecg2_hal_write_bytes+0
NOP	
;ecg2_hw.c,439 :: 		}
L_end_ecg2_wilson_center_terminal_configure:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ecg2_wilson_center_terminal_configure
