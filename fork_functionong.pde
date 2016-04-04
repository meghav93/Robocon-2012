int fork_motor_up = 6; // give high on pin 9 to lift up fork
int fork_motor_down = 7; // give hign on pin 8 to lift down fork
int fork_uptime = 2200; // time delay for fork up when cup is there
int fork_uptime_collector=2600; //time delay for fork up to set the collector
int limit_switch = 53; // the pin to be read for fork limit 

void fork_down()
{
  // first make all zero
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);
  
  // now wait for limti switch to be presses
  while(digitalRead(limit_switch))
  {
    digitalWrite(fork_motor_up,LOW);
    digitalWrite(fork_motor_down,HIGH);
  }

  // ok now limit switch is pressed ,
  // now turn motor up for few millis so 
  // that jerk of fork is neglected
 
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);
  
  digitalWrite(fork_motor_up,1);
  digitalWrite(fork_motor_down,0);
  delay(100);
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);

}

void fork_up()
{
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);
  
  digitalWrite(fork_motor_up,1);
  digitalWrite(fork_motor_down,0);
  delay(fork_uptime);
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);
}
void fork_up_for_colloector()
{
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);
  
  digitalWrite(fork_motor_up,1);
  digitalWrite(fork_motor_down,0);
  delay(fork_uptime_collector);
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);
}  
void fork_test()
{
  fork_down();
  
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);
  
  digitalWrite(fork_motor_up,1);
  digitalWrite(fork_motor_down,0);
  delay(800);
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);
  
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,1);
  delay(800);
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);
  
  digitalWrite(fork_motor_up,1);
  digitalWrite(fork_motor_down,0);
  delay(800);
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);
  
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,1);
  delay(800);
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);
}
  
void fork_initialize()
{
   
   fork_down();
   
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);
  
  digitalWrite(fork_motor_up,1);
  digitalWrite(fork_motor_down,0);
  delay(800);
  digitalWrite(fork_motor_up,0);
  digitalWrite(fork_motor_down,0);
  
}
