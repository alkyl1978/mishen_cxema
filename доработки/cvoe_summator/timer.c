// timer.h
#include <avr/io.h>
#include <avr/interrupt.h>

//**************************************************************************
extern volatile unsigned char code;	        //��� ����
extern void Init_dat_r33(void);
//**************************************************************************
struct
{
volatile unsigned char tb:1; //���� ����������
} flag_tim2;
//*********************************************************************
ISR(TIMER2_COMPA_vect)
{
switch (code)
{
	case 0x33:
	{
		Init_dat_r33();
		break;
	}
	case 0x99: // ���� ���������� ���������.
	{
		EIMSK=(1<<INT0);
		EIFR=0;	
		TCCR2B=0; //���� ������
		break;
	}
}	
}

