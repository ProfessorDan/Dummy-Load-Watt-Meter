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
#include <Wire.h>             // Standard IDE library file
#include <Adafruit_GFX.h>     // https://github.com/adafruit/Adafruit-GFX-Library
#include <Adafruit_SSD1306.h> // https://github.com/adafruit/Adafruit_SSD1306

// Your Modifications Here
// Constants used in caculations Modify to meet your hardware requirements
#define LOADOHMS 50.0  // your 50 ohm loads actual resistance fo caculations
#define NOMBATTERYVOLTAGE 3.0   // Typical Battery Voltage 3.0, 4.2, 9.0 etc 
#define BATTERYLOW 2.5   // Typical Battery Low Voltage for aleart 

// Correction Factors for Voltage Divider,  Modify to meet your hardware requirements
#define CALIBRATIONHIGH 0.008704 // High Range Calibration 
#define CALIBRATIONLOW 0.008704 // Low Range Calibration
#define CALIBRATIONBATT 0.02  // Battery reading Calibration

// Splash Screen Strings
#define LINE1 "   SOBARS "  // 16 Char 4 Lines
#define LINE2 "Dummy load"
#define LINE3 "Spring Build"
#define LINE4 "   2019"

// END Your Modifications


// Other Constants
#define DIODEVOLTAGEDROP 0.7       // Voltage drop for diode  typ 0.5 or 0.7
#define ADCLOOPCNT 16  // Number of readings per sample must be less than 64

// Hardware Defines:

// ADC channels 
#define BATTERYVOLT A0 
#define LOADLOW A1 
#define LOADHI A2

// MODE Button
#define MODESW A7  // A7  or  19  it is ANALOG ONLY 

// Global Variables
int BatteryADC;  // Raw ADC value 0-1023
int LowRangeADC;  // Raw ADC value 0-1023
int HighRangeADC;  // Raw ADC value 0-1023
int ModeButtonADC;  // Raw ADC value 0-1023
float DisplayWatts; // value to pass to the Display

////////////////////////////////////////////////////////////////////////////////
//#define OLED_RESET 4

//#define DEBUG                       // Uncomment to calibrate and debug

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




*/

float ReadADC(int channel)
{
  long temp = 0;
  analogRead(channel);
  delay(10); // ADC Settling throw away first reading

  for(int i=ADCLOOPCNT;i;i--)
  { 
    temp+=analogRead(channel);
    delay(10);
  }
  return(temp/ITERATIONS)
}

// Read all channels and Update Global Variables
void UpdateAllADC()
{
    
    BatteryADC = ReadADC(BATTERYVOLT);
    LowRangeADC = ReadADC(LOADLOW);
    HighRangeADC = ReadADC(HighRangeADC);
    ModeButtonADC = ReadADC(MODESW);

}


/*****
  Purpose: A simple splash sceen to show who developed the DL. Feel free to
           change to whatever your want.\, but comment out the old code and
           replace with your code.
           
  Parameter list:
    void
    
  Return value:
    void
    
*****/
void Splash()
{
  display.clearDisplay(); // Clear the graphics display buffer.
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0, 0);
  display.println(" GCBG DUMMY LOAD");
  display.println("       by");
  display.println(" Al Peter, AC8GY");
  display.println("Jack Purdum, W8TEE");
  display.display();
  /*  If you want to use your name and call on the splash
      screen, comment out the above (don't remove it) and
      replace with something like this:
  display.setCursor(0, 1);
  display.println(" GCBG DUMMY LOAD");
  display.println("    built by");
  display.println("Steve Ford, W1AW");
  display.display();
   */
}

void setup()
{
#ifdef DEBUG
  
#endif
Serial.begin(9600);
// pinMode(MODESW, INPUT);  // its analog goof 

  display.begin(SSD1306_SWITCHCAPVCC, 0x3C); // initialize with the I2C addr 0x3C (for the 128x32).
                                             // Your OLED might use a different frequency. Google
                                             // "Arduino I2C scanner" or look at:
                                             // http://playground.arduino.cc/Main/I2cScanner

  Splash();

#ifdef DEBUG // Probably only need to call once to tweak things. Uncomment DEBUG line above
  Calibrate();
#endif
  delay(4000);
  display.clearDisplay(); // Clear the graphics display buffer.
}

void loop()
{
  char buff[10];
  char pad[] = "       "; // 7 spaces
  int where;
  int i;
  float sum;
  float watts;

  sum = 0.0;
  i = 0;
  while (i < ITERATIONS)
  {
    sensorValue = analogRead(SENSORPIN); // Input from voltage divider
    delay(10);                           // Let pin settle
    watts = CalculateWatts(sensorValue);
    sum += watts;
    i++;
  }
  sum /= ITERATIONS;

  dtostrf(sum, 4, 2, buff);

  where = strlen(buff);
  strcpy(&pad[6 - where], buff);
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0, 0);
  display.println("      WATTS IN");
  display.setTextSize(3);
  where = (6 - where) * 10;
  display.setCursor(where, 10);
  display.println(buff);
  display.display();
  delay(1000);
}

/*****
  Purpose: To convert the value read from the DL and convert it to watts

  Parameter list:
    int sensorValue       the value read on the analog input pin

  Return value:
    float               the calculated watts
*****/
float CalculateWatts(int sensorValue)
{
  float temp;

  temp = sensorValue + DIODEVOLTAGEDROP; // add back diode voltage drop
  temp = sensorValue;
  temp *= temp;            // Square for power
  temp /= MYDUMMYLOADOHMS; // Replace with your measured resistance

  return temp * CALIBRATIONOFFSET;
}

/*****
  Purpose: To figure out calibration constant, See book for details.

  Parameter list:
    void

  Return value:
    void
*****/

void Calibrate()
{
  int i = ITERATIONS; // We're going to get a series of readings

  while (i--)
  {
    sensorValue = analogRead(SENSORPIN);
    delay(100); // Settle between readings...
    if (sensorValue > sensorMax)
    { // record the maximum sensor value
      sensorMax = sensorValue;
    }
    if (sensorValue < sensorMin)
    { // record the minimum sensor value
      sensorMin = sensorValue;
    }
  }
#ifdef DEBUG // Only show if DEBUG mode set
  Serial.print("sensorValue = ");
  Serial.print(sensorValue);
  Serial.print("   sensorMin = ");
  Serial.println(sensorMin);
#endif
}
