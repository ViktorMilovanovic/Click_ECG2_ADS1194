_ecg2_hal_cs:
;ecg2_hal.c,68 :: 		void ecg2_hal_cs( uint8_t logic )
;ecg2_hal.c,70 :: 		ECG2_CS = logic;
_LX	
INS	R2, R25, BitPos(ECG2_CS+0), 1
_SX	
;ecg2_hal.c,71 :: 		}
L_end_ecg2_hal_cs:
JR	RA
NOP	
; end of _ecg2_hal_cs
_ecg2_hal_rts:
;ecg2_hal.c,73 :: 		void ecg2_hal_rts ( uint8_t logic )
;ecg2_hal.c,75 :: 		ECG2_RESET = logic;
_LX	
INS	R2, R25, BitPos(ECG2_RESET+0), 1
_SX	
;ecg2_hal.c,76 :: 		}
L_end_ecg2_hal_rts:
JR	RA
NOP	
; end of _ecg2_hal_rts
_ecg2_hal_init:
;ecg2_hal.c,78 :: 		void ecg2_hal_init()
;ecg2_hal.c,86 :: 		write_spi_ptr = SPI_Write;
LUI	R2, hi_addr(_SPI_Write+0)
ORI	R2, R2, lo_addr(_SPI_Write+0)
SW	R2, Offset(ecg2_hal_write_spi_ptr+0)(GP)
;ecg2_hal.c,87 :: 		read_spi_ptr  = SPI_Read;
LUI	R2, hi_addr(_SPI_Read+0)
ORI	R2, R2, lo_addr(_SPI_Read+0)
SW	R2, Offset(ecg2_hal_read_spi_ptr+0)(GP)
;ecg2_hal.c,92 :: 		}
L_end_ecg2_hal_init:
JR	RA
NOP	
; end of _ecg2_hal_init
_ecg2_hal_read_bytes:
;ecg2_hal.c,94 :: 		int8_t ecg2_hal_read_bytes( uint8_t reg, uint8_t* buffer_in, uint8_t num_bytes)
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;ecg2_hal.c,96 :: 		if (reg > 0b00011111)
SW	R25, 4(SP)
ANDI	R2, R25, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__ecg2_hal_read_bytes28
NOP	
J	L_ecg2_hal_read_bytes0
NOP	
L__ecg2_hal_read_bytes28:
;ecg2_hal.c,97 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_hal_read_bytes
NOP	
L_ecg2_hal_read_bytes0:
;ecg2_hal.c,98 :: 		if (num_bytes > 0b00011111)
ANDI	R2, R27, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__ecg2_hal_read_bytes29
NOP	
J	L_ecg2_hal_read_bytes1
NOP	
L__ecg2_hal_read_bytes29:
;ecg2_hal.c,99 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_hal_read_bytes
NOP	
L_ecg2_hal_read_bytes1:
;ecg2_hal.c,103 :: 		uint8_t *temp_bfr_ptr = buffer_in;
SW	R26, 20(SP)
;ecg2_hal.c,104 :: 		opcode[0] = 0b00100000;
ADDIU	R3, SP, 17
ORI	R2, R0, 32
SB	R2, 0(R3)
;ecg2_hal.c,105 :: 		opcode[0] |= reg;
LBU	R2, 0(R3)
OR	R2, R2, R25
SB	R2, 0(R3)
;ecg2_hal.c,106 :: 		opcode[1] = 0;
ADDIU	R2, R3, 1
SB	R0, 0(R2)
;ecg2_hal.c,107 :: 		opcode[1] |= num_bytes;
ADDIU	R3, R3, 1
LBU	R2, 0(R3)
OR	R2, R2, R27
SB	R2, 0(R3)
;ecg2_hal.c,109 :: 		ECG2_hal_cs(0);
MOVZ	R25, R0, R0
JAL	_ecg2_hal_cs+0
NOP	
;ecg2_hal.c,110 :: 		delay_ms(1);
LUI	R24, 0
ORI	R24, R24, 26666
L_ecg2_hal_read_bytes3:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ecg2_hal_read_bytes3
NOP	
;ecg2_hal.c,111 :: 		write_spi_ptr( opcode[0] );
ADDIU	R2, SP, 17
SB	R27, 8(SP)
LBU	R25, 0(R2)
LW	R30, Offset(ecg2_hal_write_spi_ptr+0)(GP)
JALR	RA, R30
NOP	
;ecg2_hal.c,112 :: 		write_spi_ptr( opcode[1] );
ADDIU	R2, SP, 17
ADDIU	R2, R2, 1
LBU	R25, 0(R2)
LW	R30, Offset(ecg2_hal_write_spi_ptr+0)(GP)
JALR	RA, R30
NOP	
LBU	R27, 8(SP)
;ecg2_hal.c,113 :: 		delay_ms( 5 );
LUI	R24, 2
ORI	R24, R24, 2260
L_ecg2_hal_read_bytes5:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ecg2_hal_read_bytes5
NOP	
NOP	
NOP	
;ecg2_hal.c,115 :: 		while(num_bytes--)
L_ecg2_hal_read_bytes7:
ANDI	R3, R27, 255
ADDIU	R2, R27, -1
ANDI	R27, R2, 255
BNE	R3, R0, L__ecg2_hal_read_bytes31
NOP	
J	L_ecg2_hal_read_bytes8
NOP	
L__ecg2_hal_read_bytes31:
;ecg2_hal.c,116 :: 		*(temp_bfr_ptr++) = read_spi_ptr(0);
SB	R27, 8(SP)
SW	R26, 12(SP)
SB	R25, 16(SP)
MOVZ	R25, R0, R0
LW	R30, Offset(ecg2_hal_read_spi_ptr+0)(GP)
JALR	RA, R30
NOP	
LBU	R25, 16(SP)
LW	R26, 12(SP)
LBU	R27, 8(SP)
LW	R3, 20(SP)
SB	R2, 0(R3)
LW	R2, 20(SP)
ADDIU	R2, R2, 1
SW	R2, 20(SP)
J	L_ecg2_hal_read_bytes7
NOP	
L_ecg2_hal_read_bytes8:
;ecg2_hal.c,118 :: 		ECG2_hal_cs(1);
SB	R25, 8(SP)
ORI	R25, R0, 1
JAL	_ecg2_hal_cs+0
NOP	
LBU	R25, 8(SP)
;ecg2_hal.c,120 :: 		}
L_end_ecg2_hal_read_bytes:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _ecg2_hal_read_bytes
_ecg2_hal_write_bytes:
;ecg2_hal.c,122 :: 		int8_t ecg2_hal_write_bytes ( uint8_t reg, uint8_t* buffer_out, uint8_t num_bytes)
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;ecg2_hal.c,124 :: 		if (reg > 0b00011111)
SW	R25, 4(SP)
ANDI	R2, R25, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__ecg2_hal_write_bytes33
NOP	
J	L_ecg2_hal_write_bytes9
NOP	
L__ecg2_hal_write_bytes33:
;ecg2_hal.c,125 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_hal_write_bytes
NOP	
L_ecg2_hal_write_bytes9:
;ecg2_hal.c,126 :: 		if (num_bytes > 0b00011111)
ANDI	R2, R27, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__ecg2_hal_write_bytes34
NOP	
J	L_ecg2_hal_write_bytes10
NOP	
L__ecg2_hal_write_bytes34:
;ecg2_hal.c,127 :: 		return -1;
ORI	R2, R0, 255
J	L_end_ecg2_hal_write_bytes
NOP	
L_ecg2_hal_write_bytes10:
;ecg2_hal.c,131 :: 		uint8_t *temp_bfr_ptr = buffer_out;
SW	R26, 20(SP)
;ecg2_hal.c,132 :: 		opcode[0] = 0b01000000;
ADDIU	R3, SP, 17
ORI	R2, R0, 64
SB	R2, 0(R3)
;ecg2_hal.c,133 :: 		opcode[0] |= reg;
LBU	R2, 0(R3)
OR	R2, R2, R25
SB	R2, 0(R3)
;ecg2_hal.c,134 :: 		opcode[1] = 0;
ADDIU	R2, R3, 1
SB	R0, 0(R2)
;ecg2_hal.c,135 :: 		opcode[1] |= num_bytes;
ADDIU	R3, R3, 1
LBU	R2, 0(R3)
OR	R2, R2, R27
SB	R2, 0(R3)
;ecg2_hal.c,137 :: 		ECG2_hal_cs(0);
MOVZ	R25, R0, R0
JAL	_ecg2_hal_cs+0
NOP	
;ecg2_hal.c,138 :: 		delay_ms(1);
LUI	R24, 0
ORI	R24, R24, 26666
L_ecg2_hal_write_bytes12:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ecg2_hal_write_bytes12
NOP	
;ecg2_hal.c,139 :: 		write_spi_ptr(opcode[0]);
ADDIU	R2, SP, 17
SB	R27, 8(SP)
LBU	R25, 0(R2)
LW	R30, Offset(ecg2_hal_write_spi_ptr+0)(GP)
JALR	RA, R30
NOP	
;ecg2_hal.c,140 :: 		write_spi_ptr(opcode[1]);
ADDIU	R2, SP, 17
ADDIU	R2, R2, 1
LBU	R25, 0(R2)
LW	R30, Offset(ecg2_hal_write_spi_ptr+0)(GP)
JALR	RA, R30
NOP	
LBU	R27, 8(SP)
;ecg2_hal.c,142 :: 		while(num_bytes--)
L_ecg2_hal_write_bytes14:
ANDI	R3, R27, 255
ADDIU	R2, R27, -1
ANDI	R27, R2, 255
BNE	R3, R0, L__ecg2_hal_write_bytes36
NOP	
J	L_ecg2_hal_write_bytes15
NOP	
L__ecg2_hal_write_bytes36:
;ecg2_hal.c,143 :: 		write_spi_ptr(*(temp_bfr_ptr++));
LW	R2, 20(SP)
SB	R27, 8(SP)
SW	R26, 12(SP)
SB	R25, 16(SP)
LBU	R25, 0(R2)
LW	R30, Offset(ecg2_hal_write_spi_ptr+0)(GP)
JALR	RA, R30
NOP	
LBU	R25, 16(SP)
LW	R26, 12(SP)
LBU	R27, 8(SP)
LW	R2, 20(SP)
ADDIU	R2, R2, 1
SW	R2, 20(SP)
J	L_ecg2_hal_write_bytes14
NOP	
L_ecg2_hal_write_bytes15:
;ecg2_hal.c,144 :: 		delay_ms(10);
LUI	R24, 4
ORI	R24, R24, 4522
L_ecg2_hal_write_bytes16:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ecg2_hal_write_bytes16
NOP	
;ecg2_hal.c,145 :: 		ECG2_hal_cs(1);
SB	R25, 8(SP)
ORI	R25, R0, 1
JAL	_ecg2_hal_cs+0
NOP	
LBU	R25, 8(SP)
;ecg2_hal.c,147 :: 		}
L_end_ecg2_hal_write_bytes:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _ecg2_hal_write_bytes
_ecg2_hal_send_command:
;ecg2_hal.c,149 :: 		void ecg2_hal_send_command (uint8_t command)
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;ecg2_hal.c,151 :: 		ECG2_CS = 0; // select chip
_LX	
INS	R2, R0, BitPos(ECG2_CS+0), 1
_SX	
;ecg2_hal.c,152 :: 		Delay_us(1);
LUI	R24, 0
ORI	R24, R24, 26
L_ecg2_hal_send_command18:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ecg2_hal_send_command18
NOP	
;ecg2_hal.c,153 :: 		write_spi_ptr( command ); // send command
ANDI	R25, R25, 255
LW	R30, Offset(ecg2_hal_write_spi_ptr+0)(GP)
JALR	RA, R30
NOP	
;ecg2_hal.c,154 :: 		Delay_us(10);
LUI	R24, 0
ORI	R24, R24, 266
L_ecg2_hal_send_command20:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ecg2_hal_send_command20
NOP	
;ecg2_hal.c,155 :: 		ECG2_CS = 1; // deselect chip
_LX	
ORI	R2, R2, BitMask(ECG2_CS+0)
_SX	
;ecg2_hal.c,156 :: 		Delay_us(10);
LUI	R24, 0
ORI	R24, R24, 266
L_ecg2_hal_send_command22:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ecg2_hal_send_command22
NOP	
;ecg2_hal.c,157 :: 		}
L_end_ecg2_hal_send_command:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _ecg2_hal_send_command
