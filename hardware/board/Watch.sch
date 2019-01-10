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
LIBS:PUSHBUTTON
LIBS:Watch-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_01X11 P1
U 1 1 57EA7258
P 9350 3650
F 0 "P1" H 9350 4250 50  0000 C CNN
F 1 "LCD FPC Connector" V 9450 3650 50  0000 C CNN
F 2 "FPC_Connectors:FPC_10pin_0.5pitch" H 9350 3650 50  0001 C CNN
F 3 "" H 9350 3650 50  0000 C CNN
	1    9350 3650
	1    0    0    -1  
$EndComp
Text Label 9150 3150 2    60   ~ 0
SCLK
Text Label 9150 3250 2    60   ~ 0
SI
Text Label 9150 3350 2    60   ~ 0
SCS
Text Label 9150 3450 2    60   ~ 0
EXTCOMIN
Text Label 9150 3550 2    60   ~ 0
DISP
Text Label 9150 3650 2    60   ~ 0
VDDA
Text Label 9150 3750 2    60   ~ 0
VDD
Text Label 9150 3850 2    60   ~ 0
EXTMODE
Text Label 9150 3950 2    60   ~ 0
VSS
Text Label 9150 4050 2    60   ~ 0
VSSA
Text Label 9150 4150 2    60   ~ 0
SHIELD
$Comp
L C C3
U 1 1 57EA7615
P 8350 3900
F 0 "C3" H 8375 4000 50  0000 L CNN
F 1 "1u" H 8375 3800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8388 3750 50  0001 C CNN
F 3 "" H 8350 3900 50  0000 C CNN
	1    8350 3900
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 57EA775B
P 7850 3900
F 0 "C1" H 7875 4000 50  0000 L CNN
F 1 "100n" H 7875 3800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7888 3750 50  0001 C CNN
F 3 "" H 7850 3900 50  0000 C CNN
	1    7850 3900
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 57EA777C
P 8100 3900
F 0 "C2" H 8125 4000 50  0000 L CNN
F 1 "1u" H 8125 3800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8138 3750 50  0001 C CNN
F 3 "" H 8100 3900 50  0000 C CNN
	1    8100 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 57EA7334
P 8650 4250
F 0 "#PWR01" H 8650 4000 50  0001 C CNN
F 1 "GND" H 8650 4100 50  0000 C CNN
F 2 "" H 8650 4250 50  0000 C CNN
F 3 "" H 8650 4250 50  0000 C CNN
	1    8650 4250
	1    0    0    -1  
$EndComp
$Comp
L HOLDER_COIN_CELL_2032 U2
U 1 1 57EBFA58
P 2250 750
F 0 "U2" H 2250 1300 60  0000 C CNN
F 1 "HOLDER_COIN_CELL_2032" H 2250 1400 60  0000 C CNN
F 2 "HOLDER_COIN_CELL:HOLDER_COIN_CELL_2032_THROUGHHOLE" H 2250 750 60  0001 C CNN
F 3 "" H 2250 750 60  0001 C CNN
	1    2250 750 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 57EBFE34
P 2250 1300
F 0 "#PWR02" H 2250 1050 50  0001 C CNN
F 1 "GND" H 2250 1150 50  0000 C CNN
F 2 "" H 2250 1300 50  0000 C CNN
F 3 "" H 2250 1300 50  0000 C CNN
	1    2250 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 57EC027C
P 8100 1000
F 0 "#PWR03" H 8100 750 50  0001 C CNN
F 1 "GND" H 8100 850 50  0000 C CNN
F 2 "" H 8100 1000 50  0000 C CNN
F 3 "" H 8100 1000 50  0000 C CNN
	1    8100 1000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 57EC0349
P 9200 1000
F 0 "#PWR04" H 9200 750 50  0001 C CNN
F 1 "GND" H 9200 850 50  0000 C CNN
F 2 "" H 9200 1000 50  0000 C CNN
F 3 "" H 9200 1000 50  0000 C CNN
	1    9200 1000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 57EC0382
P 10400 1000
F 0 "#PWR05" H 10400 750 50  0001 C CNN
F 1 "GND" H 10400 850 50  0000 C CNN
F 2 "" H 10400 1000 50  0000 C CNN
F 3 "" H 10400 1000 50  0000 C CNN
	1    10400 1000
	1    0    0    -1  
