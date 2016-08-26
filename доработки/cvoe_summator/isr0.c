#include <avr/io.h>
#include <avr/interrupt.h>
//***********************************************************************
extern unsigned int crc16_modbus(unsigned char *dat,unsigned char len);
extern void Enable_TX(void);     //��������� ��������
extern volatile unsigned char time_a;  // ����� ���������� ���� �
extern volatile unsigned char time_d;   // ����� ������������ �������.
extern volatile unsigned char t2_time;  // ����������� �������;
extern volatile unsigned char code; //��� ����.
extern volatile unsigned char Buf_out[8]; // ����� �����������
volatile unsigned char w_cont; //���������� ���������� ����.
void Enable_T2_StopInt(void);  // ������������ ��������� ������� 2 � ���������� ��������
//***********************************************************************
extern struct
{
volatile unsigned char tb:1; //���� ����������
} flag_tim2;
//**************************************************************************
union 
{
	volatile unsigned int crc16;
	volatile unsigned char crc8[2];
}crc;
//***********************************************************************
volatile unsigned int tim1; // �������� �������.
//***********************************************************************
ISR(INT1_vect) // ���������� �� int1 ���� 0 ��������.
{
	switch(code)
	{
		case 0x33:  // ���� �������� � �������
		{
			Buf_out[2]=0x21;	
			Buf_out[5]=0x4A;
			Buf_out[6]=0x70;
			Enable_TX();
			break;
		}
	}
	Enable_T2_StopInt();
}
//************************************************************************
ISR(INT0_vect) // ���������� �� int0
{
	switch(code)
	{
		case 0x33:  // ���� �������� � �������
		{
			Buf_out[2]=0x30;	
			Buf_out[5]=0x4f;
			Buf_out[6]=0x20;
			break;
		}
		case 0x99:
		{
			Buf_out[2]=0x30;
			Buf_out[5]=0x57;
			Buf_out[6]=0x38;
			break;
		}
	}
	Enable_TX();
	Enable_T2_StopInt();
}

// ��������� �������� 1,6,7
ISR(PCINT0_vect)
{
	unsigned char pin;
	pin=PINB; // ��������� ����.
	pin=(~pin&0x07);
	switch (code)
	{
		case 0x33: // ���� �������� � �������
		{
			switch (pin)
			{
				case 0x01: // �������� 1 ������
				{
					Buf_out[2]=0x31;
					Buf_out[5]=0x8F;
					Buf_out[6]=0x71;
					break;
				}	
				case 0x02: // �������� 6 ������
				{
					
					Buf_out[2]=0x36;
					Buf_out[5]=0x4E;
					Buf_out[6]=0xC0;
					break;
				}
				case 0x04: // �������� 7 ������.
				{
					Buf_out[2]=0x37;
					Buf_out[5]=0x8E;
					Buf_out[6]=0x91;
					break;
				}
				default:
				{
					// ��������� ��������� ��������. ���� �������
					return;
				}
			}
		}
	}
	Enable_TX();
	// ��������� ���������� ����� ������������
	Enable_T2_StopInt();
}
/// ��������� �������� 2,5,8
ISR(PCINT1_vect)
{
	unsigned char pin;
	pin=PINC; // ��������� ����.
	pin=(~pin&0x07);
	switch (code)
	{
		case 0x33: // ���� �������� � �������
		{
			switch (pin)
			{
				case 0x01: // �������� 2 ������
				{
					Buf_out[2]=0x32;
					Buf_out[5]=0x8F;
					Buf_out[6]=0x81;
					break;
				}	
				case 0x02: // �������� 5 ������
				{
					
					Buf_out[5]=0x4E;
					Buf_out[6]=0x30;
					Buf_out[2]=0x35;
					break;
				}
				case 0x04: // �������� 8 ������.
				{
					Buf_out[2]=0x38;
					Buf_out[5]=0x8D;
					Buf_out[6]=0xA1;
					break;
				}
				default:
				{
					// ��������� ��������� ��������. ���� �������
					return;
				}
			}
		}
	}
	Enable_TX();
	// ��������� ���������� ����� ������������
	Enable_T2_StopInt();
}
// ��������� �������� 3,4,9
ISR(PCINT2_vect)
{
		unsigned char pin;
	pin=PIND; // ��������� ����.
	pin=(~pin&0x70);
	pin>>=4;
	switch (code)
	{
		case 0x33: // ���� �������� � �������
		{
			switch (pin)
			{
				case 0x01: // �������� 3 ������
				{
					Buf_out[2]=0x33;
					Buf_out[5]=0x4F;
					Buf_out[6]=0xD0;
					break;
				}	
				case 0x02: // �������� 4 ������
				{
					Buf_out[2]=0x34;
					Buf_out[5]=0x8E;
					Buf_out[6]=0x61;
					break;
				}
				case 0x04: // �������� 9 ������.
				{
					Buf_out[2]=0x39;
					Buf_out[5]=0x4D;
					Buf_out[6]=0xF0;
					break;
				}
				default:
				{
					// ��������� ��������� ��������. ���� �������
					return;
				}
			}
		}
	}
	Enable_TX();
// ��������� ���������� ����� ������������
	Enable_T2_StopInt();
}

void Enable_T2_StopInt(void) // ��������� ������ 2 � ��������� ��� ������� �� ����� ������������.
{
	TIMSK2=0; 
	GTCCR=0x02;
	EIMSK=0;
	PCICR=0;
	TCNT2=0;
	TIMSK2=0x02;
	TCCR2B=0x07;
}
