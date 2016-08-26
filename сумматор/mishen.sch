EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:stm32
LIBS:мишень-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "noname.sch"
Date "25 sep 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Bus Line
	6000 5200 6000 650 
$Comp
L GND #PWR01
U 1 1 5234A83A
P 3400 4850
F 0 "#PWR01" H 3400 4850 30  0001 C CNN
F 1 "GND" H 3400 4780 30  0001 C CNN
F 2 "" H 3400 4850 60  0000 C CNN
F 3 "" H 3400 4850 60  0000 C CNN
	1    3400 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4850 3400 4700
Wire Wire Line
	3400 4700 4450 4700
Wire Wire Line
	3850 4600 3850 4700
Connection ~ 3850 4700
Wire Wire Line
	4000 4600 4000 4700
Connection ~ 4000 4700
Connection ~ 4150 4700
Wire Wire Line
	4450 4700 4450 4600
Wire Wire Line
	4150 4600 4150 4700
NoConn ~ 2650 2900
$Comp
L STM32F050C6 U1
U 1 1 52355AD2
P 3850 2850
F 0 "U1" H 2350 4750 60  0000 C CNN
F 1 "STM32F051С8" H 5100 950 60  0000 C CNN
F 2 "qfn48" H 3850 2850 40  0000 C CIN
F 3 "" H 3850 2850 60  0000 C CNN
	1    3850 2850
	1    0    0    -1  
$EndComp
Entry Wire Line
	4050 650  4150 750 
Entry Wire Line
	3750 650  3850 750 
Entry Wire Line
	3600 650  3700 750 
Wire Wire Line
	4150 750  4150 850 
Wire Wire Line
	3850 750  3850 850 
Wire Wire Line
	3700 750  3700 850 
Text Label 3700 850  2    60   ~ 0
vdd
Text Label 3850 850  0    60   ~ 0
vdd
Text Label 4150 850  0    60   ~ 0
vdda
Entry Wire Line
	1700 1150 1800 1250
Entry Wire Line
	1700 1600 1800 1700
Wire Wire Line
	1800 1250 2150 1250
Wire Wire Line
	1800 1700 2150 1700
Text Label 1900 1250 0    60   ~ 0
RESET
Text Label 1900 1700 0    60   ~ 0
VDD
Wire Bus Line
	3100 5200 6000 5200
Entry Wire Line
	4150 5100 4250 5200
Entry Wire Line
	3700 5100 3800 5200
Wire Wire Line
	3700 4850 3700 5100
Wire Wire Line
	4150 4850 4150 5100
Entry Wire Line
	3850 5100 3950 5200
Wire Wire Line
	3850 4850 3850 5100
Text Label 3700 4900 3    60   ~ 0
vss
Text Label 3850 4900 3    60   ~ 0
vss
Text Label 4150 4900 3    60   ~ 0
vss
Entry Wire Line
	5900 1350 6000 1250
Entry Wire Line
	5900 1450 6000 1350
Entry Wire Line
	5900 1550 6000 1450
Entry Wire Line
	5900 1650 6000 1550
Wire Wire Line
	5900 1350 5550 1350
Wire Wire Line
	5900 1450 5550 1450
Wire Wire Line
	5900 1550 5550 1550
Text Label 5600 1350 0    60   ~ 0
DAT0
Text Label 5600 1450 0    60   ~ 0
DAT1
Text Label 5600 1550 0    60   ~ 0
DAT2
Wire Wire Line
	5550 1650 5900 1650
Text Label 5600 1650 0    60   ~ 0
DAT3
Entry Wire Line
	5900 1750 6000 1650
Entry Wire Line
	5900 1850 6000 1750
Entry Wire Line
	5900 1950 6000 1850
Wire Wire Line
	5550 1750 5900 1750
Wire Wire Line
	5550 1850 5900 1850
Wire Wire Line
	5550 1950 5900 1950
Text Label 5600 1750 0    60   ~ 0
SCK
Text Label 5600 1850 0    60   ~ 0
MISO
Text Label 5600 1950 0    60   ~ 0
MOSI
Entry Wire Line
	5900 2950 6000 2850
Entry Wire Line
	5900 3050 6000 2950
Entry Wire Line
	5900 4350 6000 4250
Entry Wire Line
	5900 4450 6000 4350
Wire Wire Line
	5550 2950 5900 2950
Wire Wire Line
	5550 3050 5900 3050
Wire Wire Line
	5550 4350 5900 4350
Wire Wire Line
	5550 4450 5900 4450
Text Label 5600 2950 0    60   ~ 0
DAT4
Text Label 5600 3050 0    60   ~ 0
DAT5
Text Label 5600 4350 0    60   ~ 0
DAT6
Text Label 5600 4450 0    60   ~ 0
DAT7
Entry Wire Line
	5900 2150 6000 2050
Entry Wire Line
	5900 2250 6000 2150
Wire Wire Line
	5550 2150 5900 2150