$EndComp
Text GLabel 8650 3450 0    60   Input ~ 0
EXTCOMIN
Text GLabel 6400 1600 0    60   Input ~ 0
SWDIO
Text GLabel 6400 1700 0    60   Input ~ 0
SWCLK
$Comp
L +BATT #PWR06
U 1 1 57EC12EC
P 6150 1800
F 0 "#PWR06" H 6150 1650 50  0001 C CNN
F 1 "+BATT" H 6150 1940 50  0000 C CNN
F 2 "" H 6150 1800 50  0000 C CNN
F 3 "" H 6150 1800 50  0000 C CNN
	1    6150 1800
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR07
U 1 1 57EC149B
P 5950 1900
F 0 "#PWR07" H 5950 1650 50  0001 C CNN
F 1 "GND" H 5950 1750 50  0000 C CNN
F 2 "" H 5950 1900 50  0000 C CNN
F 3 "" H 5950 1900 50  0000 C CNN
	1    5950 1900
	0    1    1    0   
$EndComp
Text GLabel 4000 4150 0    60   Input ~ 0
SWDIO
Text GLabel 4000 4250 0    60   Input ~ 0
SWCLK
$Comp
L GND #PWR08
U 1 1 57EC1CCC
P 5650 4500
F 0 "#PWR08" H 5650 4250 50  0001 C CNN
F 1 "GND" H 5650 4350 50  0000 C CNN
F 2 "" H 5650 4500 50  0000 C CNN
F 3 "" H 5650 4500 50  0000 C CNN
	1    5650 4500
	1    0    0    -1  
$EndComp
Text GLabel 7750 1350 3    60   Input ~ 0
PB_TOP
Text GLabel 8850 1350 3    60   Input ~ 0
PB_MID
Text GLabel 10050 1350 3    60   Input ~ 0
PB_BOTTOM
Text GLabel 1500 2050 0    60   Input ~ 0
PB_TOP
Text GLabel 1500 2700 0    60   Input ~ 0
PB_MID
Text GLabel 1500 3350 0    60   Input ~ 0
PB_BOTTOM
$Comp
L R R1
U 1 1 57EE5D03
P 6500 3750
F 0 "R1" V 6580 3750 50  0000 C CNN
F 1 "10k" V 6500 3750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6430 3750 50  0001 C CNN
F 3 "" H 6500 3750 50  0000 C CNN
	1    6500 3750
	0    1    1    0   
$EndComp
$Comp
L GND #PWR09
U 1 1 57EE5E3D
P 6750 3850
F 0 "#PWR09" H 6750 3600 50  0001 C CNN
F 1 "GND" H 6750 3700 50  0000 C CNN
F 2 "" H 6750 3850 50  0000 C CNN
F 3 "" H 6750 3850 50  0000 C CNN
	1    6750 3850
	1    0    0    -1  
$EndComp
$Comp
L Crystal_Small X1
U 1 1 57EE6055
P 6100 4050
F 0 "X1" H 6350 4100 50  0000 C CNN
F 1 "32.768kHz" H 6100 4200 50  0000 C CNN
F 2 "Crystals_SMD:Crystal_3.2x1.5mm_HandSoldering" H 6100 4050 50  0001 C CNN
F 3 "" H 6100 4050 50  0000 C CNN
	1    6100 4050
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 57EE7295
P 3750 1600
F 0 "C4" H 3775 1700 50  0000 L CNN
F 1 "4u7" H 3775 1500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3788 1450 50  0001 C CNN
F 3 "" H 3750 1600 50  0000 C CNN
	1    3750 1600
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 57EE7301
P 4050 1600
F 0 "C6" H 4075 1700 50  0000 L CNN
F 1 "100n" H 4075 1500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4088 1450 50  0001 C CNN
F 3 "" H 4050 1600 50  0000 C CNN
	1    4050 1600
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 57EE7343
P 4300 1600
F 0 "C7" H 4325 1700 50  0000 L CNN
F 1 "100n" H 4325 1500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4338 1450 50  0001 C CNN
F 3 "" H 4300 1600 50  0000 C CNN
	1    4300 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 57EE7419
