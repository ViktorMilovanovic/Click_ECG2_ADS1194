_ecg2_hal_cs:
;ecg2_hal.c,66 :: 		void ecg2_hal_cs( uint8_t logic )
; logic start address is: 0 (R0)
; logic end address is: 0 (R0)
; logic start address is: 0 (R0)
;ecg2_hal.c,68 :: 		ECG2_CS = logic;
LDA.x	R1, #AlignedAddress(ECG2_CS+0)
LDL.L	R30, R0, #BitPos(ECG2_CS+0)
BINS.L	R1, R1, R30
; logic end address is: 0 (R0)
STI.x	ECG2_CS+0, #AlignedAddress(R1)
;ecg2_hal.c,69 :: 		}
L_end_ecg2_hal_cs:
RETURN	
; end of _ecg2_hal_cs
_ecg2_hal_rts:
;ecg2_hal.c,71 :: 		void ecg2_hal_rts ( uint8_t logic )
; logic start address is: 0 (R0)
; logic end address is: 0 (R0)
; logic start address is: 0 (R0)
;ecg2_hal.c,73 :: 		ECG2_RESET = logic;
LDA.x	R1, #AlignedAddress(ECG2_RESET+0)
LDL.L	R30, R0, #BitPos(ECG2_RESET+0)
BINS.L	R1, R1, R30
; logic end address is: 0 (R0)
STI.x	ECG2_RESET+0, #AlignedAddress(R1)
;ecg2_hal.c,74 :: 		}
L_end_ecg2_hal_rts:
RETURN	
; end of _ecg2_hal_rts
_ecg2_hal_init:
;ecg2_hal.c,76 :: 		void ecg2_hal_init()
;ecg2_hal.c,87 :: 		write_spi_ptr = SPIM_Write;
LDK.L	R0, #_SPIM_Write+0
STA.L	ecg2_hal_write_spi_ptr+0, R0
;ecg2_hal.c,88 :: 		read_spi_ptr  = SPIM_Read;
LDK.L	R0, #_SPIM_Read+0
STA.L	ecg2_hal_read_spi_ptr+0, R0
;ecg2_hal.c,90 :: 		}
L_end_ecg2_hal_init:
RETURN	
; end of _ecg2_hal_init
_ecg2_hal_read_bytes:
;ecg2_hal.c,92 :: 		int8_t ecg2_hal_read_bytes( uint8_t reg, uint8_t* buffer_in, uint8_t num_bytes)
; buffer_in start address is: 4 (R1)
; reg start address is: 0 (R0)
LINK	LR, #12
STI.B	SP, #8, R2
; buffer_in end address is: 4 (R1)
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
; buffer_in start address is: 4 (R1)
;ecg2_hal.c,94 :: 		if (reg > 0b00011111)
CMP.B	R0, #31
JMPC	R30, A, #0, L_ecg2_hal_read_bytes0
; reg end address is: 0 (R0)
; buffer_in end address is: 4 (R1)
;ecg2_hal.c,95 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_hal_read_bytes
L_ecg2_hal_read_bytes0:
;ecg2_hal.c,96 :: 		if (num_bytes > 0b00011111)
; buffer_in start address is: 4 (R1)
; reg start address is: 0 (R0)
LDI.B	R3, SP, #8
CMP.B	R3, #31
JMPC	R30, A, #0, L_ecg2_hal_read_bytes1
; reg end address is: 0 (R0)
; buffer_in end address is: 4 (R1)
;ecg2_hal.c,97 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_hal_read_bytes
L_ecg2_hal_read_bytes1:
;ecg2_hal.c,101 :: 		uint8_t *temp_bfr_ptr = buffer_in;
; buffer_in start address is: 4 (R1)
; reg start address is: 0 (R0)
STI.L	SP, #4, R1
; buffer_in end address is: 4 (R1)
;ecg2_hal.c,102 :: 		opcode[0] = 0b00100000;
ADD.L	R5, SP, #0
LDK.L	R3, #32
STI.B	R5, #0, R3
;ecg2_hal.c,103 :: 		opcode[0] |= reg;
LDI.B	R3, R5, #0
OR.L	R3, R3, R0
; reg end address is: 0 (R0)
STI.B	R5, #0, R3
;ecg2_hal.c,104 :: 		opcode[1] = 0;
ADD.L	R4, R5, #1
LDK.L	R3, #0
STI.B	R4, #0, R3
;ecg2_hal.c,105 :: 		opcode[1] |= num_bytes;
ADD.L	R5, R5, #1
LDI.B	R4, R5, #0
LDI.B	R3, SP, #8
OR.L	R3, R4, R3
STI.B	R5, #0, R3
;ecg2_hal.c,107 :: 		ECG2_hal_cs(0);
LDK.L	R0, #0
CALL	_ecg2_hal_cs+0
;ecg2_hal.c,108 :: 		delay_ms(1);
LPM.L	R28, #33331
NOP	
L_ecg2_hal_read_bytes3:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_ecg2_hal_read_bytes3
JMP	$+8
	#33331