Wire Wire Line
	5550 2250 5900 2250
Text Label 5600 2150 0    60   ~ 0
TX
Text Label 5600 2250 0    60   ~ 0
RX
Entry Wire Line
	5900 2550 6000 2450
Entry Wire Line
	5900 2650 6000 2550
Wire Wire Line
	5550 2550 5900 2550
Wire Wire Line
	5550 2650 5900 2650
Text Label 5600 2550 0    60   ~ 0
SWDAT
Text Label 5600 2650 0    60   ~ 0
SWCLK
Entry Wire Line
	5900 3350 6000 3250
Entry Wire Line
	5900 3450 6000 3350
Wire Wire Line
	5900 3350 5550 3350
Wire Wire Line
	5900 3450 5550 3450
Text Label 5600 3350 0    60   ~ 0
DAT8
Text Label 5600 3450 0    60   ~ 0
DAT9
NoConn ~ 5550 4250
NoConn ~ 5550 4150
NoConn ~ 5550 4050
NoConn ~ 5550 3950
NoConn ~ 5550 3850
NoConn ~ 5550 3650
NoConn ~ 5550 3550
NoConn ~ 5550 3250
NoConn ~ 5550 3150
NoConn ~ 5550 2750
NoConn ~ 5550 1250
$Comp
L CRYSTAL X1
U 1 1 52356371
P 1800 3000
F 0 "X1" H 1800 3150 60  0000 C CNN
F 1 "16MGZ" H 1800 2750 60  0001 C CNN
F 2 "HC-18UV" H 1800 2850 60  0000 C CNN
F 3 "~" H 1800 3000 60  0000 C CNN
	1    1800 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 3300 2000 3300
Wire Wire Line
	2000 3300 2000 3050
Wire Wire Line
	2000 3050 2150 3050
Wire Wire Line
	1800 2700 2000 2700
Wire Wire Line
	2000 2700 2000 2950
Wire Wire Line
	2000 2950 2150 2950
$Comp
L C C2
U 1 1 52356461
P 1800 3600
F 0 "C2" H 1800 3700 40  0000 L CNN
F 1 "10nf" H 1806 3515 40  0001 L CNN
F 2 "SM0805" H 1838 3450 30  0000 C CNN
F 3 "~" H 1800 3600 60  0000 C CNN
	1    1800 3600
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 52356470
P 1800 2350
F 0 "C1" H 1800 2450 40  0000 L CNN
F 1 "10nf" H 1806 2265 40  0001 L CNN
F 2 "SM0805" H 1838 2200 30  0000 C CNN
F 3 "~" H 1800 2350 60  0000 C CNN
	1    1800 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2550 1800 2700
Wire Wire Line
	1800 3400 1800 3300
$Comp
L GND #PWR02
U 1 1 52356520
P 1800 4000
F 0 "#PWR02" H 1800 4000 30  0001 C CNN
F 1 "GND" H 1800 3930 30  0001 C CNN
F 2 "" H 1800 4000 60  0000 C CNN
F 3 "" H 1800 4000 60  0000 C CNN
	1    1800 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3800 1800 4000
$Comp
L GND #PWR03
U 1 1 52356582
P 2050 2250
F 0 "#PWR03" H 2050 2250 30  0001 C CNN
F 1 "GND" H 2050 2180 30  0001 C CNN
F 2 "" H 2050 2250 60  0000 C CNN
F 3 "" H 2050 2250 60  0000 C CNN
	1    2050 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 2150 2050 2150
Wire Wire Line
	2050 2150 2050 2250
$Comp
L CONN_5X2 P1
U 1 1 5235BB19
P 5200 5700
F 0 "P1" H 5200 6000 60  0000 C CNN
F 1 "CONN_5X2" H 5200 5700 50  0001 C CNN
F 2 "PIN_ARRAY_5x2" H 5200 5700 60  0001 C CNN
F 3 "NRF24L01" H 5200 5350 60  0001 C CNN
	1    5200 5700
	1    0    0    -1  
$EndComp
Entry Wire Line
	4700 5200 4800 5300
Wire Wire Line
	4800 5300 4800 5500
Entry Wire Line
	5500 5200 5600 5300
Wire Wire Line
	5600 5300 5600 5500
Text Label 4800 5450 1    60   ~ 0
vcc
Text Label 5600 5450 1    60   ~ 0
vcc
Entry Wire Line
	4600 5200 4700 5300
Wire Wire Line
	4700 5300 4700 5600
Wire Wire Line
	4700 5600 4800 5600
Text Label 4700 5500 1    60   ~ 0
CE
Entry Wire Line
	5650 5200 5750 5300
Wire Wire Line
	5750 5300 5750 5600
Wire Wire Line
	5750 5600 5600 5600
Text Label 5750 5500 1    60   ~ 0
CSN
Entry Wire Line
	4500 5200 4600 5300
Wire Wire Line
	4600 5300 4600 5700
Wire Wire Line
	4600 5700 4800 5700