P 3750 1900
F 0 "#PWR010" H 3750 1650 50  0001 C CNN
F 1 "GND" H 3750 1750 50  0000 C CNN
F 2 "" H 3750 1900 50  0000 C CNN
F 3 "" H 3750 1900 50  0000 C CNN
	1    3750 1900
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 57EE841A
P 4600 1600
F 0 "C8" H 4625 1700 50  0000 L CNN
F 1 "100n" H 4625 1500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4638 1450 50  0001 C CNN
F 3 "" H 4600 1600 50  0000 C CNN
	1    4600 1600
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 57EE86BA
P 4850 1600
F 0 "C9" H 4875 1700 50  0000 L CNN
F 1 "1u" H 4875 1500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4888 1450 50  0001 C CNN
F 3 "" H 4850 1600 50  0000 C CNN
	1    4850 1600
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 57EE9C4B
P 3600 2650
F 0 "C5" V 3550 2500 50  0000 L CNN
F 1 "100n" V 3550 2700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3638 2500 50  0001 C CNN
F 3 "" H 3600 2650 50  0000 C CNN
	1    3600 2650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR011
U 1 1 57EEA2BB
P 3400 2700
F 0 "#PWR011" H 3400 2450 50  0001 C CNN
F 1 "GND" H 3400 2550 50  0000 C CNN
F 2 "" H 3400 2700 50  0000 C CNN
F 3 "" H 3400 2700 50  0000 C CNN
	1    3400 2700
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR_SMALL L1
U 1 1 57EEB95D
P 6100 2650
F 0 "L1" H 6350 2700 50  0000 C CNN
F 1 "1000" H 6100 2600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 6100 2650 50  0001 C CNN
F 3 "" H 6100 2650 50  0000 C CNN
	1    6100 2650
	1    0    0    -1  
$EndComp
$Comp
L C C10
U 1 1 57EEC7C3
P 5900 4300
F 0 "C10" H 5925 4400 50  0000 L CNN
F 1 "10p" H 5925 4200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5938 4150 50  0001 C CNN
F 3 "" H 5900 4300 50  0000 C CNN
	1    5900 4300
	1    0    0    -1  
$EndComp
$Comp
L C C11
U 1 1 57EEC826
P 6300 4300
F 0 "C11" H 6325 4400 50  0000 L CNN
F 1 "10p" H 6325 4200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6338 4150 50  0001 C CNN
F 3 "" H 6300 4300 50  0000 C CNN
	1    6300 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 57EED604
P 6100 4550
F 0 "#PWR012" H 6100 4300 50  0001 C CNN
F 1 "GND" H 6100 4400 50  0000 C CNN
F 2 "" H 6100 4550 50  0000 C CNN
F 3 "" H 6100 4550 50  0000 C CNN
	1    6100 4550
	1    0    0    -1  
$EndComp
Text GLabel 6400 1500 0    60   Input ~ 0
NRST
Text GLabel 4000 2550 1    60   Input ~ 0
NRST
Text GLabel 8650 3250 0    60   Input ~ 0
SI
Text GLabel 4000 3550 0    60   Input ~ 0
SI
Text GLabel 8650 3150 0    60   Input ~ 0
SCLK
Text GLabel 4000 3350 0    60   Input ~ 0
SCLK
Text GLabel 8650 3350 0    60   Input ~ 0
SCS
Text GLabel 3150 3650 0    60   Input ~ 0
SCS
$Comp
L GND #PWR013
U 1 1 57EF4E7B
P 3550 5450
F 0 "#PWR013" H 3550 5200 50  0001 C CNN
F 1 "GND" H 3550 5300 50  0000 C CNN
F 2 "" H 3550 5450 50  0000 C CNN
F 3 "" H 3550 5450 50  0000 C CNN
	1    3550 5450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 57EF4ECB
P 3950 5450
F 0 "#PWR014" H 3950 5200 50  0001 C CNN
F 1 "GND" H 3950 5300 50  0000 C CNN
F 2 "" H 3950 5450 50  0000 C CNN
F 3 "" H 3950 5450 50  0000 C CNN
	1    3950 5450
	1    0    0    -1  
$EndComp
$Comp
L R SB1
U 1 1 57EF5800
P 3350 3650
F 0 "SB1" V 3430 3650 50  0000 C CNN
F 1 "0" V 3350 3650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3280 3650 50  0001 C CNN
F 3 "" H 3350 3650 50  0000 C CNN
	1    3350 3650
	0    1    1    0   