NOP	
NOP	
;ecg2_hal.c,109 :: 		write_spi_ptr( opcode[0] );
ADD.L	R3, SP, #0
LDI.B	R3, R3, #0
BEXTU.L	R6, R3, #256
BEXTU.L	R0, R6, #256
LDA.L	R6, ecg2_hal_write_spi_ptr+0
CALLI	R6
;ecg2_hal.c,110 :: 		write_spi_ptr( opcode[1] );
ADD.L	R3, SP, #0
ADD.L	R3, R3, #1
LDI.B	R3, R3, #0
BEXTU.L	R6, R3, #256
BEXTU.L	R0, R6, #256
LDA.L	R6, ecg2_hal_write_spi_ptr+0
CALLI	R6
;ecg2_hal.c,111 :: 		delay_ms( 5 );
LPM.L	R28, #166665
NOP	
L_ecg2_hal_read_bytes5:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_ecg2_hal_read_bytes5
JMP	$+8
	#166665
;ecg2_hal.c,113 :: 		while(num_bytes--)
L_ecg2_hal_read_bytes7:
LDI.B	R4, SP, #8
LDI.B	R3, SP, #8
SUB.L	R3, R3, #1
STI.B	SP, #8, R3
CMP.B	R4, #0
JMPC	R30, Z, #1, L_ecg2_hal_read_bytes8
;ecg2_hal.c,114 :: 		*(temp_bfr_ptr++) = read_spi_ptr(0);
LDK.L	R0, #0
LDA.L	R6, ecg2_hal_read_spi_ptr+0
CALLI	R6
LDI.L	R3, SP, #4
STI.B	R3, #0, R0
LDI.L	R3, SP, #4
ADD.L	R3, R3, #1
STI.L	SP, #4, R3
JMP	L_ecg2_hal_read_bytes7
L_ecg2_hal_read_bytes8:
;ecg2_hal.c,116 :: 		ECG2_hal_cs(1);
LDK.L	R0, #1
CALL	_ecg2_hal_cs+0
;ecg2_hal.c,118 :: 		}
L_end_ecg2_hal_read_bytes:
UNLINK	LR
RETURN	
; end of _ecg2_hal_read_bytes
_ecg2_hal_write_bytes:
;ecg2_hal.c,120 :: 		int8_t ecg2_hal_write_bytes ( uint8_t reg, uint8_t* buffer_out, uint8_t num_bytes)
; buffer_out start address is: 4 (R1)
; reg start address is: 0 (R0)
LINK	LR, #12
STI.B	SP, #8, R2
; buffer_out end address is: 4 (R1)
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
; buffer_out start address is: 4 (R1)
;ecg2_hal.c,122 :: 		if (reg > 0b00011111)
CMP.B	R0, #31
JMPC	R30, A, #0, L_ecg2_hal_write_bytes9
; reg end address is: 0 (R0)
; buffer_out end address is: 4 (R1)
;ecg2_hal.c,123 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_hal_write_bytes
L_ecg2_hal_write_bytes9:
;ecg2_hal.c,124 :: 		if (num_bytes > 0b00011111)
; buffer_out start address is: 4 (R1)
; reg start address is: 0 (R0)
LDI.B	R3, SP, #8
CMP.B	R3, #31
JMPC	R30, A, #0, L_ecg2_hal_write_bytes10
; reg end address is: 0 (R0)
; buffer_out end address is: 4 (R1)
;ecg2_hal.c,125 :: 		return -1;
LDK.L	R0, #-1
JMP	L_end_ecg2_hal_write_bytes
L_ecg2_hal_write_bytes10:
;ecg2_hal.c,129 :: 		uint8_t *temp_bfr_ptr = buffer_out;
; buffer_out start address is: 4 (R1)
; reg start address is: 0 (R0)
STI.L	SP, #4, R1
; buffer_out end address is: 4 (R1)
;ecg2_hal.c,130 :: 		opcode[0] = 0b01000000;
ADD.L	R5, SP, #0
LDK.L	R3, #64
STI.B	R5, #0, R3
;ecg2_hal.c,131 :: 		opcode[0] |= reg;
LDI.B	R3, R5, #0
OR.L	R3, R3, R0
; reg end address is: 0 (R0)
STI.B	R5, #0, R3
;ecg2_hal.c,132 :: 		opcode[1] = 0;
ADD.L	R4, R5, #1
LDK.L	R3, #0
STI.B	R4, #0, R3
;ecg2_hal.c,133 :: 		opcode[1] |= num_bytes;
ADD.L	R5, R5, #1
LDI.B	R4, R5, #0
LDI.B	R3, SP, #8
OR.L	R3, R4, R3
STI.B	R5, #0, R3
;ecg2_hal.c,135 :: 		ECG2_hal_cs(0);
LDK.L	R0, #0
CALL	_ecg2_hal_cs+0
;ecg2_hal.c,136 :: 		delay_ms(1);
LPM.L	R28, #33331
NOP	
L_ecg2_hal_write_bytes12:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_ecg2_hal_write_bytes12
JMP	$+8
	#33331
