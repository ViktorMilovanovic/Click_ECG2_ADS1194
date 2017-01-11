_ecg2_hal_cs:
;ecg2_hal.c,66 :: 		void ecg2_hal_cs( uint8_t logic )
; logic start address is: 0 (R0)
; logic end address is: 0 (R0)
; logic start address is: 0 (R0)
;ecg2_hal.c,68 :: 		ECG2_CS = logic;
MOVW	R1, #lo_addr(ECG2_CS+0)
MOVT	R1, #hi_addr(ECG2_CS+0)
STR	R0, [R1, #0]
; logic end address is: 0 (R0)
;ecg2_hal.c,69 :: 		}
L_end_ecg2_hal_cs:
BX	LR
; end of _ecg2_hal_cs
_ecg2_hal_rts:
;ecg2_hal.c,71 :: 		void ecg2_hal_rts ( uint8_t logic )
; logic start address is: 0 (R0)
; logic end address is: 0 (R0)
; logic start address is: 0 (R0)
;ecg2_hal.c,73 :: 		ECG2_RESET = logic;
MOVW	R1, #lo_addr(ECG2_RESET+0)
MOVT	R1, #hi_addr(ECG2_RESET+0)
STR	R0, [R1, #0]
; logic end address is: 0 (R0)
;ecg2_hal.c,74 :: 		}
L_end_ecg2_hal_rts:
BX	LR
; end of _ecg2_hal_rts
_ecg2_hal_init:
;ecg2_hal.c,76 :: 		void ecg2_hal_init()
;ecg2_hal.c,84 :: 		write_spi_ptr = SPI_Write;
MOVW	R1, #lo_addr(_SPI_Write+0)
MOVT	R1, #hi_addr(_SPI_Write+0)
MOVW	R0, #lo_addr(ecg2_hal_write_spi_ptr+0)
MOVT	R0, #hi_addr(ecg2_hal_write_spi_ptr+0)
STR	R1, [R0, #0]
;ecg2_hal.c,85 :: 		read_spi_ptr  = SPI_Read;
MOVW	R1, #lo_addr(_SPI_Read+0)
MOVT	R1, #hi_addr(_SPI_Read+0)
MOVW	R0, #lo_addr(ecg2_hal_read_spi_ptr+0)
MOVT	R0, #hi_addr(ecg2_hal_read_spi_ptr+0)
STR	R1, [R0, #0]
;ecg2_hal.c,90 :: 		}
L_end_ecg2_hal_init:
BX	LR
; end of _ecg2_hal_init
_ecg2_hal_read_bytes:
;ecg2_hal.c,92 :: 		int8_t ecg2_hal_read_bytes( uint8_t reg, uint8_t* buffer_in, uint8_t num_bytes)
; buffer_in start address is: 4 (R1)
; reg start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
STRB	R2, [SP, #12]
; buffer_in end address is: 4 (R1)
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
; buffer_in start address is: 4 (R1)
;ecg2_hal.c,94 :: 		if (reg > 0b00011111)
CMP	R0, #31
IT	LS
BLS	L_ecg2_hal_read_bytes0
; reg end address is: 0 (R0)
; buffer_in end address is: 4 (R1)
;ecg2_hal.c,95 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_ecg2_hal_read_bytes
L_ecg2_hal_read_bytes0:
;ecg2_hal.c,96 :: 		if (num_bytes > 0b00011111)
; buffer_in start address is: 4 (R1)
; reg start address is: 0 (R0)
LDRB	R3, [SP, #12]
CMP	R3, #31
IT	LS
BLS	L_ecg2_hal_read_bytes1
; reg end address is: 0 (R0)
; buffer_in end address is: 4 (R1)
;ecg2_hal.c,97 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_ecg2_hal_read_bytes
L_ecg2_hal_read_bytes1:
;ecg2_hal.c,101 :: 		uint8_t *temp_bfr_ptr = buffer_in;
; buffer_in start address is: 4 (R1)
; reg start address is: 0 (R0)
STR	R1, [SP, #8]
; buffer_in end address is: 4 (R1)
;ecg2_hal.c,102 :: 		opcode[0] = 0b00100000;
ADD	R5, SP, #4
MOVS	R3, #32
STRB	R3, [R5, #0]
;ecg2_hal.c,103 :: 		opcode[0] |= reg;
LDRB	R3, [R5, #0]
ORRS	R3, R0
; reg end address is: 0 (R0)
STRB	R3, [R5, #0]
;ecg2_hal.c,104 :: 		opcode[1] = 0;
ADDS	R4, R5, #1
MOVS	R3, #0
STRB	R3, [R4, #0]
;ecg2_hal.c,105 :: 		opcode[1] |= num_bytes;
ADDS	R5, R5, #1
LDRB	R4, [R5, #0]
LDRB	R3, [SP, #12]
ORR	R3, R4, R3, LSL #0
STRB	R3, [R5, #0]
;ecg2_hal.c,107 :: 		ECG2_hal_cs(0);
MOVS	R0, #0
BL	_ecg2_hal_cs+0
;ecg2_hal.c,108 :: 		delay_ms(1);
MOVW	R7, #23999
MOVT	R7, #0
NOP
NOP
L_ecg2_hal_read_bytes3:
SUBS	R7, R7, #1
BNE	L_ecg2_hal_read_bytes3
NOP
NOP
;ecg2_hal.c,109 :: 		write_spi_ptr( opcode[0] );
ADD	R3, SP, #4
LDRB	R3, [R3, #0]
UXTB	R4, R3
UXTH	R0, R4
MOVW	R4, #lo_addr(ecg2_hal_write_spi_ptr+0)
MOVT	R4, #hi_addr(ecg2_hal_write_spi_ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;ecg2_hal.c,110 :: 		write_spi_ptr( opcode[1] );
ADD	R3, SP, #4
ADDS	R3, R3, #1
LDRB	R3, [R3, #0]
UXTB	R4, R3
UXTH	R0, R4
MOVW	R4, #lo_addr(ecg2_hal_write_spi_ptr+0)
MOVT	R4, #hi_addr(ecg2_hal_write_spi_ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;ecg2_hal.c,111 :: 		delay_ms( 5 );
MOVW	R7, #54462
MOVT	R7, #1
NOP
NOP
L_ecg2_hal_read_bytes5:
SUBS	R7, R7, #1
BNE	L_ecg2_hal_read_bytes5
NOP
NOP
NOP
NOP
;ecg2_hal.c,113 :: 		while(num_bytes--)
L_ecg2_hal_read_bytes7:
LDRB	R4, [SP, #12]
LDRB	R3, [SP, #12]
SUBS	R3, R3, #1
STRB	R3, [SP, #12]
CMP	R4, #0
IT	EQ
BEQ	L_ecg2_hal_read_bytes8
;ecg2_hal.c,114 :: 		*(temp_bfr_ptr++) = read_spi_ptr(0);
MOVS	R0, #0
MOVW	R4, #lo_addr(ecg2_hal_read_spi_ptr+0)
MOVT	R4, #hi_addr(ecg2_hal_read_spi_ptr+0)
LDR	R4, [R4, #0]
BLX	R4
LDR	R3, [SP, #8]
STRB	R0, [R3, #0]
LDR	R3, [SP, #8]
ADDS	R3, R3, #1
STR	R3, [SP, #8]
IT	AL
BAL	L_ecg2_hal_read_bytes7
L_ecg2_hal_read_bytes8:
;ecg2_hal.c,116 :: 		ECG2_hal_cs(1);
MOVS	R0, #1
BL	_ecg2_hal_cs+0
;ecg2_hal.c,118 :: 		}
L_end_ecg2_hal_read_bytes:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _ecg2_hal_read_bytes
_ecg2_hal_write_bytes:
;ecg2_hal.c,120 :: 		int8_t ecg2_hal_write_bytes ( uint8_t reg, uint8_t* buffer_out, uint8_t num_bytes)
; buffer_out start address is: 4 (R1)
; reg start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
STRB	R2, [SP, #12]
; buffer_out end address is: 4 (R1)
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
; buffer_out start address is: 4 (R1)
;ecg2_hal.c,122 :: 		if (reg > 0b00011111)
CMP	R0, #31
IT	LS
BLS	L_ecg2_hal_write_bytes9
; reg end address is: 0 (R0)
; buffer_out end address is: 4 (R1)
;ecg2_hal.c,123 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_ecg2_hal_write_bytes
L_ecg2_hal_write_bytes9:
;ecg2_hal.c,124 :: 		if (num_bytes > 0b00011111)
; buffer_out start address is: 4 (R1)
; reg start address is: 0 (R0)
LDRB	R3, [SP, #12]
CMP	R3, #31
IT	LS
BLS	L_ecg2_hal_write_bytes10
; reg end address is: 0 (R0)
; buffer_out end address is: 4 (R1)
;ecg2_hal.c,125 :: 		return -1;
MOVS	R0, #-1
SXTB	R0, R0
IT	AL
BAL	L_end_ecg2_hal_write_bytes
L_ecg2_hal_write_bytes10:
;ecg2_hal.c,129 :: 		uint8_t *temp_bfr_ptr = buffer_out;
; buffer_out start address is: 4 (R1)
; reg start address is: 0 (R0)
STR	R1, [SP, #8]
; buffer_out end address is: 4 (R1)
;ecg2_hal.c,130 :: 		opcode[0] = 0b01000000;
ADD	R5, SP, #4
MOVS	R3, #64
STRB	R3, [R5, #0]
;ecg2_hal.c,131 :: 		opcode[0] |= reg;
LDRB	R3, [R5, #0]
ORRS	R3, R0
; reg end address is: 0 (R0)
STRB	R3, [R5, #0]
;ecg2_hal.c,132 :: 		opcode[1] = 0;
ADDS	R4, R5, #1
MOVS	R3, #0
STRB	R3, [R4, #0]
;ecg2_hal.c,133 :: 		opcode[1] |= num_bytes;
ADDS	R5, R5, #1
LDRB	R4, [R5, #0]
LDRB	R3, [SP, #12]
ORR	R3, R4, R3, LSL #0
STRB	R3, [R5, #0]
;ecg2_hal.c,135 :: 		ECG2_hal_cs(0);
MOVS	R0, #0
BL	_ecg2_hal_cs+0
;ecg2_hal.c,136 :: 		delay_ms(1);
MOVW	R7, #23999
MOVT	R7, #0
NOP
NOP
L_ecg2_hal_write_bytes12:
SUBS	R7, R7, #1
BNE	L_ecg2_hal_write_bytes12
NOP
NOP
;ecg2_hal.c,137 :: 		write_spi_ptr(opcode[0]);
ADD	R3, SP, #4
LDRB	R3, [R3, #0]
UXTB	R4, R3
UXTH	R0, R4
MOVW	R4, #lo_addr(ecg2_hal_write_spi_ptr+0)
MOVT	R4, #hi_addr(ecg2_hal_write_spi_ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;ecg2_hal.c,138 :: 		write_spi_ptr(opcode[1]);
ADD	R3, SP, #4
ADDS	R3, R3, #1
LDRB	R3, [R3, #0]
UXTB	R4, R3
UXTH	R0, R4
MOVW	R4, #lo_addr(ecg2_hal_write_spi_ptr+0)
MOVT	R4, #hi_addr(ecg2_hal_write_spi_ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;ecg2_hal.c,140 :: 		while(num_bytes--)
L_ecg2_hal_write_bytes14:
LDRB	R4, [SP, #12]
LDRB	R3, [SP, #12]
SUBS	R3, R3, #1
STRB	R3, [SP, #12]
CMP	R4, #0
IT	EQ
BEQ	L_ecg2_hal_write_bytes15
;ecg2_hal.c,141 :: 		write_spi_ptr(*(temp_bfr_ptr++));
LDR	R3, [SP, #8]
LDRB	R3, [R3, #0]
UXTB	R4, R3
UXTH	R0, R4
MOVW	R4, #lo_addr(ecg2_hal_write_spi_ptr+0)
MOVT	R4, #hi_addr(ecg2_hal_write_spi_ptr+0)
LDR	R4, [R4, #0]
BLX	R4
LDR	R3, [SP, #8]
ADDS	R3, R3, #1
STR	R3, [SP, #8]
IT	AL
BAL	L_ecg2_hal_write_bytes14
L_ecg2_hal_write_bytes15:
;ecg2_hal.c,142 :: 		delay_ms(10);
MOVW	R7, #43391
MOVT	R7, #3
NOP
NOP
L_ecg2_hal_write_bytes16:
SUBS	R7, R7, #1
BNE	L_ecg2_hal_write_bytes16
NOP
NOP
;ecg2_hal.c,143 :: 		ECG2_hal_cs(1);
MOVS	R0, #1
BL	_ecg2_hal_cs+0
;ecg2_hal.c,145 :: 		}
L_end_ecg2_hal_write_bytes:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _ecg2_hal_write_bytes
_ecg2_hal_send_command:
;ecg2_hal.c,147 :: 		void ecg2_hal_send_command (uint8_t command)
; command start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; command end address is: 0 (R0)
; command start address is: 0 (R0)
;ecg2_hal.c,149 :: 		ECG2_CS = 0; // select chip
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(ECG2_CS+0)
MOVT	R1, #hi_addr(ECG2_CS+0)
STR	R2, [R1, #0]
;ecg2_hal.c,150 :: 		Delay_us(1);
MOVW	R7, #23
MOVT	R7, #0
NOP
NOP
L_ecg2_hal_send_command18:
SUBS	R7, R7, #1
BNE	L_ecg2_hal_send_command18
NOP
NOP
;ecg2_hal.c,151 :: 		write_spi_ptr( command ); // send command
; command end address is: 0 (R0)
MOVW	R4, #lo_addr(ecg2_hal_write_spi_ptr+0)
MOVT	R4, #hi_addr(ecg2_hal_write_spi_ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;ecg2_hal.c,152 :: 		Delay_us(10);
MOVW	R7, #239
MOVT	R7, #0
NOP
NOP
L_ecg2_hal_send_command20:
SUBS	R7, R7, #1
BNE	L_ecg2_hal_send_command20
NOP
NOP
;ecg2_hal.c,153 :: 		ECG2_CS = 1; // deselect chip
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(ECG2_CS+0)
MOVT	R1, #hi_addr(ECG2_CS+0)
STR	R2, [R1, #0]
;ecg2_hal.c,154 :: 		Delay_us(10);
MOVW	R7, #239
MOVT	R7, #0
NOP
NOP
L_ecg2_hal_send_command22:
SUBS	R7, R7, #1
BNE	L_ecg2_hal_send_command22
NOP
NOP
;ecg2_hal.c,155 :: 		}
L_end_ecg2_hal_send_command:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ecg2_hal_send_command
