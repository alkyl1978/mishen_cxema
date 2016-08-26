#include <avr\io.h>
#include <util\delay.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <avr\eeprom.h>

//*******************************************************************
// �����������
////////////////////////////////////////////////////////////////////
#define data PORTD0 // ���� ���������
#define clk  PORTD1   // ���� ���������
#define dr1  PORTA1   // ������ �������� ������
#define data2  PORTD2  // ���� ������� ������
#define clk2   PORTD3  // ���� ������� ������
#define dr2    PORTD4   // ������ �������� ������ ������� ������
#define cs   PORTA0       // ���������� ������������
#define ce   PORTD5        // ��������� �����������
#define pwr_up PORTD6      // ������ ����� �����������������.
#define RA1   PORTB0        // ������ ��� ���� ������ ��������
#define RA2   PORTB1         // ������ ��� ���� ������ ��������
#define dr1_in PINA1
#define dr2_in PIND4
#define In_Sleep PORTB2
#define delay_ms _delay_ms
#define SetBit(port,bit) port|=(1<<bit)
#define ClsBit(port,bit) port&=~(1<<bit)
#define RA10  ClsBit(PORTB,RA1)
#define RA11  SetBit(PORTB,RA1)
#define RA20  ClsBit(PORTB,RA2)
#define RA21  SetBit(PORTB,RA2)
#define cs0  ClsBit(PORTA,cs)
#define cs1  SetBit(PORTA,cs)
#define ce0  ClsBit(PORTD,ce)
#define ce1  SetBit(PORTD,ce)
#define cls0 ClsBit(PORTD,clk)
#define cls1 SetBit(PORTD,clk)
#define dat0 ClsBit(PORTD,data)
#define dat1 SetBit(PORTD,data)
#define cls20 ClsBit(PORTD,clk2)
#define cls21 SetBit(PORTD,clk2)
#define dat20 ClsBit(PORTD,data2)
#define dat21 SetBit(PORTD,data2)
#define wdr()   __asm__ ("wdr")
#define nop()   __asm__ ("nop")

//************************************************************************
void PutChar(unsigned char cha);
void LoadConfRX(void);
void LoadConfTX(void);
//*******************************************************************************
// ���������� ����������
//*******************************************************************************

//****************************************************************************
int main(void)
{
unsigned char i,tmp;
	OSCCAL=eeprom_read_byte(0);
	// ������������� �����
	DDRA= (1<<cs)|(0<<dr1); // ������������� ����� �
	DDRB= (1<<RA1)|(1<<RA2); // ������������� ����� �
	DDRD= (1<<data)|(1<<clk)|(1<<ce)|(1<<clk2)|(1<<pwr_up)|(0<<dr2); // ����������� ����� �
	PORTA=(0<<cs);
	PORTB=0b11111111;
	PORTD=0b00011111;
	//*********************************************************************
	SetBit(PORTD,pwr_up); // �������� ��������
	delay_ms(20); // �������� ��� ���������
	LoadConfRX();
	while(1)
	{
   		RA11;
   		RA21;
		delay_ms(1);
   		while (PINA & (1<<dr1_in)) // ��������� �������� ������ �� ������� ������
   		{
		   RA10;
		   cls0;
		   nop();
		   cls1;
		   nop();
		   cls0;
   		} 
		  		
		while (PINA & (1<<dr2_in)) // ��������� �������� ������ �� ������� ������
   		{
		   RA20;
		   cls0;
		   nop();
		   cls1;
		   nop();
		   cls0;
   		} 
	}
}

//**********************************************************************
void LoadConfRX(void)
{
	DDRD|=(1<<data)|(1<<data2); // ����������� ����� �� ��������
	ce0;
	cs1;     
 	// �������� ������������.
	PutChar(0x08);
	PutChar(0x08);
	PutChar(0);
	PutChar(0);
	PutChar(0);
	PutChar(0xe7); //adr_h2
 	PutChar(0xbb); //adr_l2
 	PutChar(0);
 	PutChar(0);
 	PutChar(0);
 	PutChar(0xe7); //(adr_h1);
 	PutChar(0xaa);  //(adr_l1);
 	PutChar(0x43);
 	PutChar(0xce);
 	PutChar(0x21);
 	cs0;
 	nop();
 	ce1;                 // �������� ��������
	DDRD&=0xfa; // ����������� ����� �� �����
 	delay_ms(1);        // ������ �������� �� ������� 5 ms.
}

//**********************************************************************

void PutChar(unsigned char cha)
{
 unsigned char i;
 for(i=0;i<8;i++)
 {            
    cls0;  
    if(cha&0x80) dat1;
    else dat0; 
    cha<<=1;
    cls1;
 } 
 cls0;
 return;
}
//***********************************************************************

