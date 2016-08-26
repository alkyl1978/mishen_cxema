#include <avr\io.h>
#include <util\delay.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <avr/eeprom.h>

//*******************************************************************
// определения
////////////////////////////////////////////////////////////////////
#define data PORTB0 // дата приемника
#define clk  PORTB1   // клок приемника
#define dr1  PORTA0   // сигнал принятых данных
#define cs   PORTB2       // разрешения конфигурации
#define ce   PORTA7        // включение передатчика
#define pwr_up PORTA3      // спящий режим приемопередатчика.
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
// глобальные переменные
//********************************************************************************
volatile unsigned char id_yd; // номер удара
volatile unsigned char flag;  // флаг срабатывания датчика
//***************************************************************************************
//************************************************************************************
// главный цикл подпрограммы
//*************************************************************************************
                           
int main(void)
{
OSCCAL=eeprom_read_byte(0x00);        // Настройка генератора.
PRR=0x0b;           // выключаем лишние устройства.
DDRB=0b00000111;    //  настраиваем порт в
PORTB=0b00000000;   // сбрасываем в ноль
DDRA= 0b10011000;    // настраиваем порт А
PORTA=0b00010000;   // выключаем приемопередатчик
DIDR0=0b00000110;   // отключаем цифровые входы от компаратора
// сторожевой таймер
WDTCSR=0x18;        // настраиваем сторожевой таймер
WDTCSR=0x29;        // сторожевой таймер сброс через 8 секунд.
// настройка переменных
flag=0;
set_sleep_mode(SLEEP_MODE_IDLE);
sleep_enable();
id_yd=0;
while (1)
      {  
		 ClsBit(PORTA,pwr_up); // выключаем приемник
		 flag=0;
		 delay_ms(20);
		 ACSR=0b00011011; // включаем компаратор.
		 delay_ms(10);
		 sei(); // разрешаем прерывания 
         while(!flag)  	sleep_cpu();  //ждем удара и усыпляем контролер 
		 // удар произошел передаем данные
		 // 
		 cli(); // запрещаем прерывания.
		 SetBit(PORTA,pwr_up);  // включаем приемник
		 delay_ms(10);       	// задержка 10 ms.
		 LoadConf();         	// загружаем конфигурацию.  
		 // передаем пакет.      
         PutChar(0xe7);
         PutChar(adr);  
         PutChar(id_yd);      
		 ce0; // активизируем передачу    
         delay_ms(9); // делаем выдержку по времени 1 ms.
		 wdr(); // сбрасываем сторожевой таймер.
      }
}

//**********************************************************************
void LoadConf(void)
{
 ce0;   // выключаем приемник
 cs1;     // включаем режим конфигурации
 EnableTX();
 // передаем конфигурацию.
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
 cs0;  				//выключаем режим конфигурации
 ce1;               // включаем приемник
 delay_ms(1);       // делаем выдержку по времени 1 ms.
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
DDRB|=0x03; // переключаем порт на передачу.
return;
}

//***********************************************************************
// прерывание от компаратора
//***********************************************************************
ISR (ANA_COMP_vect)
{
    wdr();	
	id_yd++;						//сбрасываем сторожевой таймер
    flag=1; 						// устанавливаем флаг удара.
    ACSR=0x80; 					// выключаем компаратор защита от помех.
}
