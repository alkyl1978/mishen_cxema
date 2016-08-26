//crc.c
#include <avr/io.h>
//***********************************************************************************
unsigned int crc16_modbus(unsigned char *dat,unsigned char len);
void crc16_modbus1(unsigned int *crc, unsigned char dat);
//**********************************************************************************
void crc16_modbus1(unsigned int *crc, unsigned char dat)
{
	unsigned int temp;
	unsigned char i;
	temp=dat;
	temp&=0x00ff;
	*crc^=temp;
	for (i=0; i<8; i++)
	{
		temp=*crc;
		*crc>>=1;
		if(temp & 0x0001) *crc^=0xa001;
	}
}
//**********************************************************************************
unsigned int crc16_modbus(unsigned char *buf,unsigned char len)
{
	unsigned int crc=0xffff,temp;
	unsigned char pos,i;
	for (pos=0; pos<=len; pos++)
	{
		temp=buf[pos];
		temp&=0x00ff;
		crc ^=temp;
		for (i=0; i<8; i++)
		{
			temp=crc;
			crc>>=1;
			if(temp & 0x0001) crc^=0xa001;
		}
	}
	return crc;
}