$EndComp
$Comp
L R SB2
U 1 1 57EF588A
P 3750 5400
F 0 "SB2" V 3830 5400 50  0000 C CNN
F 1 "0" V 3750 5400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3680 5400 50  0001 C CNN
F 3 "" H 3750 5400 50  0000 C CNN
	1    3750 5400
	0    1    1    0   
$EndComp
NoConn ~ 4050 3950
NoConn ~ 4050 4050
NoConn ~ 4050 4350
NoConn ~ 5550 3650
NoConn ~ 5550 3550
NoConn ~ 5550 3450
NoConn ~ 5550 3350
NoConn ~ 5550 3050
$Comp
L +BATT #PWR015
U 1 1 57EF9334
P 5150 900
F 0 "#PWR015" H 5150 750 50  0001 C CNN
F 1 "+BATT" H 5150 1040 50  0000 C CNN
F 2 "" H 5150 900 50  0000 C CNN
F 3 "" H 5150 900 50  0000 C CNN
	1    5150 900 
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR016
U 1 1 57EFA73F
P 5400 900
F 0 "#PWR016" H 5400 750 50  0001 C CNN
F 1 "VDD" H 5400 1050 50  0000 C CNN
F 2 "" H 5400 900 50  0000 C CNN
F 3 "" H 5400 900 50  0000 C CNN
	1    5400 900 
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR017
U 1 1 57EFB920
P 5700 2550
F 0 "#PWR017" H 5700 2400 50  0001 C CNN
F 1 "VDD" H 5700 2700 50  0000 C CNN
F 2 "" H 5700 2550 50  0000 C CNN
F 3 "" H 5700 2550 50  0000 C CNN
	1    5700 2550
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR018
U 1 1 57EFC889
P 3750 1300
F 0 "#PWR018" H 3750 1150 50  0001 C CNN
F 1 "VDD" H 3750 1450 50  0000 C CNN
F 2 "" H 3750 1300 50  0000 C CNN
F 3 "" H 3750 1300 50  0000 C CNN
	1    3750 1300
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR019
U 1 1 57EFD0C5
P 2000 1150
F 0 "#PWR019" H 2000 1000 50  0001 C CNN
F 1 "VDD" H 2000 1300 50  0000 C CNN
F 2 "" H 2000 1150 50  0000 C CNN
F 3 "" H 2000 1150 50  0000 C CNN
	1    2000 1150
	-1   0    0    1   
$EndComp
$Comp
L PWR_FLAG #FLG020
U 1 1 57EFDA16
P 5650 900
F 0 "#FLG020" H 5650 995 50  0001 C CNN
F 1 "PWR_FLAG" H 5650 1080 50  0000 C CNN
F 2 "" H 5650 900 50  0000 C CNN
F 3 "" H 5650 900 50  0000 C CNN
	1    5650 900 
	1    0    0    -1  
$EndComp
$Comp
L GNDPWR #PWR021
U 1 1 57EFEF87
P 5550 1250
F 0 "#PWR021" H 5550 1050 50  0001 C CNN
F 1 "GNDPWR" H 5550 1120 50  0000 C CNN
F 2 "" H 5550 1200 50  0000 C CNN
F 3 "" H 5550 1200 50  0000 C CNN
	1    5550 1250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 57EFEFDE
P 5250 1250
F 0 "#PWR022" H 5250 1000 50  0001 C CNN
F 1 "GND" H 5250 1100 50  0000 C CNN
F 2 "" H 5250 1250 50  0000 C CNN
F 3 "" H 5250 1250 50  0000 C CNN
	1    5250 1250
	1    0    0    -1  
$EndComp
NoConn ~ 4050 3250
$Comp
L VDD #PWR023
U 1 1 57EFBA79
P 7850 3500
F 0 "#PWR023" H 7850 3350 50  0001 C CNN
F 1 "VDD" H 7850 3650 50  0000 C CNN
F 2 "" H 7850 3500 50  0000 C CNN
F 3 "" H 7850 3500 50  0000 C CNN
	1    7850 3500
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR024
U 1 1 57F1207A
P 2500 1150
F 0 "#PWR024" H 2500 1000 50  0001 C CNN
F 1 "VDD" H 2500 1300 50  0000 C CNN
F 2 "" H 2500 1150 50  0000 C CNN
F 3 "" H 2500 1150 50  0000 C CNN
	1    2500 1150
	-1   0    0    1   
