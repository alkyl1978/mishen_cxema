#include <avr/io.h>
#include <avr/interrupt.h>
//*************************************************
extern void Init_uart(void); 	 			// ��������� UARTA
extern void Enable_TX(void);     			//��������� ��������
extern void Enable_RX(void);     			// ��������� �����
extern void init_pr(void);
extern void Init_dat_r33(void); 			// ��������� ���������� �� ������ � ������ �����
extern volatile unsigned char Buf_out[8];	// ����� �����������
extern volatile unsigned char Buf_ok[4];    // ����� �������� ������
extern volatile unsigned char w_cont;		// ��������� ������������ ������.
//********************************************************************
extern struct
{
	unsigned char tx_ok:1;
	unsigned char rx_ok:1;
} flag;
//*********************************************************************
// ���������� ����������
volatile unsigned char code=0x33;	    //��� ����
unsigned char time_d=0x0b;				// ����� ������������
unsigned int  time_t=0x02ee;			// ���� ����
unsigned char time_p=0x23;				// ����� �����

//***********************************************************************
#define In_sleep PORTB4  // ��������� ���������
//***********************************************************************
extern unsigned int crc16_modbus( unsigned char *buf,unsigned char len);
extern void crc16_modbus1(unsigned int *crc, unsigned char dat);
//********************************************************************
int main(void)
{
	init_pr();		// ��������� ��������� ������ � ��������
    Init_uart(); 	// ����������� ��������.
	Enable_RX();  	//��������� �����
	sei(); 			// ��������� ����������.
	while (1) 		// ����������� ����. �������� ���� ���������.
	{
	
		if(flag.rx_ok)
		{
			code=Buf_ok[0];         // ������������� ��� ����
			time_d=Buf_ok[1];		// ����� ������������
			time_t=Buf_ok[2];		// ���� ����
			time_p=Buf_ok[3];		// ����� �����
			flag.rx_ok=0; 			//���������� ���� ������ ������
			PCICR=0;                //��������� ���������� �� ���������.
			PCIFR=0;				// ���������� �����
			EIMSK=0;				// ��������� ���������� �� 0 �������
			EIFR=0;					//���������� �����
			switch (code) 			// ����������� ��������� �������� ����������.
			{
				case 0x33:
				{
					// ��������� ��������� ���� ���� ���� � ����� ��������.
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
				case 0x99: //���� ���������� ���������
				{
				// ������ ��������� ��������� ����������
					EIMSK=(1<<INT0); //�������� ������� ������
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
