    int mapping_for_left = 0;
int mapping_for_right = 0;
int th1=Afront_min[1]+100;
int th7=Afront_min[7]+100;
int line;
int line_follow_green() 
{
// code for following line in front direction in green zone

  
//----------------This is actual algorithm for mapping all sesnor value----------------------//
 
           mapping_for_left = map(analogRead(A2),Afront_min[2],Afront_max[2],0,255);
           mapping_for_right = map(analogRead(A6),Afront_min[6],Afront_max[6],0,255);

//----------------Robocon 2012-----------Finished---------------Pang On Diagate -------------//
    analogWrite(left_frwd , mapping_for_left); // write data to the motors
    analogWrite(right_frwd , mapping_for_right);
     analogWrite(omni_left_frwd , mapping_for_left); // write data to the motors
    analogWrite(omni_right_frwd , mapping_for_right);
    
     if((analogReadavg(0) < ( Afront_min[0] + 50 )) && (analogReadavg(8) < ( Afront_min[8] + 50 )))
     {

       while((analogReadavg(0) < ( Afront_min[0] + 50 )) && (analogReadavg(8) < ( Afront_min[8] + 50 ))); // wait untill robot comes out of white line

       return 0;
     }
    else return 1;
}

void line_follow_red()
{
// code for following line in front direction in red zone
}

void line_follow_blue()
{
// code for following line in front direction in blue zone
}

void line_follow_gray()
{
// code for following line in front direction in gray zone
}
int line_follow()
{
  
  if(analogRead(1)>th1 && analogRead(7)>th7)
  {
    forward();
  }
  else if(analogRead(1)<th1)
  {
    line=map(analogRead(1),Afront_min[1],th1,100,255);
    analogWrite(left_frwd,255);
    analogWrite(right_frwd,0);
    analogWrite(omni_left_frwd,255);
    analogWrite(omni_right_frwd,0);
  }
   else if(analogRead(7)<th7)
  {
    line=map(analogRead(7),Afront_min[7],th7,100,255);
    analogWrite(left_frwd,0);
    analogWrite(right_frwd,255);
    analogWrite(omni_left_frwd,0);
    analogWrite(omni_right_frwd,255);
  }
  if((analogReadavg(0) < ( Afront_min[0] + 50 )) && (analogReadavg(8) < ( Afront_min[8] + 50 )))
     {

       while((analogReadavg(0) < ( Afront_min[0] + 50 )) && (analogReadavg(8) < ( Afront_min[8] + 50 ))); // wait untill robot comes out of white line

       return 0;
     }
    else return 1;
    stop_bot();
}

void stop_bot()
{
 
   digitalWrite(left_frwd,0);
   digitalWrite(left_bkwd,0);
   digitalWrite(omni_left_frwd,0);
   digitalWrite(omni_left_bkwd,0);
   digitalWrite(right_frwd,0);
   digitalWrite(right_bkwd,0);
   digitalWrite(omni_right_frwd,0);
   digitalWrite(omni_right_bkwd,0);
   
}
void forward()
{
  digitalWrite(omni_left_bkwd,0);
  digitalWrite(omni_left_frwd,255);
  digitalWrite(omni_right_bkwd,0);
  digitalWrite(omni_right_frwd,255);
  //digitalWrite(8,0);
  digitalWrite(left_frwd,255);
  digitalWrite(left_bkwd,0);
  digitalWrite(right_bkwd,0);
  digitalWrite(right_frwd,255);  
}

void backward()
{
  digitalWrite(omni_left_bkwd,255);
  digitalWrite(omni_left_frwd,0);
  digitalWrite(omni_right_bkwd,255);
  digitalWrite(omni_right_frwd,0);
  //digitalWrite(8,0);
  digitalWrite(left_frwd,0);
  digitalWrite(left_bkwd,255);
  digitalWrite(right_bkwd,255);
  digitalWrite(right_frwd,0);  
}

void motor_test()
{
     
digitalWrite(left_frwd,1);
delay(1000);
stop_bot();
delay(500);
digitalWrite(left_bkwd,1);
delay(1000);
stop_bot();
delay(500);
digitalWrite(right_frwd,1);
delay(1000);
stop_bot();
delay(500);
digitalWrite(right_bkwd,1);
delay(1000);
stop_bot();
delay(500);

digitalWrite(omni_left_frwd,1);
delay(1000);
stop_bot();
delay(500);
digitalWrite(omni_left_bkwd,1);
delay(1000);
stop_bot();
delay(500);
digitalWrite(omni_right_frwd,1);
delay(1000);
stop_bot();
delay(500);
digitalWrite(omni_right_bkwd,1);
delay(1000);
stop_bot();
delay(500);

}