Text Label 4600 5600 1    60   ~ 0
SCK
Entry Wire Line
	4400 5200 4500 5300
Wire Wire Line
	4500 5300 4500 5800
Wire Wire Line
	4500 5800 4800 5800
Text Label 4500 5650 1    60   ~ 0
MISO
Entry Wire Line
	4300 5200 4400 5300
Wire Wire Line
	4400 5300 4400 5900
Wire Wire Line
	4400 5900 4800 5900
Text Label 4400 5700 1    60   ~ 0
GND
Entry Wire Line
	5800 5200 5900 5300
Wire Wire Line
	5900 5300 5900 5700
Wire Wire Line
	5900 5700 5600 5700
Text Label 5900 5550 1    60   ~ 0
MOSI
Entry Wire Line
	5950 5200 6050 5300
Wire Wire Line
	6050 5300 6050 5800
Wire Wire Line
	6050 5800 5600 5800
Text Label 6050 5550 1    60   ~ 0
IRQ
Entry Wire Line
	6000 5150 6100 5250
Wire Wire Line
	6100 5250 6100 5900
Wire Wire Line
	6100 5900 5600 5900
Text Label 5750 5900 0    60   ~ 0
GND
Entry Wire Line
	5900 2050 6000 1950
Wire Wire Line
	5550 2050 5900 2050
Text Label 5600 2050 0    60   ~ 0
IRQ
Entry Wire Line
	5900 2350 6000 2250
Entry Wire Line
	5900 2450 6000 2350
Wire Wire Line
	5550 2350 5900 2350
Wire Wire Line
	5550 2450 5900 2450
Text Label 5600 2350 0    60   ~ 0
CE
Text Label 5600 2450 0    60   ~ 0
CSN
NoConn ~ 5550 3750
$Comp
L C C4
U 1 1 5235C08D
P 6250 3800
F 0 "C4" H 6250 3900 40  0000 L CNN
F 1 "100nf" H 6256 3715 40  0001 L CNN
F 2 "SM0805" H 6288 3650 30  0001 C CNN
F 3 "~" H 6250 3800 60  0001 C CNN
	1    6250 3800
	1    0    0    -1  
$EndComp
Entry Wire Line
	6000 3700 6100 3600
Entry Wire Line
	6000 4100 6100 4000
Wire Wire Line
	6100 3600 6750 3600
Wire Wire Line
	6100 4000 6750 4000
Text Label 6100 3600 0    60   ~ 0
VCC
Text Label 6200 4000 3    60   ~ 0
GND
Entry Wire Line
	3900 5300 4000 5200
Entry Wire Line
	3300 5300 3400 5200
Wire Wire Line
	3300 5300 3300 5850
Wire Wire Line
	3900 5300 3900 5850
Text Label 3300 5300 3    60   ~ 0
VSS
Text Label 3900 5300 3    60   ~ 0
BOOT
Entry Wire Line
	1700 1300 1800 1400
Wire Wire Line
	2150 1400 1800 1400
Text Label 1900 1400 0    60   ~ 0
BOOT
$Comp
L CONN_4 P3
U 1 1 5235C3FF
P 8250 900
F 0 "P3" V 8200 900 50  0000 C CNN
F 1 "CONN_4" V 8300 900 50  0000 C CNN
F 2 "SIL-4" H 8250 900 60  0000 C CNN
F 3 "" H 8250 900 60  0000 C CNN
	1    8250 900 
	1    0    0    -1  
$EndComp
Entry Wire Line
	7450 650  7550 750 
Entry Wire Line
	7450 750  7550 850 
Entry Wire Line
	7450 850  7550 950 
Entry Wire Line
	7450 950  7550 1050
Wire Wire Line
	7550 750  7900 750 
Wire Wire Line
	7550 850  7900 850 
Wire Wire Line
	7550 950  7900 950 
Wire Wire Line
	7550 1050 7900 1050
Text Label 7600 850  0    60   ~ 0
RX
Text Label 7600 750  0    60   ~ 0
TX
Text Label 7550 1050 0    60   ~ 0
GND
Text Label 7550 950  0    60   ~ 0
VCC_6V
$Comp
L NCP1117ST33T3G U2
U 1 1 5235C862
P 8400 1600
F 0 "U2" H 8550 1404 40  0000 C CNN
F 1 "NCP1117ST33T3G" H 8400 1800 40  0001 C CNN
F 2 "sot89" H 8400 1600 60  0000 C CNN
F 3 "~" H 8400 1600 60  0000 C CNN
	1    8400 1600
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C5
U 1 1 5235C871
P 7750 1750
F 0 "C5" H 7800 1850 40  0000 L CNN
F 1 "CAPAPOL" H 7800 1650 40  0001 L CNN
F 2 "C1V5" H 7850 1600 30  0000 C CNN
F 3 "~" H 7750 1750 300 0000 C CNN
	1    7750 1750
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C6
U 1 1 5235C880
P 9100 1750
F 0 "C6" H 9150 1850 40  0000 L CNN
F 1 "CAPAPOL" H 9150 1650 40  0001 L CNN
F 2 "SM0805" H 9200 1600 30  0000 C CNN
F 3 "~" H 9100 1750 300 0000 C CNN
	1    9100 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 1550 9100 1550
