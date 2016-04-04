
//library testing......
//

#include <EEPROM.h>
#include <IRremote.h>

IRsend irsend;

// pass global variables here
//----------------------------------------
int Afront_max[] = {0,0,0,0,0,0,0,0,0}; // all maxima and minima for front sensor array
int Afront_min[] = {0,0,0,0,0,0,0,0,0};
int Arear_max[] = {0,0,0,0,0,0,0}; // all max and minima for rear sesnor array
int Arear_min[] = {0,0,0,0,0,0,0};
int eeprom_add=0; // this eeprom address will very from 0 to 31 ;
int calibration_time = 15000; // this variable define that how much time we need to move the robot around
//----------------------------------------
//all motor pins
int left_frwd = 5;
int left_bkwd = 4;
int right_frwd = 2;
int right_bkwd = 3;
// all OMNI wheel motors
int omni_left_frwd = 10;
int omni_right_bkwd = 12;
int omni_right_frwd = 8;
int omni_left_bkwd = 11;
// Keyboard switch
int key1=45;       // Pick up the first cup
int key2=43;       // pick up the second cup   
int key3=41;       // Start the bot after the collector is placed on autonomus 
int key4=39;       
int key_gnd=47;
int state=0;
//----------------------------------------
//LEDs pins

int lcd_clear=12;
int wall1;
int current_time;
//----------------------------------------


void setup()
{
   
   initialize_autonomous();  // initialize pin direction and all other task
   Serial.println("I am ready !!");
   delay(1000);
  // front_rear_sensor_calibration('G');
   
   front_rear_sensor_eeprom('G');
   lcd_initialize();
  // fork_initialize();
 
   
}

void loop()
{
 
 
    if(digitalRead(key1)==0 || digitalRead(key2)==0)
    {
      fork_initialize();
      high_speed();
      while(1)
      {
        if(digitalRead(key1)==0)
        {
          first_cup();
        }
        else if(digitalRead(key2)==0)
        {
          second_cup();
        }
      }    
    } 
    
    else if(digitalRead(key3)==0)
    {
      reset_1();
    } 
    else if(digitalRead(key4)==0)
    {
      reset_2();
    } 
    

}

void first_cup()
{
     for(int i=0;i<255;i++)
 {
 
  analogWrite(omni_left_bkwd,0);
  analogWrite(omni_left_frwd,i);
  analogWrite(omni_right_bkwd,0);
  analogWrite(omni_right_frwd,i);
  //digitalWrite(8,0);
  analogWrite(left_frwd,i);
  analogWrite(left_bkwd,0);
  analogWrite(right_bkwd,0);
  analogWrite(right_frwd,i);
  delay(1);
 }  
      task_1();
      stop_bot();
      
    while(sense_key1());
    
        task_2();
        stop_bot(); 
        task_3();
        stop_bot(); 
        task_4();
        stop_bot();
        task_5();
        stop_bot();
       
    
    while(1)
      {
        go_frodo_go();
      }  


}
void second_cup()
{
  
    for(int i=0;i<255;i++)
 {
 
  analogWrite(omni_left_bkwd,0);
  analogWrite(omni_left_frwd,i);
  analogWrite(omni_right_bkwd,0);
  analogWrite(omni_right_frwd,i);
  //digitalWrite(8,0);
  analogWrite(left_frwd,i);
  analogWrite(left_bkwd,0);
  analogWrite(right_bkwd,0);
  analogWrite(right_frwd,i);
  delay(1);
 }  
    task_second();
    stop_bot();
   
     while(sense_key1());
    
        task_2();
        stop_bot(); 
        task_3();
        stop_bot(); 
        task_4();
        stop_bot();
        task_5();
        stop_bot();
       
    
    while(1)
      {
        go_frodo_go();
      }  
    
    
}

void reset_1()
{
  task_reset1();
  stop_bot();
  
  // while(sense_key1());
    
        task_2();
        stop_bot(); 
        task_3();
        stop_bot(); 
        task_4();
        stop_bot();
        task_5();
        stop_bot();
       
    
    while(1)
      {
        go_frodo_go();
      }  
  
  
}

void reset_2()
{
     for(int i=0;i<255;i++)
 {
 
  analogWrite(omni_left_bkwd,0);
  analogWrite(omni_left_frwd,i);
  analogWrite(omni_right_bkwd,0);
  analogWrite(omni_right_frwd,i);
  //digitalWrite(8,0);
  analogWrite(left_frwd,i);
  analogWrite(left_bkwd,0);
  analogWrite(right_bkwd,0);
  analogWrite(right_frwd,i);
  delay(1);
 }  
    task_reset_2();
    stop_bot();
    
    task_5();
    stop_bot();
    delay(100);
    
    
    
    
    while(1)
    {
      go_frodo_go();
    }
}






void initialize_autonomous()
{
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(7,OUTPUT);
  pinMode(8,OUTPUT);
  pinMode(9,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(13,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(12,OUTPUT);
  pinMode(23,OUTPUT);
  pinMode(25,OUTPUT);  
  pinMode(47,INPUT);    
  pinMode(49,INPUT);
  pinMode(51,OUTPUT);
  pinMode(53,INPUT);

pinMode(key1,INPUT);
pinMode(key2,INPUT);
pinMode(key3,INPUT);
pinMode(key4,INPUT);
pinMode(key_gnd,OUTPUT);

digitalWrite(key1,HIGH);
digitalWrite(key2,HIGH);
digitalWrite(key3,HIGH);
digitalWrite(key4,HIGH);
digitalWrite(key_gnd,LOW);
digitalWrite(9,LOW);
  pinMode(15,OUTPUT);
  
  
  
  digitalWrite(2,0);
  digitalWrite(3,0);
  digitalWrite(4,0);
  digitalWrite(5,0);
  digitalWrite(6,0);
  digitalWrite(7,0);
  digitalWrite(8,0);
  digitalWrite(9,0);
  digitalWrite(10,0);
  digitalWrite(11,0);
  digitalWrite(12,0);
  digitalWrite(13,0);
  digitalWrite(23,0);
  digitalWrite(25,0);
  digitalWrite(47,0);
  digitalWrite(49,0);
  digitalWrite(51,0);
  digitalWrite(53,1);


  digitalWrite(15,0);
 
  
  Serial.begin(115200);
  Serial3.begin(9600);
  Serial1.begin(300);
  
  low_speed();
}