$EndComp
Text GLabel 4000 3150 0    60   Input ~ 0
EXTCOMIN
NoConn ~ 4050 3450
NoConn ~ 5550 3150
Text GLabel 4000 2850 0    60   Input ~ 0
PB_TOP_RC
Text GLabel 1950 2700 2    60   Input ~ 0
PB_MID_RC
Text GLabel 1950 3350 2    60   Input ~ 0
PB_BOTTOM_RC
Text GLabel 1950 2050 2    60   Input ~ 0
PB_TOP_RC
$Comp
L R R2
U 1 1 57F927A4
P 1750 2050
F 0 "R2" V 1830 2050 50  0000 C CNN
F 1 "10k" V 1750 2050 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1680 2050 50  0001 C CNN
F 3 "" H 1750 2050 50  0000 C CNN
	1    1750 2050
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 57F928F4
P 1750 2700
F 0 "R3" V 1830 2700 50  0000 C CNN
F 1 "10k" V 1750 2700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1680 2700 50  0001 C CNN
F 3 "" H 1750 2700 50  0000 C CNN
	1    1750 2700
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 57F92963
P 1750 3350
F 0 "R4" V 1830 3350 50  0000 C CNN
F 1 "10k" V 1750 3350 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1680 3350 50  0001 C CNN
F 3 "" H 1750 3350 50  0000 C CNN
	1    1750 3350
	0    -1   -1   0   
$EndComp
$Comp
L C C12
U 1 1 57F93166
P 1550 2250
F 0 "C12" H 1575 2350 50  0000 L CNN
F 1 "100n" H 1575 2150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1588 2100 50  0001 C CNN
F 3 "" H 1550 2250 50  0000 C CNN
	1    1550 2250
	1    0    0    -1  
$EndComp
$Comp
L C C13
U 1 1 57F9326B
P 1550 2900
F 0 "C13" H 1575 3000 50  0000 L CNN
F 1 "100n" H 1575 2800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1588 2750 50  0001 C CNN
F 3 "" H 1550 2900 50  0000 C CNN
	1    1550 2900
	1    0    0    -1  
$EndComp
$Comp
L C C14
U 1 1 57F932E7
P 1550 3550
F 0 "C14" H 1575 3650 50  0000 L CNN
F 1 "100n" H 1575 3450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1588 3400 50  0001 C CNN
F 3 "" H 1550 3550 50  0000 C CNN
	1    1550 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR025
U 1 1 57F93E95
P 1550 2450
F 0 "#PWR025" H 1550 2200 50  0001 C CNN
F 1 "GND" H 1550 2300 50  0000 C CNN
F 2 "" H 1550 2450 50  0000 C CNN
F 3 "" H 1550 2450 50  0000 C CNN
	1    1550 2450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 57F94075
P 1550 3100
F 0 "#PWR026" H 1550 2850 50  0001 C CNN
F 1 "GND" H 1550 2950 50  0000 C CNN
F 2 "" H 1550 3100 50  0000 C CNN
F 3 "" H 1550 3100 50  0000 C CNN
	1    1550 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 57F94236
P 1550 3750
F 0 "#PWR027" H 1550 3500 50  0001 C CNN
F 1 "GND" H 1550 3600 50  0000 C CNN
F 2 "" H 1550 3750 50  0000 C CNN
F 3 "" H 1550 3750 50  0000 C CNN
	1    1550 3750
	1    0    0    -1  
$EndComp
Text GLabel 4000 2950 0    60   Input ~ 0
PB_MID_RC
Text GLabel 4000 3050 0    60   Input ~ 0
PB_BOTTOM_RC
$Comp
L GND #PWR028
U 1 1 584D8583
P 9700 1000
F 0 "#PWR028" H 9700 750 50  0001 C CNN
F 1 "GND" H 9700 850 50  0000 C CNN
F 2 "" H 9700 1000 50  0000 C CNN
F 3 "" H 9700 1000 50  0000 C CNN
	1    9700 1000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 584D85E5
P 8500 1000
F 0 "#PWR029" H 8500 750 50  0001 C CNN
F 1 "GND" H 8500 850 50  0000 C CNN
F 2 "" H 8500 1000 50  0000 C CNN
F 3 "" H 8500 1000 50  0000 C CNN
	1    8500 1000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 584D8647