Wire Wire Line
	8000 1550 7750 1550
Wire Wire Line
	7750 1950 9100 1950
Wire Wire Line
	8400 1850 8400 2150
Connection ~ 8400 1950
$Comp
L GND #PWR04
U 1 1 5235CA6F
P 8400 2150
F 0 "#PWR04" H 8400 2150 30  0001 C CNN
F 1 "GND" H 8400 2080 30  0001 C CNN
F 2 "" H 8400 2150 60  0000 C CNN
F 3 "" H 8400 2150 60  0000 C CNN
	1    8400 2150
	1    0    0    -1  
$EndComp
Wire Bus Line
	7450 1250 9950 1250
Entry Wire Line
	9000 1250 9100 1350
Entry Wire Line
	7650 1250 7750 1350
Wire Wire Line
	9100 1550 9100 1350
Wire Wire Line
	7750 1550 7750 1350
Text Label 9100 1500 1    60   ~ 0
VCC
Text Label 7750 1500 2    60   ~ 0
VCC_6V
Connection ~ 8700 1950
Entry Wire Line
	7450 2400 7550 2500
Entry Wire Line
	7450 2500 7550 2600
Entry Wire Line
	7450 2600 7550 2700
Entry Wire Line
	7450 2700 7550 2800
Entry Wire Line
	7450 3000 7550 3100
Entry Wire Line
	7450 3100 7550 3200
Entry Wire Line
	7450 3200 7550 3300
Entry Wire Line
	7450 3300 7550 3400
Entry Wire Line
	7450 3600 7550 3700
Entry Wire Line
	7450 3700 7550 3800
Text Label 7650 2500 0    60   ~ 0
DAT0
Text Label 7650 2600 0    60   ~ 0
DAT1
Text Label 7650 2700 0    60   ~ 0
DAT2
Text Label 7650 2800 0    60   ~ 0
DAT3
Text Label 7650 3100 0    60   ~ 0
DAT4
Text Label 7650 3200 0    60   ~ 0
DAT5
Text Label 7650 3300 0    60   ~ 0
DAT6
Text Label 7650 3400 0    60   ~ 0
DAT7
Text Label 7650 3700 0    60   ~ 0
DAT8
Text Label 7650 3800 0    60   ~ 0
DAT9
$Comp
L C C7
U 1 1 5235DB51
P 1200 1750
F 0 "C7" H 1200 1850 40  0000 L CNN
F 1 "C" H 1206 1665 40  0000 L CNN
F 2 "SM0805" H 1238 1600 30  0000 C CNN
F 3 "~" H 1200 1750 60  0000 C CNN
	1    1200 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 2150 1200 1950
Connection ~ 1800 2150
Entry Wire Line
	1600 1500 1700 1400
Wire Wire Line
	1600 1500 1200 1500
Wire Wire Line
	1200 1500 1200 1550
Text Label 1250 1500 0    60   ~ 0
RESET
NoConn ~ 2150 3150
NoConn ~ 2150 3250
NoConn ~ 2150 3450
NoConn ~ 2150 3550
NoConn ~ 2150 3650
$Comp
L JUMPER JP1
U 1 1 5235E1A6
P 3600 5850
F 0 "JP1" H 3600 6000 60  0000 C CNN
F 1 "JUMPER" H 3600 5770 40  0001 C CNN
F 2 "TEST_POINT_2PADS" H 3600 5850 60  0001 C CNN
F 3 "~" H 3600 5850 60  0001 C CNN
	1    3600 5850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR05
U 1 1 5235E6AB
P 8950 2400
F 0 "#PWR05" H 8950 2500 30  0001 C CNN
F 1 "VCC" H 8950 2500 30  0000 C CNN
F 2 "" H 8950 2400 60  0000 C CNN
F 3 "" H 8950 2400 60  0000 C CNN
	1    8950 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 2500 8950 2400
$Comp
L CAPAPOL C8
U 1 1 5235E795
P 6600 1050
F 0 "C8" H 6650 1150 40  0000 L CNN
F 1 "1uf" H 6650 950 40  0001 L CNN
F 2 "C1V5" H 6700 900 30  0000 C CNN
F 3 "~" H 6600 1050 300 0000 C CNN
	1    6600 1050
	-1   0    0    1   
$EndComp
Entry Wire Line
	6200 650  6300 750 
Entry Wire Line
	6000 1200 6100 1300
Wire Wire Line
	6300 750  6300 850 
Wire Wire Line
	6300 850  7200 850 
Wire Wire Line
	6600 1300 6600 1250
Wire Wire Line
	6100 1300 6600 1300
