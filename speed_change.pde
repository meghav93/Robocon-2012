void high_speed()
{
  // Relay will turn on and will go for 24 V
   digitalWrite(23,0);
   digitalWrite(25,0);
   delay(5);
   
   digitalWrite(23,1);
   digitalWrite(25,0);
   delay(10);
   
}

void low_speed()
{
  // Relay will turn off, 12 V
   digitalWrite(23,0);
   digitalWrite(25,0);
   delay(5); 
}
