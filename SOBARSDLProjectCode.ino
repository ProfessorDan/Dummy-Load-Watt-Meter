/*
  Based on November 2017 QST article 
  Dummy load Watt meter By Jack Purdum, W8TEE, Al Peter, AC8GY.
  
  Hardware Redesign to use Full ADC range add High and Low range Watt Measurements
  With auto ranging 
  Low 0-20 watts
  High 20 to 150 
  add Battery / Power supply Monitor
  a Mode switch has been added for future use ( Display Mode what ever TBD )
  and added ADC Protection in circuit Redesign

  This is a full rewrite of the original code there will be similarities in H/W and Library’s 
*/

// Library Includes
#include <Wire.h>             // Standard IDE library file for I2C and SPI
#include <Adafruit_GFX.h>     // https://github.com/adafruit/Adafruit-GFX-Library
#include <Adafruit_SSD1306.h> // https://github.com/adafruit/Adafruit_SSD1306

// Defines
#define DEBUG                       // Uncomment to calibrate and debug enaples serial output USB Port

// Your Modifications Here
// Constants used in caculations Modify to meet your hardware requirements
#define LOADOHMS 50.1         // your 50 ohm loads actual resistance for caculations
#define NOMBATTERYVOLTAGE 9.0 // Typical Battery Voltage 3.0, 4.2, 9.0 etc
#define BATTERYLOW 7.5        // Typical Battery Low Voltage for aleart

// Correction Factors for Voltage Divider,  Modify to meet your hardware requirements
//Starting point ( adc hi / steps ) * ( volt div hi / adc hi)
// Example ( 5/1024)*(36/5)= 0.035190616  Starting point adjust using real values VIA DENUG Serial Port
//
#define CALIBRATIONHIGH 0.102040816 // High Range Volts per ADC step
#define CALIBRATIONLOW  0.039682539  // Low Range Volts per ADC step
#define CALIBRATIONBATT 0.021418439 // Battery reading Volts per ADC step

// Splash Screen Strings
#define LINE1 "       SOBARS " // 16 Char 4 Lines
#define LINE2 "     Dummy load"
#define LINE3 "    Spring Build"
#define LINE4 "        2019"

// END Your Modifications Mods Below this point require a good understanding of HW and SW

// Other Constants

#define DIODEVOLTAGEDROP 0.7 // Voltage drop for diode  typ 0.5 or 0.7 not likly to use
#define ADCLOOPCNT 8         // Number of readings per sample must be less than 64

// Hardware Defines:

#define OLED_RESET 4

// ADC channels
#define BATTERYVOLT A0
#define LOADLOW A1
#define LOADHI A2
#define ITERATIONS 8 // old
//#define SENSORPIN A1 // old

// MODE Button
#define MODESW A7 // A7  or  22  it is ANALOG ONLY
//#define MODESW        D13

// Global Variables
int BatteryADC = 0;    // Raw ADC value 0-1023
int LowRangeADC = 0;   // Raw ADC value 0-1023
int HighRangeADC = 0;  // Raw ADC value 0-1023
int ModeButtonADC = 0; // Raw ADC value 0-1023  digital
int RangeHI = 0;       // For Auto Range if 0 Low 0-25 if 1 0-150 range

float DisplayWatts = 0.0; // value to pass to the Display

////////////////////////////////////////////////////////////////////////////////



Adafruit_SSD1306 display(OLED_RESET);

int sensorValue = 0;  // the sensor value
int sensorMin = 1023; // minimum sensor value
int sensorMax = 0;    // maximum sensor value

//////////////////////////////////////////////////////////// snip examples /////////////////////
/*

void setup()
{
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT);
}
// read the state of the pushbutton value:
  buttonState = digitalRead(buttonPin);




Value = analogRead(PIN DEF); // Input analog pins

analogReference(INTERNAL);


*/

void setup()
{
#ifdef DEBUG
 Serial.begin(9600);
#endif
 
  // pinMode(MODESW, INPUT);  // its analog goof

  display.begin(SSD1306_SWITCHCAPVCC, 0x3C); // initialize with the I2C addr 0x3C (for the 128x32).
                                             // Your OLED might use a different frequency. Google
                                             // "Arduino I2C scanner" or look at:
                                             // http://playground.arduino.cc/Main/I2cScanner

  Splash();


  delay(4000);
  display.clearDisplay(); // Clear the graphics display buffer.
}