Text Label 6250 1300 0    60   ~ 0
VCC
Text Label 6350 850  0    60   ~ 0
GND
Wire Bus Line
	1700 600  1700 1600
Wire Bus Line
	7450 650  7450 3900
$Comp
L C C9
U 1 1 52364685
P 6500 3800
F 0 "C9" H 6500 3900 40  0000 L CNN
F 1 "100nf" H 6506 3715 40  0001 L CNN
F 2 "SM0805" H 6538 3650 30  0001 C CNN
F 3 "~" H 6500 3800 60  0001 C CNN
	1    6500 3800
	1    0    0    -1  
$EndComp
$Comp
L C C12
U 1 1 52364694
P 6750 3800
F 0 "C12" H 6750 3900 40  0000 L CNN
F 1 "100nf" H 6756 3715 40  0001 L CNN
F 2 "SM0805" H 6788 3650 30  0001 C CNN
F 3 "~" H 6750 3800 60  0001 C CNN
	1    6750 3800
	1    0    0    -1  
$EndComp
Connection ~ 6250 3600
Connection ~ 6500 3600
Connection ~ 6250 4000
Connection ~ 6500 4000
$Comp
L CAPAPOL C11
U 1 1 52364A1D
P 6850 1050
F 0 "C11" H 6900 1150 40  0000 L CNN
F 1 "1uf" H 6900 950 40  0001 L CNN
F 2 "SM0805" H 6950 900 30  0000 C CNN
F 3 "~" H 6850 1050 300 0000 C CNN
	1    6850 1050
	-1   0    0    1   
$EndComp
$Comp
L CAPAPOL C10
U 1 1 52364A2C
P 7200 1050
F 0 "C10" H 7250 1150 40  0000 L CNN
F 1 "1uf" H 7250 950 40  0001 L CNN
F 2 "C1V5" H 7300 900 30  0000 C CNN
F 3 "~" H 7200 1050 300 0000 C CNN
	1    7200 1050
	-1   0    0    1   
$EndComp
Wire Wire Line
	6600 1250 7200 1250
Connection ~ 6850 1250
Connection ~ 6850 850 
Connection ~ 6600 850 
Connection ~ 1800 2700
Connection ~ 1800 2550
Connection ~ 1800 3300
Connection ~ 1800 3400
Wire Wire Line
	7550 3800 7950 3800
Wire Wire Line
	7550 3700 7950 3700
Wire Wire Line
	7550 3400 7950 3400
Wire Wire Line
	7550 3300 7950 3300
Wire Wire Line
	7550 3200 7950 3200
Wire Wire Line
	7550 3100 7950 3100
Wire Wire Line
	7550 2800 7950 2800
Wire Wire Line
	7550 2700 7950 2700
Wire Wire Line
	7550 2600 7950 2600
Wire Wire Line
	7550 2500 7950 2500
$Comp
L R R1
U 1 1 523C46D7
P 8200 2500
F 0 "R1" V 8280 2500 40  0000 C CNN
F 1 "1KOM" V 8207 2501 40  0001 C CNN
F 2 "SM0805" V 8130 2500 30  0001 C CNN
F 3 "~" H 8200 2500 30  0001 C CNN
	1    8200 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8950 2500 8450 2500
$Comp
L R R2
U 1 1 523C47EB
P 8200 2600
F 0 "R2" V 8280 2600 40  0000 C CNN
F 1 "R" H 8207 2601 40  0001 C CNN
F 2 "SM0805" V 8130 2600 30  0000 C CNN
F 3 "~" H 8200 2600 30  0000 C CNN
	1    8200 2600
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 523C47F1
P 8200 2700
F 0 "R3" V 8280 2700 40  0000 C CNN
F 1 "R" H 8207 2701 40  0001 C CNN
F 2 "SM0805" V 8130 2700 30  0000 C CNN
F 3 "~" H 8200 2700 30  0000 C CNN
	1    8200 2700
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 523C47F7
P 8200 2800
F 0 "R4" V 8280 2800 40  0000 C CNN
F 1 "R" H 8207 2801 40  0001 C CNN
F 2 "SM0805" V 8130 2800 30  0000 C CNN
F 3 "~" H 8200 2800 30  0000 C CNN
	1    8200 2800
	0    -1   -1   0   
$EndComp
$Comp
L R R5
U 1 1 523C47FD
P 8200 3100
F 0 "R5" V 8280 3100 40  0000 C CNN
F 1 "R" H 8207 3101 40  0001 C CNN
F 2 "SM0805" V 8130 3100 30  0000 C CNN
F 3 "~" H 8200 3100 30  0000 C CNN
	1    8200 3100
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 523C4803
P 8200 3200
F 0 "R6" V 8280 3200 40  0000 C CNN
F 1 "R" H 8207 3201 40  0001 C CNN
F 2 "SM0805" H 8130 3200 30  0001 C CNN
F 3 "~" H 8200 3200 30  0000 C CNN
	1    8200 3200
	0    -1   -1   0   
