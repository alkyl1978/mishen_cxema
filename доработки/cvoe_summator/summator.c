#include <avr/io.h>
#include <avr/interrupt.h>
//*************************************************
extern void Init_uart(void); 	 			// настройка UARTA
extern void Enable_TX(void);     			//разрешить передачу
extern void Enable_RX(void);     			// разрешить прием
extern void init_pr(void);
extern void Init_dat_r33(void); 			// настройка прерываний на работу в режиме теста
extern volatile unsigned char Buf_out[8];	// буфер передатчика
extern volatile unsigned char Buf_ok[4];    // буфер принятых данных
extern volatile unsigned char w_cont;		// указатель записываемых данных.
//********************************************************************
extern struct
{
	unsigned char tx_ok:1;
	unsigned char rx_ok:1;
} flag;
//*********************************************************************
// глобальные переменные
volatile unsigned char code=0x33;	    //Тип игры
unsigned char time_d=0x0b;				// время антидребезга
unsigned int  time_t=0x02ee;			// темп игры
unsigned char time_p=0x23;				// время паузы

//***********************************************************************
#define In_sleep PORTB4  // включение детектора
//***********************************************************************
extern unsigned int crc16_modbus( unsigned char *buf,unsigned char len);
extern void crc16_modbus1(unsigned int *crc, unsigned char dat);
//********************************************************************
int main(void)
{
	init_pr();		// начальная настройка портов и таймеров
    Init_uart(); 	// Настраиваем приемник.
	Enable_RX();  	//разрешаем прием
	sei(); 			// разрешаем прерывания.
	while (1) 		// бесконечный цикл. основной цикл программы.
	{
	
		if(flag.rx_ok)
		{
			code=Buf_ok[0];         // устанавливаем тип игры
			time_d=Buf_ok[1];		// время антидребезга
			time_t=Buf_ok[2];		// темп игры
			time_p=Buf_ok[3];		// время паузы
			flag.rx_ok=0; 			//сбрасываем флаг приема пакета
			PCICR=0;                //запрещаем прерывания по изменению.
			PCIFR=0;				// сбрасываем флаги
			EIMSK=0;				// отключаем прерывания по 0 датчику
			EIFR=0;					//сбрасываем флаги
			switch (code) 			// настраиваем начальные значения прерываний.
			{
				case 0x33:
				{
					// начальная установка игра пинг понг и теста датчиков.
					Init_dat_r33();
					break;
				}
				case 0x55:
				{
					break;
				}
				case 0x66:
				{
					break;
				}
				case 0x99: //игра пассивными ракетками
				{
				// делаем начальную установку параметров
					EIMSK=(1<<INT0); //включаем нулевой датчик
					EIFR=0;
					Buf_out[0]=0x99;
					break;
				}
				case 0xAA:
				{
					break;
				}
			
			} //switch
		}//if
	}
}