P 7400 1000
F 0 "#PWR030" H 7400 750 50  0001 C CNN
F 1 "GND" H 7400 850 50  0000 C CNN
F 2 "" H 7400 1000 50  0000 C CNN
F 3 "" H 7400 1000 50  0000 C CNN
	1    7400 1000
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X07 P2
U 1 1 58938493
P 6650 1800
F 0 "P2" H 6650 2200 50  0000 C CNN
F 1 "CONN_01X07" V 6750 1800 50  0000 C CNN
F 2 "Generic_Connector:Pin_Header_Straight_1x07_Pitch2.54mm" H 6650 1800 50  0001 C CNN
F 3 "" H 6650 1800 50  0000 C CNN
	1    6650 1800
	1    0    0    -1  
$EndComp
Text GLabel 6400 2100 0    60   Input ~ 0
TX
Text GLabel 6400 2000 0    60   Input ~ 0
RX
Text GLabel 4000 3750 0    60   Input ~ 0
TX
Text GLabel 4000 3850 0    60   Input ~ 0
RX
$Comp
L STM32L031K6 U1
U 1 1 57EA8A77
P 4800 3700
F 0 "U1" H 4800 4900 60  0000 C CNN
F 1 "STM32L031K6" V 4800 3900 60  0000 C CNN
F 2 "Housings_QFP:LQFP-32_7x7mm_Pitch0.8mm" H 4700 3900 60  0001 C CNN
F 3 "" H 4700 3900 60  0001 C CNN
	1    4800 3700
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 589AE991
P 6100 3250
F 0 "R6" V 6180 3250 50  0000 C CNN
F 1 "510" V 6100 3250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6030 3250 50  0001 C CNN
F 3 "" H 6100 3250 50  0000 C CNN
	1    6100 3250
	0    1    1    0   
$EndComp
$Comp
L LED D1
U 1 1 589AEFCD
P 6450 3250
F 0 "D1" H 6450 3350 50  0000 C CNN
F 1 "LED" H 6450 3150 50  0000 C CNN
F 2 "LEDs:LED_0805" H 6450 3250 50  0001 C CNN
F 3 "" H 6450 3250 50  0000 C CNN
	1    6450 3250
	-1   0    0    1   
$EndComp
$Comp
L R SB3
U 1 1 589AF158
P 5750 3250
F 0 "SB3" V 5830 3250 50  0000 C CNN
F 1 "0" V 5750 3250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5680 3250 50  0001 C CNN
F 3 "" H 5750 3250 50  0000 C CNN
	1    5750 3250
	0    1    1    0   
$EndComp
$Comp
L GND #PWR031
U 1 1 589AF281
P 6700 3350
F 0 "#PWR031" H 6700 3100 50  0001 C CNN
F 1 "GND" H 6700 3200 50  0000 C CNN
F 2 "" H 6700 3350 50  0000 C CNN
F 3 "" H 6700 3350 50  0000 C CNN
	1    6700 3350
	1    0    0    -1  
$EndComp
$Comp
L TEST_1P W3
U 1 1 589B0C37
P 8700 3000
F 0 "W3" H 8700 3270 50  0000 C CNN
F 1 "TEST_1P" H 8700 3200 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Small" H 8900 3000 50  0001 C CNN
F 3 "" H 8900 3000 50  0000 C CNN
	1    8700 3000
	1    0    0    -1  
$EndComp
$Comp
L TEST_1P W2
U 1 1 589B180C
P 8850 2850
F 0 "W2" H 8850 3120 50  0000 C CNN
F 1 "TEST_1P" H 8850 3050 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Small" H 9050 2850 50  0001 C CNN
F 3 "" H 9050 2850 50  0000 C CNN
	1    8850 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 4150 9150 4150
Wire Wire Line
	8350 3750 9150 3750
Wire Wire Line
	8650 3850 9150 3850
Wire Wire Line
	9150 3950 8650 3950
Wire Wire Line
	8650 4050 9150 4050
Wire Wire Line
	8650 3450 9150 3450
Wire Wire Line
	8650 3350 9150 3350
Wire Wire Line
	8650 3250 9150 3250
Wire Wire Line
	8650 3150 9150 3150
Wire Wire Line
	8650 3650 8650 3850
Connection ~ 8650 3750
Wire Wire Line
	8650 3950 8650 4250
Connection ~ 8650 4050
Connection ~ 8650 4150
Wire Wire Line
	8350 4050 8350 4150
