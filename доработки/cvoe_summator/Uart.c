#include <avr/io.h>
#include <avr/interrupt.h>
//***********************************************************************
union 
{
	volatile unsigned int crc16;
	volatile unsigned char crc8[2];
}crc;
struct
{
	unsigned char tx_ok:1;
	unsigned char rx_ok:1;
} flag;
extern void crc16_modbus1(unsigned int *crc, unsigned char dat);
//**********************************************************************
void Init_uart(void); // ��������� UARTA
void Enable_TX(void);     //��������� ��������
void Enable_RX(void);     // ��������� �����
//**********************************************************************
unsigned char Buf_in[8]; //	����� ����������� ������ �� ������ USART
unsigned char rr; // ��������� ����������� ������
volatile unsigned char Buf_out[8]; // ����� �����������
unsigned char ww; // ��������� ������������ ������
volatile unsigned char w_cont; //���������� ���������� ����.
volatile unsigned char Buf_ok[4];
//**********************************************************************

void Init_uart(void)
{
UBRR0H=0x00;		//�������� 9600
UBRR0L=0x19;
UCSR0A=0x40; //�������� �����
UCSR0C=(1<<USBS0)|(3<<UCSZ00); //8 - ��� ������, ���� ���� ���
rr=0;
ww=0;
crc.crc16=0xffff;
w_cont=0;
}
//************************************************************************
void Enable_TX(void)
{
	UCSR0B|=(1<<TXEN0)|(1<<UDRIE0)|(1<<TXCIE0);
	ww=0;
}
//************************************************************************
void Enable_RX(void)
{
	UCSR0B|=(1<<RXEN0)|(1<<RXCIE0);
	crc.crc16=0xffff;
}
//************************************************************************
ISR(USART_RX_vect) // ����� ��������
{	
	Buf_in[rr]=UDR0; // ���������� �������� ������.
	if(Buf_in[0]!=0xCC) // ���� ������������
	{
	// ������������� ��������� ��������
		crc.crc16=0xffff;
		rr=0;
		Buf_in[0]=0x00;
		return;
	}
	if(rr<=5) // ��������� ����� � ������� ����������� �����
	{
		crc16_modbus1((unsigned int *)&crc.crc16,(unsigned char)Buf_in[rr]);
	}
	if(rr==7) // ������� ��
	{
		crc.crc8[0]^=Buf_in[7];
		crc.crc8[1]^=Buf_in[6];
		if(crc.crc16==0)
		{
			unsigned char i;
			for(i=0;i<=3; i++) Buf_ok[i]=Buf_in[i+2];
		}
		flag.rx_ok=1; // ������������� ���� �������� ������.
		crc.crc16=0xffff; // ������������� ��������� ��������
		rr=0;
		return;
	}
	rr++; // ������� ���������� �������� ����

}
//************************************************************************
ISR(USART_UDRE_vect) // ����� ������ ����
{
	if(ww>=w_cont)
	{
		UCSR0B&=(0xfe<<UDRIE0); // ��������� ���������� �� ����������� ������. 
		return;
	}
	UDR0=Buf_out[ww]; // �������� ���� ����.
	if(ww!=w_cont) ww++; //����������� ���������� ���������� ����
}
//*************************************************************************
ISR (USART_TX_vect) // �������� ���������.
{
	if(ww>=w_cont)
	{	
		return; // ��� ����� ��������
	}
	UDR0=Buf_out[ww]; // �������� ���� ����.
	if(ww!=w_cont)ww++; // ����������� ���������� ���������� ����
}
//**************************************************************************
