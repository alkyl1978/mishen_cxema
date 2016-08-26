#include <avr\io.h>
#include <util\delay.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <avr\eeprom.h>

//*******************************************************************
// определения
////////////////////////////////////////////////////////////////////
#define data PORTD0 // дата приемника
#define clk  PORTD1   // клок приемника
#define dr1  PORTA1   // сигнал принятых данных
#define data2  PORTD2  // дата второго канала
#define clk2   PORTD3  // клок второго канала
#define dr2    PORTD4   // сигнал принятых данных второго канала
#define cs   PORTA0       // разрешения конфигурации
#define ce   PORTD5        // включение передатчика
#define pwr_up PORTD6      // спящий режим приемопередатчика.
#define RA1   PORTB0        // сигнал был удар первой ракеткой
#define RA2   PORTB1         // сигнал был удар второй ракеткой
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
// глобальные переменные
//*******************************************************************************

//****************************************************************************
int main(void)
{
unsigned char i,tmp;
	OSCCAL=eeprom_read_byte(0);
	// конфигурируем порты
	DDRA= (1<<cs)|(0<<dr1); // КОНФИГУРИРУЕМ ПОРТЫ А
	DDRB= (1<<RA1)|(1<<RA2); // конфигурируем порты В
	DDRD= (1<<data)|(1<<clk)|(1<<ce)|(1<<clk2)|(1<<pwr_up)|(0<<dr2); // конфигуриум порты Д
	PORTA=(0<<cs);
	PORTB=0b11111111;
	PORTD=0b00011111;
	//*********************************************************************
	SetBit(PORTD,pwr_up); // включаем приемник
	delay_ms(20); // задержка при включении
	LoadConfRX();
	while(1)
	{
   		RA11;
   		RA21;
		delay_ms(1);
   		while (PINA & (1<<dr1_in)) // скидываем принятые данные по первому каналу
   		{
		   RA10;
		   cls0;
		   nop();
		   cls1;
		   nop();
		   cls0;
   		} 
		  		
		while (PINA & (1<<dr2_in)) // скидываем принятые данные по второму каналу
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
	DDRD|=(1<<data)|(1<<data2); // переключаем порты на передачу
	ce0;
	cs1;     
 	// передаем конфигурацию.
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
 	ce1;                 // включаем приемник
	DDRD&=0xfa; // переключаем порты на прием
 	delay_ms(1);        // делаем выдержку по времени 5 ms.
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