$EndComp
$Comp
L R R7
U 1 1 523C4809
P 8200 3300
F 0 "R7" V 8280 3300 40  0000 C CNN
F 1 "R" H 8207 3301 40  0001 C CNN
F 2 "SM0805" H 8130 3300 30  0001 C CNN
F 3 "~" H 8200 3300 30  0001 C CNN
	1    8200 3300
	0    -1   -1   0   
$EndComp
$Comp
L R R8
U 1 1 523C480F
P 8200 3400
F 0 "R8" V 8280 3400 40  0000 C CNN
F 1 "R" H 8207 3401 40  0001 C CNN
F 2 "SM0805" H 8130 3400 30  0001 C CNN
F 3 "~" H 8200 3400 30  0001 C CNN
	1    8200 3400
	0    -1   -1   0   
$EndComp
$Comp
L R R9
U 1 1 523C4815
P 8200 3700
F 0 "R9" V 8280 3700 40  0000 C CNN
F 1 "R" H 8207 3701 40  0001 C CNN
F 2 "SM0805" H 8130 3700 30  0001 C CNN
F 3 "~" H 8200 3700 30  0001 C CNN
	1    8200 3700
	0    -1   -1   0   
$EndComp
$Comp
L R R10
U 1 1 523C481B
P 8200 3800
F 0 "R10" V 8280 3800 40  0000 C CNN
F 1 "R" H 8207 3801 40  0001 C CNN
F 2 "SM0805" H 8130 3800 30  0001 C CNN
F 3 "~" H 8200 3800 30  0001 C CNN
	1    8200 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8450 2500 8450 3950
Connection ~ 8450 2600
Connection ~ 8450 2700
Connection ~ 8450 2800
Connection ~ 8450 3100
Connection ~ 8450 3200
Connection ~ 8450 3300
Connection ~ 8450 3400
Connection ~ 8450 3700
Entry Wire Line
	7350 1650 7450 1750
Entry Wire Line
	7350 1850 7450 1950
$Comp
L C C13
U 1 1 523C4D02
P 7050 1800
F 0 "C13" H 7050 1900 40  0000 L CNN
F 1 "100nf" H 7056 1715 40  0000 L CNN
F 2 "SM0805" H 7088 1650 30  0000 C CNN
F 3 "~" H 7050 1800 60  0000 C CNN
	1    7050 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 1600 7350 1650
Wire Wire Line
	6750 1600 7350 1600
Wire Wire Line
	7350 2000 7350 1850
Wire Wire Line
	6750 2000 7350 2000
Text Label 7150 1600 0    60   ~ 0
vdd
Text Label 7150 2000 0    60   ~ 0
vss
Entry Wire Line
	7350 2850 7450 2750
Entry Wire Line
	7350 3000 7450 2900
Wire Wire Line
	7050 2850 7350 2850
Wire Wire Line
	6900 3000 7350 3000
Text Label 7200 2850 0    60   ~ 0
vdd
Text Label 7200 3000 0    60   ~ 0
vcc
Entry Wire Line
	7350 2650 7450 2550
Wire Wire Line
	7050 2650 7350 2650
Text Label 7150 2650 0    60   ~ 0
vdda
Text Label 3400 4800 0    60   ~ 0
VSS
Text Label 1800 3850 0    60   ~ 0
VSS
Text Label 1900 2150 0    60   ~ 0
VSS
$Comp
L C C14
U 1 1 523C4FE9
P 6750 1800
F 0 "C14" H 6750 1900 40  0000 L CNN
F 1 "100nf" H 6756 1715 40  0000 L CNN
F 2 "SM0805" H 6788 1650 30  0000 C CNN
F 3 "~" H 6750 1800 60  0000 C CNN
	1    6750 1800
	1    0    0    -1  