Wire Wire Line
	8100 4050 8100 4150
Connection ~ 8350 4150
Wire Wire Line
	7850 4050 7850 4150
Connection ~ 8100 4150
Wire Wire Line
	8100 3750 8100 3650
Wire Wire Line
	7850 3500 7850 3750
Wire Wire Line
	2250 1100 2250 1300
Wire Wire Line
	8100 1000 8000 1000
Wire Wire Line
	9200 1000 9100 1000
Wire Wire Line
	10400 1000 10300 1000
Wire Wire Line
	6400 1700 6450 1700
Wire Wire Line
	6150 1800 6450 1800
Wire Wire Line
	4000 4150 4050 4150
Wire Wire Line
	4050 4250 4000 4250
Wire Wire Line
	5700 2550 5700 2850
Wire Wire Line
	5550 2650 5850 2650
Wire Wire Line
	5550 2750 6500 2750
Connection ~ 5700 2650
Connection ~ 5700 2750
Wire Wire Line
	5650 4250 5650 4500
Connection ~ 5650 4350
Wire Wire Line
	4000 3150 4050 3150
Wire Wire Line
	4050 3050 4000 3050
Wire Wire Line
	6650 3750 6750 3750
Wire Wire Line
	6750 3750 6750 3850
Wire Wire Line
	5550 3950 6300 3950
Wire Wire Line
	5550 4050 6000 4050
Wire Wire Line
	3750 1750 3750 1900
Wire Wire Line
	4050 1750 4050 1850
Wire Wire Line
	3750 1850 4850 1850
Connection ~ 3750 1850
Wire Wire Line
	4300 1850 4300 1750
Connection ~ 4050 1850
Wire Wire Line
	3750 1450 3750 1300
Wire Wire Line
	3750 1350 4850 1350
Wire Wire Line
	4050 1350 4050 1450
Connection ~ 3750 1350
Wire Wire Line
	4300 1350 4300 1450
Connection ~ 4050 1350
Wire Wire Line
	4600 1350 4600 1450
Connection ~ 4300 1350
Wire Wire Line
	4600 1850 4600 1750
Connection ~ 4300 1850
Wire Wire Line
	4850 1350 4850 1450
Connection ~ 4600 1350
Wire Wire Line
	4850 1850 4850 1750
Connection ~ 4600 1850
Wire Wire Line
	3750 2650 4050 2650
Wire Wire Line
	3400 2700 3400 2650
Wire Wire Line
	3400 2650 3450 2650
Wire Wire Line
	5550 3750 6350 3750
Wire Wire Line
	6300 3950 6300 4150
Wire Wire Line
	6300 4050 6200 4050
Connection ~ 5700 2850
Wire Wire Line
	5550 4350 5650 4350
Wire Wire Line
	5650 4250 5550 4250
Wire Wire Line
	5900 4150 5900 4050
Connection ~ 5900 4050
Connection ~ 6300 4050
Wire Wire Line
	5900 4450 5900 4500
Wire Wire Line
	5900 4500 6300 4500
Wire Wire Line
	6100 4500 6100 4550
Wire Wire Line
	6300 4500 6300 4450
Connection ~ 6100 4500
Wire Wire Line
	5950 1900 6450 1900
Wire Wire Line
	4000 2550 4000 2650
Connection ~ 4000 2650
Wire Wire Line
	4000 2950 4050 2950
Wire Wire Line
	4000 3350 4050 3350
Wire Wire Line
	3500 3650 4050 3650
Wire Wire Line
	3150 3650 3200 3650
Wire Wire Line
	3950 5450 3950 5400
Wire Wire Line
	3950 5400 3900 5400
Wire Wire Line
	3550 5450 3550 5400
Wire Wire Line
	3550 5400 3600 5400
Connection ~ 7850 3550
Connection ~ 8100 3650
Wire Wire Line
	5150 900  5150 1000
Wire Wire Line
	5150 1000 5650 1000
Wire Wire Line
	5400 1000 5400 900 
Connection ~ 8650 3650
Wire Wire Line
	5650 1000 5650 900 
Connection ~ 5400 1000
Wire Wire Line
	5250 1250 5250 1100
Wire Wire Line
	5250 1100 5550 1100
Wire Wire Line
	5550 1100 5550 1250
Wire Wire Line
	7850 3550 9150 3550
