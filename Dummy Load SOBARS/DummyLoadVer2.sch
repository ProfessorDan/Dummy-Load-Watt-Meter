EESchema Schematic File Version 4
LIBS:DummyLoadVer2-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Dummy Load Watt Meter "
Date "FEB 2019"
Rev "V2"
Comp "SOBARS Spring 2019 Club Build Project "
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x NANO1
U 1 1 5BEDA374
P 4050 3200
F 0 "NANO1" H 4050 2114 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4050 2023 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4200 2250 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4050 2200 50  0001 C CNN
	1    4050 3200
	1    0    0    -1  
$EndComp
$Comp
L pspice:CAP C2
U 1 1 5BEDA484
P 7450 2050
F 0 "C2" H 7628 2096 50  0000 L CNN
F 1 "CAP" H 7628 2005 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W4.2mm_P7.50mm_MKT" H 7450 2050 50  0001 C CNN
F 3 "" H 7450 2050 50  0001 C CNN
	1    7450 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5BEDA5D7
P 6850 1800
F 0 "R4" H 6920 1846 50  0000 L CNN
F 1 "56K" H 6920 1755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6780 1800 50  0001 C CNN
F 3 "~" H 6850 1800 50  0001 C CNN
	1    6850 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5BEDA6F3
P 6850 2300
F 0 "R5" H 6920 2346 50  0000 L CNN
F 1 "9K" H 6920 2255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6780 2300 50  0001 C CNN
F 3 "~" H 6850 2300 50  0001 C CNN
	1    6850 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:D D5
U 1 1 5BEDA7A0
P 7600 1650
F 0 "D5" H 7600 1866 50  0000 C CNN
F 1 "BAV21" H 7600 1775 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 7600 1650 50  0001 C CNN
F 3 "~" H 7600 1650 50  0001 C CNN
	1    7600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1950 6850 2050
Wire Wire Line
	6850 1650 7450 1650
Wire Wire Line
	7450 1650 7450 1800
Wire Wire Line
	7450 2450 7450 2300
Wire Wire Line
	6850 2050 6300 2050
Connection ~ 6850 2050
Wire Wire Line
	6850 2050 6850 2150
$Comp
L pspice:CAP C3
U 1 1 5C376734
P 7450 3400
F 0 "C3" H 7628 3446 50  0000 L CNN
F 1 "CAP" H 7628 3355 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W4.2mm_P7.50mm_MKT" H 7450 3400 50  0001 C CNN
F 3 "" H 7450 3400 50  0001 C CNN
	1    7450 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5C37673B
P 6850 3150
F 0 "R6" H 6920 3196 50  0000 L CNN
F 1 "62K" H 6920 3105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6780 3150 50  0001 C CNN
F 3 "~" H 6850 3150 50  0001 C CNN
	1    6850 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5C376742
P 6850 3650
F 0 "R7" H 6920 3696 50  0000 L CNN
F 1 "3.3K" H 6920 3605 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6780 3650 50  0001 C CNN
F 3 "~" H 6850 3650 50  0001 C CNN
	1    6850 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:D D6
U 1 1 5C376749
P 7600 3000
F 0 "D6" H 7600 3216 50  0000 C CNN
F 1 "BAV21" H 7600 3125 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 7600 3000 50  0001 C CNN
F 3 "~" H 7600 3000 50  0001 C CNN
	1    7600 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3300 6850 3400
Wire Wire Line
	6850 3000 7450 3000
Wire Wire Line
	7450 3000 7450 3150
Wire Wire Line
	7450 3800 7450 3650
Wire Wire Line
	6850 3400 6300 3400
Connection ~ 6850 3400
Wire Wire Line
	6850 3400 6850 3500
Wire Wire Line
	6850 2450 7150 2450
$Comp
L power:GND #PWR0101
U 1 1 5C377311
P 7150 2550
F 0 "#PWR0101" H 7150 2300 50  0001 C CNN
F 1 "GND" H 7155 2377 50  0000 C CNN
F 2 "" H 7150 2550 50  0001 C CNN
F 3 "" H 7150 2550 50  0001 C CNN
	1    7150 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5C377345