NOP	
NOP	
;ecg2_hal.c,137 :: 		write_spi_ptr(opcode[0]);
ADD.L	R3, SP, #0
LDI.B	R3, R3, #0
BEXTU.L	R6, R3, #256
BEXTU.L	R0, R6, #256
LDA.L	R6, ecg2_hal_write_spi_ptr+0
CALLI	R6
;ecg2_hal.c,138 :: 		write_spi_ptr(opcode[1]);
ADD.L	R3, SP, #0
ADD.L	R3, R3, #1
LDI.B	R3, R3, #0
BEXTU.L	R6, R3, #256
BEXTU.L	R0, R6, #256
LDA.L	R6, ecg2_hal_write_spi_ptr+0
CALLI	R6
;ecg2_hal.c,140 :: 		while(num_bytes--)
L_ecg2_hal_write_bytes14:
LDI.B	R4, SP, #8
LDI.B	R3, SP, #8
SUB.L	R3, R3, #1
STI.B	SP, #8, R3
CMP.B	R4, #0
JMPC	R30, Z, #1, L_ecg2_hal_write_bytes15
;ecg2_hal.c,141 :: 		write_spi_ptr(*(temp_bfr_ptr++));
LDI.L	R3, SP, #4
LDI.B	R3, R3, #0
BEXTU.L	R6, R3, #256
BEXTU.L	R0, R6, #256
LDA.L	R6, ecg2_hal_write_spi_ptr+0
CALLI	R6
LDI.L	R3, SP, #4
ADD.L	R3, R3, #1
STI.L	SP, #4, R3
JMP	L_ecg2_hal_write_bytes14
L_ecg2_hal_write_bytes15:
;ecg2_hal.c,142 :: 		delay_ms(10);
LPM.L	R28, #333331
NOP	
L_ecg2_hal_write_bytes16:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_ecg2_hal_write_bytes16
JMP	$+8
	#333331
NOP	
NOP	
;ecg2_hal.c,143 :: 		ECG2_hal_cs(1);
LDK.L	R0, #1
CALL	_ecg2_hal_cs+0
;ecg2_hal.c,145 :: 		}
L_end_ecg2_hal_write_bytes:
UNLINK	LR
RETURN	
; end of _ecg2_hal_write_bytes
_ecg2_hal_send_command:
;ecg2_hal.c,147 :: 		void ecg2_hal_send_command (uint8_t command)
; command start address is: 0 (R0)
; command end address is: 0 (R0)
; command start address is: 0 (R0)
;ecg2_hal.c,149 :: 		ECG2_CS = 0; // select chip
LDA.x	R1, #AlignedAddress(ECG2_CS+0)
BINS.L	R1, R1, #BitPos(ECG2_CS+0)=0
STI.x	ECG2_CS+0, #AlignedAddress(R1)
;ecg2_hal.c,150 :: 		Delay_us(1);
LPM.L	R28, #31
NOP	
L_ecg2_hal_send_command18:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_ecg2_hal_send_command18
JMP	$+8
	#31
NOP	
NOP	
;ecg2_hal.c,151 :: 		write_spi_ptr( command ); // send command
; command end address is: 0 (R0)
LDA.L	R6, ecg2_hal_write_spi_ptr+0
CALLI	R6
;ecg2_hal.c,152 :: 		Delay_us(10);
LPM.L	R28, #331
NOP	
L_ecg2_hal_send_command20:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_ecg2_hal_send_command20
JMP	$+8
	#331
NOP	
NOP	
;ecg2_hal.c,153 :: 		ECG2_CS = 1; // deselect chip
LDA.x	R1, #AlignedAddress(ECG2_CS+0)
BINS.L	R1, R1, #BitPos(ECG2_CS+0)=1
STI.x	ECG2_CS+0, #AlignedAddress(R1)
;ecg2_hal.c,154 :: 		Delay_us(10);
LPM.L	R28, #331
NOP	
L_ecg2_hal_send_command22:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_ecg2_hal_send_command22
JMP	$+8
	#331
NOP	
NOP	
;ecg2_hal.c,155 :: 		}
L_end_ecg2_hal_send_command:
RETURN	
; end of _ecg2_hal_send_command