$EndComp
Connection ~ 7050 2000
Connection ~ 7050 1600
$Comp
L CONN_3 D1
U 1 1 523C5137
P 10950 800
F 0 "D1" V 10900 800 50  0000 C CNN
F 1 "CONN_3" V 11000 800 40  0000 C CNN
F 2 "SIL-3" H 10950 800 60  0000 C CNN
F 3 "" H 10950 800 60  0000 C CNN
	1    10950 800 
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 D2
U 1 1 523C5144
P 10950 1150
F 0 "D2" V 10900 1150 50  0000 C CNN
F 1 "CONN_3" V 11000 1150 40  0000 C CNN
F 2 "SIL-3" H 10950 1150 60  0000 C CNN
F 3 "" H 10950 1150 60  0000 C CNN
	1    10950 1150
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 D3
U 1 1 523C514A
P 10950 1500
F 0 "D3" V 10900 1500 50  0000 C CNN
F 1 "CONN_3" V 11000 1500 40  0000 C CNN
F 2 "SIL-3" H 10950 1500 60  0000 C CNN
F 3 "" H 10950 1500 60  0000 C CNN
	1    10950 1500
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 D4
U 1 1 523C5150
P 10950 1850
F 0 "D4" V 10900 1850 50  0000 C CNN
F 1 "CONN_3" V 11000 1850 40  0000 C CNN
F 2 "SIL-3" H 10950 1850 60  0000 C CNN
F 3 "" H 10950 1850 60  0000 C CNN
	1    10950 1850
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 D5
U 1 1 523C5156
P 10950 2200
F 0 "D5" V 10900 2200 50  0000 C CNN
F 1 "CONN_3" V 11000 2200 40  0000 C CNN
F 2 "SIL-3" H 10950 2200 60  0000 C CNN
F 3 "" H 10950 2200 60  0000 C CNN
	1    10950 2200
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 D6
U 1 1 523C515C
P 10950 2550
F 0 "D6" V 10900 2550 50  0000 C CNN
F 1 "CONN_3" V 11000 2550 40  0000 C CNN
F 2 "SIL-3" H 10950 2550 60  0000 C CNN
F 3 "" H 10950 2550 60  0000 C CNN
	1    10950 2550
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 D7
U 1 1 523C5162
P 10950 2900
F 0 "D7" V 10900 2900 50  0000 C CNN
F 1 "CONN_3" V 11000 2900 40  0000 C CNN
F 2 "SIL-3" H 10950 2900 60  0000 C CNN
F 3 "" H 10950 2900 60  0000 C CNN
	1    10950 2900
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 D8
U 1 1 523C5168
P 10950 3250
F 0 "D8" V 10900 3250 50  0000 C CNN
F 1 "CONN_3" V 11000 3250 40  0000 C CNN
F 2 "SIL-3" H 10950 3250 60  0000 C CNN
F 3 "" H 10950 3250 60  0000 C CNN
	1    10950 3250
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 D9
U 1 1 523C516E
P 10950 3600
F 0 "D9" V 10900 3600 50  0000 C CNN
F 1 "CONN_3" V 11000 3600 40  0000 C CNN
F 2 "SIL-3" H 10950 3600 60  0000 C CNN
F 3 "" H 10950 3600 60  0000 C CNN
	1    10950 3600
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 D10
U 1 1 523C5174
P 10950 3950
F 0 "D10" V 10900 3950 50  0000 C CNN
F 1 "CONN_3" V 11000 3950 40  0000 C CNN
F 2 "SIL-3" H 10950 3950 60  0000 C CNN
F 3 "" H 10950 3950 60  0000 C CNN
	1    10950 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 700  10600 700 
Wire Wire Line
	10400 700  10400 3850
Wire Wire Line
	10600 1050 10400 1050
Connection ~ 10400 1050
Wire Wire Line
	10600 1400 10400 1400
Connection ~ 10400 1400
Wire Wire Line
	10600 1750 10400 1750
Connection ~ 10400 1750
Wire Wire Line
	10600 2100 10400 2100
Connection ~ 10400 2100
Wire Wire Line
	10600 2450 10400 2450
Connection ~ 10400 2450
Wire Wire Line
	10600 2800 10400 2800
Connection ~ 10400 2800
Wire Wire Line
	10600 3150 10400 3150
Connection ~ 10400 3150
Wire Wire Line
	10600 3500 10400 3500
Connection ~ 10400 3500
Wire Wire Line
	10400 3850 10600 3850
Wire Wire Line
	10300 4050 10600 4050
Wire Wire Line
	10600 900  10300 900 
Connection ~ 10300 900 
Wire Wire Line
	10300 1250 10600 1250
Connection ~ 10300 1250
Wire Wire Line
	10300 1600 10600 1600
Connection ~ 10300 1600
Wire Wire Line
	10300 1950 10600 1950
Connection ~ 10300 1950
Wire Wire Line
	10300 2650 10600 2650
Connection ~ 10300 2650
Wire Wire Line
	10300 3000 10600 3000
Connection ~ 10300 3000
Wire Wire Line
	10300 3350 10600 3350
Connection ~ 10300 3350
Wire Wire Line
	10300 3700 10600 3700
Connection ~ 10300 3700
Wire Wire Line
	10300 900  10300 4050
Wire Wire Line
	10600 800  10050 800 
Wire Wire Line
	10600 1150 10050 1150
Wire Wire Line
	10600 1500 10050 1500
Wire Wire Line
	10050 1850 10600 1850
Wire Wire Line
	10600 2200 10050 2200
Wire Wire Line
	10600 2300 10300 2300
Connection ~ 10300 2300
Wire Wire Line
	10600 2550 10050 2550
Wire Wire Line
	10600 2900 10050 2900
Wire Wire Line
	10600 3250 10050 3250
Wire Wire Line
	10600 3600 10050 3600
Wire Wire Line
	10600 3950 10050 3950
Entry Wire Line
	9950 700  10050 800 
Entry Wire Line
	9950 1050 10050 1150
Entry Wire Line
	9950 1400 10050 1500
Entry Wire Line
	9950 1750 10050 1850
Entry Wire Line
	9950 2100 10050 2200