P 4550 4350
F 0 "#PWR0102" H 4550 4100 50  0001 C CNN
F 1 "GND" H 4555 4177 50  0000 C CNN
F 2 "" H 4550 4350 50  0001 C CNN
F 3 "" H 4550 4350 50  0001 C CNN
	1    4550 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3800 7150 3800
Wire Wire Line
	7150 2550 7150 2450
Connection ~ 7150 2450
Wire Wire Line
	7150 2450 7450 2450
Connection ~ 7450 3000
Connection ~ 7450 1650
$Comp
L Device:R R2
U 1 1 5C3783A8
P 5250 1500
F 0 "R2" H 5320 1546 50  0000 L CNN
F 1 "50K" H 5320 1455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5180 1500 50  0001 C CNN
F 3 "~" H 5250 1500 50  0001 C CNN
	1    5250 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5C378505
P 5250 1800
F 0 "R3" H 5320 1846 50  0000 L CNN
F 1 "50K" H 5320 1755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5180 1800 50  0001 C CNN
F 3 "~" H 5250 1800 50  0001 C CNN
	1    5250 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 1950 5250 2050
$Comp
L power:GND #PWR0103
U 1 1 5C378E40
P 5250 2050
F 0 "#PWR0103" H 5250 1800 50  0001 C CNN
F 1 "GND" H 5255 1877 50  0000 C CNN
F 2 "" H 5250 2050 50  0001 C CNN
F 3 "" H 5250 2050 50  0001 C CNN
	1    5250 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5C378E78
P 7150 3800
F 0 "#PWR0104" H 7150 3550 50  0001 C CNN
F 1 "GND" H 7155 3627 50  0000 C CNN
F 2 "" H 7150 3800 50  0001 C CNN
F 3 "" H 7150 3800 50  0001 C CNN
	1    7150 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5C378EB0
P 6300 3700
F 0 "#PWR0105" H 6300 3450 50  0001 C CNN
F 1 "GND" H 6305 3527 50  0000 C CNN
F 2 "" H 6300 3700 50  0001 C CNN
F 3 "" H 6300 3700 50  0001 C CNN
	1    6300 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5C378EE8
P 6300 2350
F 0 "#PWR0106" H 6300 2100 50  0001 C CNN
F 1 "GND" H 6305 2177 50  0000 C CNN
F 2 "" H 6300 2350 50  0001 C CNN
F 3 "" H 6300 2350 50  0001 C CNN
	1    6300 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4250 4150 4200
$Comp
L power:GND #PWR0107
U 1 1 5C37954A
P 5750 4550
F 0 "#PWR0107" H 5750 4300 50  0001 C CNN
F 1 "GND" H 5755 4377 50  0000 C CNN
F 2 "" H 5750 4550 50  0001 C CNN
F 3 "" H 5750 4550 50  0001 C CNN
	1    5750 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 5C3795A5
P 4250 2200
F 0 "#PWR0108" H 4250 2050 50  0001 C CNN
F 1 "+5V" H 4265 2373 50  0000 C CNN
F 2 "" H 4250 2200 50  0001 C CNN
F 3 "" H 4250 2200 50  0001 C CNN
	1    4250 2200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0109
U 1 1 5C3795DD
P 4850 4550
F 0 "#PWR0109" H 4850 4400 50  0001 C CNN
F 1 "+5V" H 4865 4723 50  0000 C CNN
F 2 "" H 4850 4550 50  0001 C CNN
F 3 "" H 4850 4550 50  0001 C CNN
	1    4850 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5C37960E
P 5000 4550
F 0 "R1" V 5207 4550 50  0000 C CNN
F 1 "4.7K" V 5116 4550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4930 4550 50  0001 C CNN
F 3 "" H 5000 4550 50  0001 C CNN
	1    5000 4550
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_Push MODE1
U 1 1 5C379706
P 5550 4550
F 0 "MODE1" H 5550 4835 50  0000 C CNN
F 1 "SW1" H 5550 4744 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 5550 4750 50  0001 C CNN
F 3 "" H 5550 4750 50  0001 C CNN
	1    5550 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4550 5200 4550
Wire Wire Line
	5200 4550 5200 3900
Connection ~ 5200 4550
Wire Wire Line
	5200 4550 5150 4550