float ReadADC(int channel)
{
  long temp = 0;
  analogRead(channel);
  delay(10); // ADC Settling throw away first reading

  for (int i = ADCLOOPCNT; i; i--)
  {
    temp += analogRead(channel);
    //delay(5);
  }

  return (temp / ADCLOOPCNT);
}

// Read all channels and Update Global Variables
void UpdateAllADC()
{

  BatteryADC = ReadADC(BATTERYVOLT);

  LowRangeADC = ReadADC(LOADLOW);
  if (LowRangeADC > 400)
    RangeHI = 1;
  else
    RangeHI = 0;

  HighRangeADC = ReadADC(LOADHI);
  
 ModeButtonADC = ReadADC(MODESW);
 
//  if (ModeButtonADC < 100)
//    RangeHI = 1;
//  else
 //   RangeHI = 0;
}

// Displays Start up screen as defined above in definition section  (LINE 1-4)
void Splash()
{
  display.clearDisplay(); // Clear the graphics display buffer.
  display.setTextSize(1); //Set Small Font
  display.setTextColor(WHITE);
  display.setCursor(0, 0);
  display.println(LINE1);
  display.println(LINE2);
  display.println(LINE3);
  display.println(LINE4);
  display.display();
}

void TestXtalk()
{
  Serial.print("A0 A1 A2 A7:  Batt: ");
  Serial.print(analogRead(A0));
  Serial.print(",    Low: ");
  Serial.print(analogRead(A1));
  Serial.print(",    High: ");
  Serial.print(analogRead(A2));
  Serial.print(",    Mode: ");
  Serial.print(analogRead(A7));
  Serial.println("    EOL");
}

void TestCal()
{
  Serial.print("A0 A1 A2 A7: Batt: ");
  Serial.print(BatteryADC);
  Serial.print(" ");
  Serial.print((BatteryADC * CALIBRATIONBATT), 3);
  Serial.print(" VDC,   Low: ");
  Serial.print(LowRangeADC);
  Serial.print(" ");
  Serial.print((LowRangeADC * CALIBRATIONLOW ),3);
  Serial.print(" VDC,   High: ");
  Serial.print(HighRangeADC);
  Serial.print(" ");
  Serial.print((HighRangeADC * CALIBRATIONHIGH ),3);
  Serial.print(" VDC,   Mode: ");
  Serial.print(ModeButtonADC);
  Serial.println(" EOL");
  delay(50);
}

void loop()
{
  char buff[10];
  char buff2[10];
  char pad[] = "       "; // 7 spaces
  int where;
  // int i;
  float sum;
  float watts;

  sum = 0.0;


#ifdef DEBUG   // Only show if DEBUG mode set
  //TestXtalk(); // raw sensor
  TestCal();   // VDC with Cal Values
#endif
  //Watts = ReadWatts(); // Function  Reads the 2 ADC Channels sets Hi or Lo range and returns Caculated Watts
 
  
  UpdateAllADC();
  sum = BatteryADC * CALIBRATIONBATT;

  if(RangeHI)
  {
    watts = (((HighRangeADC * CALIBRATIONHIGH)*(HighRangeADC * CALIBRATIONHIGH)) / LOADOHMS);
    dtostrf((watts), 6, 1, buff); // Display XXX.X
  }
  else
  {
    watts = ((LowRangeADC * CALIBRATIONLOW)*(LowRangeADC * CALIBRATIONLOW) / LOADOHMS);
    dtostrf((watts), 6, 2, buff); // Display XX.XX
  }

  dtostrf(sum, 4, 1, buff2);

  where = strlen(buff);
  strcpy(&pad[6 - where], buff);
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0, 0);
  display.print("WATTS     Batt:");
  display.println(buff2);

  display.setTextSize(3); //Large Font
  where = (6 - where) * 10;
  display.setCursor(where, 10);
  display.println(buff);

  //display.setTextSize(1);
  //display.setCursor(102, 24);
 // display.println(buff2);
 display.display();
  //delay(10);
}