Wire Wire Line
	7850 3650 9150 3650
Connection ~ 7850 3650
Wire Wire Line
	5700 2850 5550 2850
Wire Wire Line
	6350 2650 6500 2650
Wire Wire Line
	6500 2650 6500 2750
Wire Wire Line
	2000 1100 2000 1150
Wire Wire Line
	2500 1100 2500 1150
Wire Wire Line
	7750 1250 7750 1350
Wire Wire Line
	8850 1250 8850 1350
Wire Wire Line
	10050 1250 10050 1350
Wire Wire Line
	4000 2850 4050 2850
Wire Wire Line
	4000 3550 4050 3550
Wire Wire Line
	1900 2050 1950 2050
Wire Wire Line
	1900 2700 1950 2700
Wire Wire Line
	1950 3350 1900 3350
Wire Wire Line
	1500 2050 1600 2050
Wire Wire Line
	1550 2100 1550 2050
Connection ~ 1550 2050
Wire Wire Line
	1500 2700 1600 2700
Wire Wire Line
	1550 2750 1550 2700
Connection ~ 1550 2700
Wire Wire Line
	1500 3350 1600 3350
Wire Wire Line
	1550 3400 1550 3350
Connection ~ 1550 3350
Wire Wire Line
	1550 2400 1550 2450
Wire Wire Line
	1550 3050 1550 3100
Wire Wire Line
	1550 3700 1550 3750
Wire Wire Line
	7400 1000 7500 1000
Wire Wire Line
	8500 1000 8600 1000
Wire Wire Line
	9700 1000 9800 1000
Wire Wire Line
	4000 3750 4050 3750
Wire Wire Line
	4000 3850 4050 3850
Wire Wire Line
	6400 2000 6450 2000
Wire Wire Line
	6400 2100 6450 2100
Wire Wire Line
	6600 3250 6700 3250
Wire Wire Line
	6700 3250 6700 3350
Wire Wire Line
	6300 3250 6250 3250
Wire Wire Line
	5950 3250 5900 3250
Wire Wire Line
	5600 3250 5550 3250
Wire Wire Line
	8700 3000 8700 3150
Connection ~ 8700 3150
$Comp
L TEST_1P W1
U 1 1 589B2A89
P 9000 2700
F 0 "W1" H 9000 2970 50  0000 C CNN
F 1 "TEST_1P" H 9000 2900 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Small" H 9200 2700 50  0001 C CNN
F 3 "" H 9200 2700 50  0000 C CNN
	1    9000 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 2850 8850 2950
Wire Wire Line
	8850 2950 8800 2950
Wire Wire Line
	8800 2950 8800 3250
Connection ~ 8800 3250
Wire Wire Line
	9000 2700 9000 3050
Wire Wire Line
	9000 3050 8900 3050
Wire Wire Line
	8900 3050 8900 3350
Connection ~ 8900 3350
Wire Wire Line
	6400 1600 6450 1600
$Comp
L SKRTLAE010 PB1
U 1 1 589B86E8
P 7750 950
F 0 "PB1" H 7750 950 60  0000 C CNN
F 1 "SKRTLAE010" H 7750 1050 60  0000 C CNN
F 2 "TactSwitch_ALPS:SKTDLDE010" H 7750 950 60  0001 C CNN
F 3 "" H 7750 950 60  0001 C CNN
	1    7750 950 
	1    0    0    -1  
$EndComp
$Comp
L SKRTLAE010 PB2
U 1 1 589B87B6
P 8850 950
F 0 "PB2" H 8850 950 60  0000 C CNN
F 1 "SKRTLAE010" H 8850 1050 60  0000 C CNN
F 2 "TactSwitch_ALPS:SKTDLDE010" H 8850 950 60  0001 C CNN
F 3 "" H 8850 950 60  0001 C CNN
	1    8850 950 
	1    0    0    -1  
$EndComp
$Comp
L SKRTLAE010 PB3
U 1 1 589B8854
P 10050 950
F 0 "PB3" H 10050 950 60  0000 C CNN
F 1 "SKRTLAE010" H 10050 1050 60  0000 C CNN
F 2 "TactSwitch_ALPS:SKTDLDE010" H 10050 950 60  0001 C CNN
F 3 "" H 10050 950 60  0001 C CNN
	1    10050 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1500 6450 1500
$EndSCHEMATC