$Comp
L Device:D_Schottky D4
U 1 1 5C37AB68
P 6300 3550
F 0 "D4" V 6254 3629 50  0000 L CNN
F 1 "1N5817" V 6345 3629 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 6300 3550 50  0001 C CNN
F 3 "~" H 6300 3550 50  0001 C CNN
	1    6300 3550
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D2
U 1 1 5C37ABB4
P 6300 2200
F 0 "D2" V 6254 2279 50  0000 L CNN
F 1 "1N5817" V 6345 2279 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 6300 2200 50  0001 C CNN
F 3 "~" H 6300 2200 50  0001 C CNN
	1    6300 2200
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 5C37AC28
P 6300 1900
F 0 "D1" V 6254 1979 50  0000 L CNN
F 1 "1N5817" V 6345 1979 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 6300 1900 50  0001 C CNN
F 3 "~" H 6300 1900 50  0001 C CNN
	1    6300 1900
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D3
U 1 1 5C37AC9E
P 6300 3250
F 0 "D3" V 6254 3329 50  0000 L CNN
F 1 "1N5817" V 6345 3329 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 6300 3250 50  0001 C CNN
F 3 "~" H 6300 3250 50  0001 C CNN
	1    6300 3250
	0    1    1    0   
$EndComp
Connection ~ 6300 2050
Connection ~ 6300 3400
Connection ~ 7150 3800
Wire Wire Line
	7150 3800 7450 3800
$Comp
L power:+5V #PWR0110
U 1 1 5C37D557
P 6300 1750
F 0 "#PWR0110" H 6300 1600 50  0001 C CNN
F 1 "+5V" H 6315 1923 50  0000 C CNN
F 2 "" H 6300 1750 50  0001 C CNN
F 3 "" H 6300 1750 50  0001 C CNN
	1    6300 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0111
U 1 1 5C37D59B
P 6300 3100
F 0 "#PWR0111" H 6300 2950 50  0001 C CNN
F 1 "+5V" H 6315 3273 50  0000 C CNN
F 2 "" H 6300 3100 50  0001 C CNN
F 3 "" H 6300 3100 50  0001 C CNN
	1    6300 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4250 4550 4250
Wire Wire Line
	4550 4250 4550 4350
Wire Wire Line
	7750 1650 8000 1650
Wire Wire Line
	5200 3900 4550 3900
Wire Wire Line
	5500 2050 5500 3300
Wire Wire Line
	5500 3300 4550 3300
Wire Wire Line
	5500 2050 6300 2050
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 5C381DE0
P 3650 1350
F 0 "J1" H 3756 1628 50  0000 C CNN
F 1 "Power" H 3756 1537 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3650 1350 50  0001 C CNN
F 3 "~" H 3650 1350 50  0001 C CNN
	1    3650 1350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male OLED1
U 1 1 5C381E58
P 7000 4350
F 0 "OLED1" H 6972 4323 50  0000 R CNN
F 1 "OLED Display 128X64" H 6972 4232 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 7000 4350 50  0001 C CNN
F 3 "~" H 7000 4350 50  0001 C CNN
	1    7000 4350
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5C381F2A
P 8800 2300
F 0 "J4" H 8772 2180 50  0000 R CNN
F 1 "To Dummy Load 50 Ohms" V 8772 2271 50  0000 L TNN
F 2 "Connector_Wire:SolderWirePad_1x02_P7.62mm_Drill2.5mm" H 8800 2300 50  0001 C CNN
F 3 "~" H 8800 2300 50  0001 C CNN
	1    8800 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5C382689
P 3850 1550
F 0 "#PWR0113" H 3850 1300 50  0001 C CNN
F 1 "GND" H 3855 1377 50  0000 C CNN
F 2 "" H 3850 1550 50  0001 C CNN
F 3 "" H 3850 1550 50  0001 C CNN
	1    3850 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5C3826D3
P 6750 4750
F 0 "#PWR0114" H 6750 4500 50  0001 C CNN
F 1 "GND" H 6755 4577 50  0000 C CNN
F 2 "" H 6750 4750 50  0001 C CNN
F 3 "" H 6750 4750 50  0001 C CNN
	1    6750 4750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0115