Entry Wire Line
	9950 2450 10050 2550
Entry Wire Line
	9950 2800 10050 2900
Entry Wire Line
	9950 3150 10050 3250
Entry Wire Line
	9950 3500 10050 3600
Entry Wire Line
	9950 3850 10050 3950
Wire Bus Line
	9950 550  9950 4950
Text Label 10100 800  0    60   ~ 0
dat0
Text Label 10100 1150 0    60   ~ 0
dat1
Text Label 10100 1500 0    60   ~ 0
dat2
Text Label 10100 1850 0    60   ~ 0
dat3
Text Label 10100 2200 0    60   ~ 0
dat4
Text Label 10100 2550 0    60   ~ 0
dat5
Text Label 10100 2900 0    60   ~ 0
dat6
Text Label 10100 3250 0    60   ~ 0
dat7
Text Label 10100 3600 0    60   ~ 0
dat8
Text Label 10100 3950 0    60   ~ 0
dat9
$Comp
L CONN_5 P2
U 1 1 523C6925
P 10950 4600
F 0 "P2" V 10900 4600 50  0000 C CNN
F 1 "CONN_5" V 11000 4600 50  0000 C CNN
F 2 "SIL-5" H 10950 4600 60  0000 C CNN
F 3 "" H 10950 4600 60  0000 C CNN
	1    10950 4600
	1    0    0    -1  
$EndComp
Entry Wire Line
	9950 4300 10050 4400
Entry Wire Line
	9950 4400 10050 4500
Entry Wire Line
	9950 4500 10050 4600
Entry Wire Line
	9950 4600 10050 4700
Entry Wire Line
	9950 4700 10050 4800
Wire Wire Line
	10550 4400 10050 4400
Wire Wire Line
	10550 4500 10050 4500
Wire Wire Line
	10550 4600 10050 4600
Wire Wire Line
	10550 4700 10050 4700
Wire Wire Line
	10550 4800 10050 4800
Text Label 10200 4800 0    60   ~ 0
VSS
Text Label 10200 4400 0    60   ~ 0
VDD
Text Label 10200 4500 0    60   ~ 0
reset
Text Label 10200 4600 0    60   ~ 0
swdat
Text Label 10200 4700 0    60   ~ 0
swclk
Wire Bus Line
	1700 650  7450 650 
Entry Wire Line
	9950 550  10050 650 
Wire Wire Line
	10050 650  10500 650 
Wire Wire Line
	10500 650  10500 700 
Connection ~ 10500 700 
Text Label 10150 650  0    60   ~ 0
vcc
Entry Wire Line
	9950 900  10050 1000
Wire Wire Line
	10050 1000 10300 1000
Connection ~ 10300 1000
Text Label 10050 1000 0    60   ~ 0
gnd
$Comp
L R R11
U 1 1 523C61D7
P 8200 3950
F 0 "R11" V 8280 3950 40  0000 C CNN
F 1 "R" H 8207 3951 40  0001 C CNN
F 2 "SM0805" H 8130 3950 30  0001 C CNN
F 3 "~" H 8200 3950 30  0001 C CNN
	1    8200 3950
	0    -1   -1   0   
$EndComp
Connection ~ 8450 3800
Entry Wire Line
	7450 3850 7550 3950
Wire Wire Line
	7550 3950 7950 3950
Text Label 7700 3950 0    60   ~ 0
rx
Entry Wire Line
	7350 3300 7450 3400
Entry Wire Line
	7350 3450 7450 3550
Wire Wire Line
	7350 3300 7150 3300
Wire Wire Line
	7150 3450 7350 3450
Text Label 7200 3300 0    60   ~ 0
gnd
Text Label 7200 3450 0    60   ~ 0
vss
$Comp
L JUMPER JP2
U 1 1 523D8017
P 6750 2800
F 0 "JP2" H 6750 2950 60  0000 C CNN
F 1 "JUMPER" H 6750 2720 40  0000 C CNN
F 2 "TEST_POINT_2PADS" H 6750 2800 60  0000 C CNN
F 3 "~" H 6750 2800 60  0000 C CNN
	1    6750 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6750 3100 6900 3100
Wire Wire Line
	6900 3100 6900 3000
Wire Wire Line
	7050 2500 7050 2850
Wire Wire Line
	7050 2500 6750 2500
Connection ~ 7050 2650
Wire Wire Line
	7150 3450 7150 3800
Wire Wire Line
	7150 3800 7000 3800
Wire Wire Line
	7150 3300 7150 3200
Wire Wire Line
	7150 3200 7000 3200
Text GLabel 1150 850  0    60   Input ~ 0
VDD_3.3
Entry Wire Line
	1600 850  1700 950 
Wire Wire Line
	1600 850  1150 850 
Text Label 1300 850  0    60   ~ 0
VDD
Text Label 8700 1950 0    60   ~ 0
GND
Wire Wire Line
	7000 3200 7000 3800
$EndSCHEMATC
