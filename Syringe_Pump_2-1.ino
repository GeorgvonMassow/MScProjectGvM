/****************************************************************************** 
Syringe pump v1
Timothy Pullen

Syring pump controller using the Big Easy Driver (https://www.sparkfun.com/products/12859) and a bipolar stepper motor.

Development environment specifics:
Written in Arduino 1.6.0

Example based off of demos by Brian Schmalz (designer of the Big Easy Driver).
http://www.schmalzhaus.com/EasyDriver/Examples/EasyDriverExamples.html
******************************************************************************/
//Declare pin functions on Arduino
//Motor Driver Pins
#define stp 2
#define dir 3
#define MS1 4
#define MS2 5
#define MS3 6
#define EN  7

//User Interface Pins
#define start_b 8
#define stop_b 9
#define dir_b 10
#define speed_dec_b 11
#define speed_inc_b 12
#define fast_b A0
#define dir_l 13

//Declare variables for functions
int x;
byte motorRun = LOW;
byte motorFast = LOW;
int motorSpeed = 0;
byte motorDir = LOW;
byte stop_b_state = HIGH;
byte dir_b_state = HIGH;
byte speed_dec_b_state = HIGH;
byte speed_inc_b_state = HIGH;
byte fast_b_state = HIGH;
//  int speed_incs[] = {160, 80, 40, 10, 5, 1};
//  int speed_count = 6;
int speed_delay_min = 5;
int speed_delay_max = 155;
int speed_incr = 10;
int speed_delay = 55;
int fastInterval = 1; // step delay when fast button pressed
int stepInterval; // step delay - controlled by speed buttons
const int buttonInterval = 300;
const int displayInterval = 1000;
unsigned long previous_start_b_Millis = 0;   // will store last time the start button was pressed
unsigned long previous_stop_b_Millis = 0;
unsigned long previous_speed_b_Millis = 0;  // only need one variable for both speed buttons
unsigned long previous_dir_b_Millis = 0;
unsigned long previous_display_Millis = 0;
unsigned long previous_step_Millis = 0;

void setup() {
  pinMode(stp, OUTPUT);
  pinMode(dir, OUTPUT);
  pinMode(MS1, OUTPUT);
  pinMode(MS2, OUTPUT);
  pinMode(MS3, OUTPUT);
  pinMode(EN, OUTPUT);
  pinMode(start_b, INPUT_PULLUP);
  pinMode(stop_b, INPUT_PULLUP);
  pinMode(dir_b, INPUT_PULLUP);
  pinMode(speed_dec_b, INPUT_PULLUP);
  pinMode(speed_inc_b, INPUT_PULLUP);
  pinMode(fast_b, INPUT_PULLUP);
  pinMode(dir_l, OUTPUT);
  resetBEDPins(); //Set step, direction, microstep and enable pins to default states
  digitalWrite(EN, LOW); //Pull enable pin low to set FETs active and allow motor control
  //  Serial.begin(9600); //Open Serial connection for debugging
  //  Serial.println("Syringe Pump Control");
  //  Serial.println();
  // digitalWrite(MS1, HIGH); // TEMP change to half step
}

//Main loop
void loop() {
  readButtons();
  setMotorDirSpeed();
  MotorStep();
  //  DebugOut();
}

//Reset Big Easy Driver pins to default states
void resetBEDPins()
{
  digitalWrite(stp, LOW);
  digitalWrite(dir, LOW);
  digitalWrite(MS1, LOW);
  digitalWrite(MS2, LOW);
  digitalWrite(MS3, LOW);
  digitalWrite(EN, HIGH);
}

//Reset control variables
void resetVars()
{
  motorRun = LOW;
  //  motorSpeed = 0;
  motorDir = LOW;
}

//Read Buttons
void readButtons()
{
  // read state of start, stop, dir and speed buttons

  //Start button
  if (millis() - previous_start_b_Millis >= buttonInterval){
    if (digitalRead(start_b) == LOW) {
      motorRun = ! motorRun; // switches motorRun (HIGH/LOW) on button press
      previous_start_b_Millis = millis();
    }
  }

  //Stop button
  if (millis() - previous_stop_b_Millis >= buttonInterval){
    if (digitalRead(stop_b) == LOW) {
      motorRun = LOW;
      previous_stop_b_Millis = millis();
    }
  }

  //Dir button
  if (millis() - previous_dir_b_Millis >= buttonInterval){
    if (digitalRead(dir_b) == LOW) {
      motorDir = ! motorDir; // switches motorDir (HIGH/LOW) on button press
      digitalWrite(dir_l, ! motorDir);
      previous_dir_b_Millis = millis();
    }
  }

  //Speed buttons
  if (millis() - previous_speed_b_Millis >= buttonInterval){
    if (digitalRead(speed_dec_b) == LOW) {
      if (digitalRead(speed_inc_b) == HIGH) {
        // only dec button pressed
        if (speed_delay < speed_delay_max) {
          speed_delay = speed_delay + speed_incr;
        }
      }
    } else {
      if(digitalRead(speed_inc_b) == LOW) {
        // inc button pressed
        if (speed_delay > speed_delay_min) {
          speed_delay = speed_delay - speed_incr;
        }
      }
    }
    previous_speed_b_Millis = millis();
  }

  //Fast button
  if (digitalRead(fast_b) == LOW) {
      motorFast = HIGH;
  } else {
    motorFast = LOW;
  }
}

// Set motor direction and speed
void setMotorDirSpeed()
{
  digitalWrite(dir, motorDir); //Pull direction pin low for "forward" or high for "reverse" according to motorDir
  stepInterval = speed_delay;
}

//Motor Step
void MotorStep()
{
  if (motorFast == HIGH) {
    if (millis() - previous_step_Millis >= fastInterval) {
      digitalWrite(stp,HIGH); //Trigger one step 
      delay(1);
      digitalWrite(stp,LOW); //Pull step pin low so it can be triggered again
      previous_step_Millis = millis();
    }
  } else {
      if (motorRun == HIGH) {
      if (millis() - previous_step_Millis >= stepInterval) {
        digitalWrite(stp,HIGH); //Trigger one step 
        delay(1);
        digitalWrite(stp,LOW); //Pull step pin low so it can be triggered again
        previous_step_Millis = millis();
      }
    }
  } 
}

// Debug output to serial
void DebugOut()
{
  if (millis() - previous_display_Millis >= displayInterval) {
    Serial.print("Run: ");
    Serial.print(motorRun);
    Serial.print("  Direction: ");
    Serial.print(motorDir);
    Serial.print("  stepInterval: ");
    Serial.print(stepInterval);
    Serial.print("  Millis: ");
    Serial.print(millis());
    Serial.println();
    previous_display_Millis = millis();
  }
}