U 1 1 5C382724
P 4350 1250
F 0 "#PWR0115" H 4350 1100 50  0001 C CNN
F 1 "+5V" H 4365 1423 50  0000 C CNN
F 2 "" H 4350 1250 50  0001 C CNN
F 3 "" H 4350 1250 50  0001 C CNN
	1    4350 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0116
U 1 1 5C38276E
P 6650 4150
F 0 "#PWR0116" H 6650 4000 50  0001 C CNN
F 1 "+5V" H 6665 4323 50  0000 C CNN
F 2 "" H 6650 4150 50  0001 C CNN
F 3 "" H 6650 4150 50  0001 C CNN
	1    6650 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 1250 4350 1250
Wire Wire Line
	3850 1450 3950 1450
Wire Wire Line
	3950 1450 3950 1650
Wire Wire Line
	3850 1350 4150 1350
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5C38B403
P 4350 1650
F 0 "J2" H 4322 1530 50  0000 R CNN
F 1 "Batt Monitor" H 4322 1621 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 4350 1650 50  0001 C CNN
F 3 "~" H 4350 1650 50  0001 C CNN
	1    4350 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	4150 1650 3950 1650
Connection ~ 3950 1650
Wire Wire Line
	3950 1650 3950 2200
Wire Wire Line
	6650 4150 6650 4550
Wire Wire Line
	6650 4550 6800 4550
Wire Wire Line
	6800 4450 6750 4450
Wire Wire Line
	6750 4450 6750 4750
Wire Wire Line
	4550 3400 6300 3400
Wire Wire Line
	6800 4250 6000 4250
Wire Wire Line
	6000 4250 6000 3600
Wire Wire Line
	6000 3600 4550 3600
Wire Wire Line
	6800 4350 5900 4350
Wire Wire Line
	5900 4350 5900 3700
Wire Wire Line
	5900 3700 4550 3700
Wire Wire Line
	7750 3000 8000 3000
Wire Wire Line
	4150 1350 4150 1550
Wire Wire Line
	4150 1350 5250 1350
Connection ~ 4150 1350
Wire Wire Line
	5250 1650 5100 1650
Wire Wire Line
	5100 1650 5100 3200
Wire Wire Line
	5100 3200 4550 3200
Connection ~ 5250 1650
Text Label 3350 1600 0    50   ~ 0
Ground
Text Label 3300 1500 0    50   ~ 0
6-9VDC
Text Label 3050 1400 0    50   ~ 0
BatteryMonitor
Text Label 3400 1300 0    50   ~ 0
5VDC
Text Notes 2900 1000 0    50   Italic 0
See Documentation on Power Supply Options and Battery Monitoring Options
$Comp
L power:+5V #PWR0117
U 1 1 5C3B5B11
P 3050 1900
F 0 "#PWR0117" H 3050 1750 50  0001 C CNN
F 1 "+5V" H 3065 2073 50  0000 C CNN
F 2 "" H 3050 1900 50  0001 C CNN
F 3 "" H 3050 1900 50  0001 C CNN
	1    3050 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5C3B5B64
P 3050 2200
F 0 "#PWR0118" H 3050 1950 50  0001 C CNN
F 1 "GND" H 3055 2027 50  0000 C CNN
F 2 "" H 3050 2200 50  0001 C CNN
F 3 "" H 3050 2200 50  0001 C CNN
	1    3050 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5C3B5BC5
P 3050 2050
F 0 "C1" H 3165 2096 50  0000 L CNN
F 1 "4.7 " H 3165 2005 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 3088 1900 50  0001 C CNN
F 3 "~" H 3050 2050 50  0001 C CNN
	1    3050 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 1650 8000 2150
$Comp
L power:GND #PWR0112
U 1 1 5C3CE209
P 9000 2400
F 0 "#PWR0112" H 9000 2150 50  0001 C CNN
F 1 "GND" H 9005 2227 50  0000 C CNN
F 2 "" H 9000 2400 50  0001 C CNN
F 3 "" H 9000 2400 50  0001 C CNN
	1    9000 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2150 9000 2150
Wire Wire Line
	9000 2150 9000 2300
Connection ~ 8000 2150
Wire Wire Line
	8000 2150 8000 3000
$EndSCHEMATC
