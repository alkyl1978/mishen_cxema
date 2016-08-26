

;***************************************************************************************
;	 ��������� ���������� *USART, ���� ��������*
;***************************************************************************************

RS_in:	WDR			;����� ����������� �������
	IN	R10,SREG		;��������� ��������� �������� �������
	LDS	R20,UDR0		;�������� ���� �� ��������� USART
	MOV	R21,R11		;������� �������� ���� �� ������ USART
	LDI	R30,LOW(Buf_in)	;����� ����������� ������ �� USART
	LDI	R31,HIGH(Buf_in)
	ADD	R30,R21
	ADC	R31,R8
	ST	Z,R20		;�������� �������� ���� � ���
	INC	R21
	MOV	R11,R21		;������� �������� ���� �� ������ USART
	CPI	R21,$07
	BRCC	RS_in_1		;������� ������ 6 ���� ?
	RJMP	RS_ks		;������� ����������� �����
RS_in_1:	CPI	R21,$08
	BRCS	RS_ks2		;������� ������ 7 ���� ?
	LDS	R31,Buf_in+6
	LDS	R30,Buf_in+7	;���������� ����� �������� � ������ �� USART
	LDI	R20,$AA
	CP	R30,R12	
	CPC	R31,R13
	BRNE	RS_in_2
	LDI	R20,$55
RS_in_2:	OUT	GPIOR1,R20		;���� ��������� - ������ �� ������ USART ������� ($55)
	RJMP	Recept		;��������� USART �� ���� ������

;***************************************************************************************
;	 ������� ������ USART ����
;***************************************************************************************

RS_out:	WDR			;����� ����������� �������
	IN	R10,SREG		;��������� ��������� �������� �������
	IN	R21,GPIOR2		;������� ������������ ����
	TST	R21
	BRMI	RS_out_2
	BREQ	RS_out_1
	RJMP	RS_out_3
RS_out_1:	STS	UDR0,R13		;�������� ��.���� �� � ����� ����������� USART
	SUBI	R21,1
	OUT	GPIOR2,R21		;������� ������������ ����
	RJMP	RS_ks2
RS_out_2:	STS	UDR0,R12		;�������� ��.���� �� � ����� ����������� USART
	LDI	R20,$48		;��������� �������� � ����������
	STS	UCSR0B,R20		; �� ���������� �������� USART
	RJMP	RS_ks2
RS_out_3:	SUBI	R21,1
	OUT	GPIOR2,R21		;������� ������������ ����
	MOVW	R31:R30,R15:R14	;������� ����� ����������������� ������������ ����
	LD	R20,Z+
	STS	UDR0,R20		;�������� ���� � ����� ����������� USART
	MOVW	R15:R14,R31:R30	;��������� - ����� ������ ������������ �� USART

;***************************************************************************************
;	 ������� ����������� ����� (� R20 ������� ����)
;***************************************************************************************

RS_ks:	EOR	R12,R20
	LDI	R20,$09
	LDI	R30,$01
	LDI	R31,$A0      	;������� A001 � R21, R20
RS_ks1:	DEC	R20
	BREQ	RS_ks2
	LSR	R13
	ROR	R12
	BRCC	RS_ks1
	EOR	R12,R30
	EOR	R13,R31		;� R13,R12 ������������� ����������� ����� 
	RJMP	RS_ks1
RS_ks2:	OUT	SREG,R10		;������������ ��������� �������� �������
	RETI

;***************************************************************************************
;	 USART �������� ���������
;***************************************************************************************

RS_fin:	WDR			;����� ����������� �������
	IN	R10,SREG		;��������� ��������� �������� �������

;***************************************************************************************
;	��������� USART �� ���� ������
;***************************************************************************************

Recept:	CLR	R12		;������������� USART	
	OUT	GPIOR0,R12		;�������� ���� - USART ����� ��������� ������
	CLR	R11		;������� �������� ���� �� ������ USART
	STS	UBRR0H,R12		;�������� 9600 ��� 4 ���
	LDI	R20,$19		;8 - ��� ������, ��� ���� ����
	STS	UBRR0L,R20
	LDI	R21,$40
	STS	UCSR0A,R21
	LDI	R20,$8E
	STS	UCSR0C,R20
	LDI	R21,$90
	STS	UCSR0B,R21		;��������� ���� ������ �� USART � ���������� �� USART
	COM	R12
	MOV	R13,R12		;����� ����������� ����� ������/�������� �� USART
	OUT	SREG,R10		;������������ ��������� �������� �������
	RETI

;***************************************************************************************
;	��������� ���������� �� ���������� �� ������� �2 (50 mc.)
;***************************************************************************************

