#include <avr\io.h>
#include <util\delay.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <avr/eeprom.h>

//*******************************************************************
// �����������
////////////////////////////////////////////////////////////////////
#define data PORTB0 // ���� ���������
#define clk  PORTB1   // ���� ���������
#define dr1  PORTA0   // ������ �������� ������
#define cs   PORTB2       // ���������� ������������
#define ce   PORTA7        // ��������� �����������
#define pwr_up PORTA3      // ������ ����� �����������������.
#define delay_ms _delay_ms
#define SetBit(port,bit) port|=(1<<bit)
#define ClsBit(port,bit) port&=~(1<<bit)
#define cs0  ClsBit(PORTB,cs)
#define cs1  SetBit(PORTB,cs)
#define ce0  ClsBit(PORTA,ce)
#define ce1  SetBit(PORTA,ce)
#define cls0 ClsBit(PORTB,clk)
#define cls1 SetBit(PORTB,clk)
#define dat0 ClsBit(PORTB,data)
#define dat1 SetBit(PORTB,data)
#define wdr()   __asm__ ("wdr")
#define nop()   __asm__ ("nop")
#define adr 0xaa

//************************************************************************
void PutChar(unsigned char cha);
void EnableTX(void);
void LoadConf(void);
//*******************************************************************************
// ���������� ����������
//********************************************************************************
volatile unsigned char id_yd; // ����� �����
volatile unsigned char flag;  // ���� ������������ �������
//***************************************************************************************
//************************************************************************************
// ������� ���� ������������
//*************************************************************************************
                           
int main(void)
{
OSCCAL=eeprom_read_byte(0x00);        // ��������� ����������.
PRR=0x0b;           // ��������� ������ ����������.
DDRB=0b00000111;    //  ����������� ���� �
PORTB=0b00000000;   // ���������� � ����
DDRA= 0b10011000;    // ����������� ���� �
PORTA=0b00010000;   // ��������� ����������������
DIDR0=0b00000110;   // ��������� �������� ����� �� �����������
// ���������� ������
WDTCSR=0x18;        // ����������� ���������� ������
WDTCSR=0x29;        // ���������� ������ ����� ����� 8 ������.
// ��������� ����������
flag=0;
set_sleep_mode(SLEEP_MODE_IDLE);
sleep_enable();
id_yd=0;
while (1)
      {  
		 ClsBit(PORTA,pwr_up); // ��������� ��������
		 flag=0;
		 delay_ms(20);
		 ACSR=0b00011011; // �������� ����������.
		 delay_ms(10);
		 sei(); // ��������� ���������� 
         while(!flag)  	sleep_cpu();  //���� ����� � �������� ��������� 
		 // ���� ��������� �������� ������
		 // 
		 cli(); // ��������� ����������.
		 SetBit(PORTA,pwr_up);  // �������� ��������
		 delay_ms(10);       	// �������� 10 ms.
		 LoadConf();         	// ��������� ������������.  
		 // �������� �����.      
         PutChar(0xe7);
         PutChar(adr);  
         PutChar(id_yd);      
		 ce0; // ������������ ��������    
         delay_ms(9); // ������ �������� �� ������� 1 ms.
		 wdr(); // ���������� ���������� ������.
      }
}

//**********************************************************************
void LoadConf(void)
{
 ce0;   // ��������� ��������
 cs1;     // �������� ����� ������������
 EnableTX();
 // �������� ������������.
 PutChar(0x08);
 PutChar(0x08);
 PutChar(0);
 PutChar(0);
 PutChar(0);
 PutChar(0xe7);
 PutChar(0xbb);
 PutChar(0);
 PutChar(0);
 PutChar(0);
 PutChar(0xe7);
 PutChar(adr);
 PutChar(0x43);
 PutChar(0x4e);
 PutChar(0x20);
 cs0;  				//��������� ����� ������������
 ce1;               // �������� ��������
 delay_ms(1);       // ������ �������� �� ������� 1 ms.
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
void EnableTX(void)
{
DDRB|=0x03; // ����������� ���� �� ��������.
return;
}

//***********************************************************************
// ���������� �� �����������
//***********************************************************************
ISR (ANA_COMP_vect)
{
    wdr();	
	id_yd++;						//���������� ���������� ������
    flag=1; 						// ������������� ���� �����.
    ACSR=0x80; 					// ��������� ���������� ������ �� �����.
}
