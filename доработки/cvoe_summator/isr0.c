#include <avr/io.h>
#include <avr/interrupt.h>
//***********************************************************************
extern unsigned int crc16_modbus(unsigned char *dat,unsigned char len);
extern void Enable_TX(void);     //разрешить передачу
extern volatile unsigned char time_a;  // время блокировки поля А
extern volatile unsigned char time_d;   // время антидребезга датчика.
extern volatile unsigned char t2_time;  // расширитель таймера;
extern volatile unsigned char code; //тип игры.
extern volatile unsigned char Buf_out[8]; // буфер передатчика
volatile unsigned char w_cont; //количество передаваем байт.
void Enable_T2_StopInt(void);  // подпрограмма включения таймера 2 и блокировка датчиков
//***********************************************************************
extern struct
{
volatile unsigned char tb:1; //флаг блокировки
} flag_tim2;
//**************************************************************************
union 
{
	volatile unsigned int crc16;
	volatile unsigned char crc8[2];
}crc;
//***********************************************************************
volatile unsigned int tim1; // значение таймера.
//***********************************************************************
ISR(INT1_vect) // прерывание по int1 удар 0 ракеткой.
{
	switch(code)
	{
		case 0x33:  // тест датчиков и ракеток
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
ISR(INT0_vect) // прерывание по int0
{
	switch(code)
	{
		case 0x33:  // тест датчиков и ракеток
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

// обработка датчиков 1,6,7
ISR(PCINT0_vect)
{
	unsigned char pin;
	pin=PINB; // считываем порт.
	pin=(~pin&0x07);
	switch (code)
	{
		case 0x33: // тест датчиков и ракеток
		{
			switch (pin)
			{
				case 0x01: // сработал 1 датчик
				{
					Buf_out[2]=0x31;
					Buf_out[5]=0x8F;
					Buf_out[6]=0x71;
					break;
				}	
				case 0x02: // сработал 6 датчик
				{
					
					Buf_out[2]=0x36;
					Buf_out[5]=0x4E;
					Buf_out[6]=0xC0;
					break;
				}
				case 0x04: // сработал 7 датчик.
				{
					Buf_out[2]=0x37;
					Buf_out[5]=0x8E;
					Buf_out[6]=0x91;
					break;
				}
				default:
				{
					// сработало несколько датчиков. пока выходим
					return;
				}
			}
		}
	}
	Enable_TX();
	// отключаем прерывания время антидребезга
	Enable_T2_StopInt();
}
/// обработка датчиков 2,5,8
ISR(PCINT1_vect)
{
	unsigned char pin;
	pin=PINC; // считываем порт.
	pin=(~pin&0x07);
	switch (code)
	{
		case 0x33: // тест датчиков и ракеток
		{
			switch (pin)
			{
				case 0x01: // сработал 2 датчик
				{
					Buf_out[2]=0x32;
					Buf_out[5]=0x8F;
					Buf_out[6]=0x81;
					break;
				}	
				case 0x02: // сработал 5 датчик
				{
					
					Buf_out[5]=0x4E;
					Buf_out[6]=0x30;
					Buf_out[2]=0x35;
					break;
				}
				case 0x04: // сработал 8 датчик.
				{
					Buf_out[2]=0x38;
					Buf_out[5]=0x8D;
					Buf_out[6]=0xA1;
					break;
				}
				default:
				{
					// сработало несколько датчиков. пока выходим
					return;
				}
			}
		}
	}
	Enable_TX();
	// отключаем прерывания время антидребезга
	Enable_T2_StopInt();
}
// обработка датчиков 3,4,9
ISR(PCINT2_vect)
{
		unsigned char pin;
	pin=PIND; // считываем порт.
	pin=(~pin&0x70);
	pin>>=4;
	switch (code)
	{
		case 0x33: // тест датчиков и ракеток
		{
			switch (pin)
			{
				case 0x01: // сработал 3 датчик
				{
					Buf_out[2]=0x33;
					Buf_out[5]=0x4F;
					Buf_out[6]=0xD0;
					break;
				}	
				case 0x02: // сработал 4 датчик
				{
					Buf_out[2]=0x34;
					Buf_out[5]=0x8E;
					Buf_out[6]=0x61;
					break;
				}
				case 0x04: // сработал 9 датчик.
				{
					Buf_out[2]=0x39;
					Buf_out[5]=0x4D;
					Buf_out[6]=0xF0;
					break;
				}
				default:
				{
					// сработало несколько датчиков. пока выходим
					return;
				}
			}
		}
	}
	Enable_TX();
// отключаем прерывания время антидребезга
	Enable_T2_StopInt();
}

void Enable_T2_StopInt(void) // запускаем таймер 2 и отключаем все датчики на время антидребезга.
{
	TIMSK2=0; 
	GTCCR=0x02;
	EIMSK=0;
	PCICR=0;
	TCNT2=0;
	TIMSK2=0x02;
	TCCR2B=0x07;
}