Comp2A:	WDR			;����� ����������� �������
	IN	R10,SREG		;��������� ��������� �������� �������
	TST	R2
	BREQ	Comp2A_1
	DEC	R2		;������� 50 �� �� ������� ���������� ������� N1	 
Comp2A_1:	TST	R3
	BREQ	Comp2A_2
	DEC	R3		;������� 50 �� �� ������� ���������� ������� N2
Comp2A_2:	INC	R9		;��������� � �������� ����������� ������� �2 50 ��.
	CP	R9,R4		;������� ���������� ���� � 
	BRCS	Comp2A_4
	IN	R29,EIMSK
	CPI	R29,$01		;���������� �� ���� � ��������� ?
	BREQ	Comp2A_3
	LDI	R29,$01
	OUT	EIMSK,R29		;��������� ���������� �� INT0 
	OUT	EIFR,R29		;����� �������� �� ���������� �� INT0
Comp2A_3:	CLR	R4		;�������� ������� ���������� ���� �
Comp2A_4:	CP	R9,R5		;������� ���������� ���� � 
	BRCS	Comp2A_6
	LDS	R29,PCICR
	CPI	R29,$07		;���������� �� ���� � ��������� ?
	BREQ	Comp2A_5
	LDI	R29,$07
	STS	PCICR,R29		;��������� ���������� �� PCINT3,PCINT11, PCINT23
	OUT	PCIFR,R29		;����� �������� �� ���������� �� PCINT3,PCINT11, PCINT23
Comp2A_5:	CLR	R5		;�������� ������� ���������� ���� �
Comp2A_6:	LDS	R29,Interval	;����� ����� ����� ��������� �� �������� ��� ������� (N*50 ��) 
	CP	R9,R29
	BRCS	Comp2A_7
	OUT	EIMSK,R8		;��������� ���������� �� INT0 
	STS	PCICR,R8		;��������� ���������� �� PCINT3,PCINT11, PCINT23
	RJMP	Start_5
Comp2A_7:	OUT	SREG,R10		;������������ ��������� �������� �������
	RETI

;***************************************************************************************
	 
.DSEG
.ORG $100
	; ���������� � ���

Buf_in:	.BYTE 10	;����� ����������� ������ �� ������ USART
Buf_out:	.BYTE 8	;����� ������������ ������ �� ������ USART

F_usart_R2:	.BYTE 1	;���� � Data_outR2 ���� ������ ��� �������� �� USART ($55)
Data_outR2:	.BYTE 3	;����� ������ ��� �������� �� USART ��� ����� �������� N2 
F_usart_A:	.BYTE 1	;���� � Data_outA ���� ������ ��� �������� �� USART ($55)
Data_outA:	.BYTE 3	;����� ������ ��� �������� �� USART ��� ����� �� ���� � 
F_usart_R1:	.BYTE 1	;���� � Data_outR1 ���� ������ ��� �������� �� USART ($55)
Data_outR1:	.BYTE 3	;����� ������ ��� �������� �� USART ��� ����� �������� N1 
F_usart_B:	.BYTE 1	;���� � Data_outB ���� ������ ��� �������� �� USART ($55)
Data_outB:	.BYTE 3	;����� ������ ��� �������� �� USART ��� ����� �� ���� �

Stage_R2:	.BYTE 2	;�������� ������� ��������� ������� �1 ��� ����� �������� N2 
Stage_A:	.BYTE 2	;�������� ������� ��������� ������� �1 ��� ����� �� ���� �  
Stage_R1:	.BYTE 2	;�������� ������� ��������� ������� �1 ��� ����� �������� N1 
Stage_B:	.BYTE 2	;�������� ������� ��������� ������� �1 ��� ����� �� ���� �

Stage_m:	.BYTE 2	;���� ���� �����������
Stage_t:	.BYTE 2	;���� ���� "�������"
Chatter:	.BYTE 1	;����� �������� ��� ���������� "��������" �������� (N*50 ��) 
Interval:	.BYTE 1	;����� ����� ����� ��������� �� �������� ��� ������� (N*50 ��) 

Code:	.BYTE 1	;��� ���� - $55,$AA,$99,$66,$33

Flag_N2:	.BYTE 1	;���� ��������� ��� ���� �������� N2 - $22,$A2,$62,$00
Flag_A:	.BYTE 1	;���� ��������� ��� ���� �� ���� � - $30,$B0,$00
Flag_N1:	.BYTE 1	;���� ��������� ��� ���� �������� N1 - $21,$A1,$61,$00
Flag_B:	.BYTE 1	;���� ��������� ��� ���� �� ���� � - $31...39,$B1...$B9,$00

Flag_R:	.BYTE 1	;����� ��������� �������� N2 

;***************************************************************************************
