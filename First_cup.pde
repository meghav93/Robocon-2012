
void task_1()
{
 
   while(wall_follow_right_blank());
   stop_bot();
   //low_speed();
   fork_up();
   
   stop_bot();
    analogWrite(right_bkwd,200);
    analogWrite(left_bkwd,200);
    analogWrite(omni_right_bkwd,200);
    analogWrite(omni_left_bkwd,200);
    delay(500);
    stop_bot();
  
   
   while(wall_follow_right_rev_blank());
   stop_bot();
   delay(100);
   stop_bot();
     
////--------------------------------Robot is now back ----------------------------  
    analogWrite(right_frwd,150);
    analogWrite(left_bkwd,255);
    analogWrite(omni_right_frwd,150);
    analogWrite(omni_left_bkwd,255);
    while(analogReadavg(12)>100);

    while(!((analogReadavg(10) - analogReadavg(4))< 40));
    
   stop_bot(); 
   delay(200);
    while(wall_follow_left_blank());
   stop_bot();   
    forward();
    delay(100);
    stop_bot();
   fork_down();
    stop_bot(); 
    
   while(wall_follow_left_rev_blank());
    stop_bot();
    
   fork_up_for_colloector();
   
     analogWrite(right_frwd,255);
    analogWrite(left_frwd,50);
    analogWrite(omni_right_frwd,255);
    analogWrite(omni_left_frwd,50);
    delay(400);
    stop_bot();
    
     analogWrite(right_frwd,100);
    analogWrite(left_frwd,255);
    analogWrite(omni_right_frwd,100);
    analogWrite(omni_left_frwd,255);
    delay(500);
    stop_bot();
    
//    backward();
//    while(analogReadavg(13)<600);
//    stop_bot();
    
 
  
}

//put collector
void task_2()
{
      stop_bot();
      
      turn_right();
      delay(900);
      stop_bot();
      analogWrite(left_frwd,150);
      analogWrite(omni_left_frwd,150);
      analogWrite(right_frwd,255);
      analogWrite(omni_right_frwd,255);
      while(analogReadavg(4)<300);
      stop_bot();
      
      analogWrite(left_frwd,255);
      analogWrite(omni_left_frwd,255);
      analogWrite(right_frwd,100);
      analogWrite(omni_right_frwd,100);
      while((analogReadavg(4)-analogReadavg(10))>40);
      stop_bot();
      delay(100);
      
      while(analogReadavg(4)>150)
      {
        wall_follow_left();
      }
      stop_bot();
      

      analogWrite(left_frwd,255);
      analogWrite(right_frwd,255);
      analogWrite(omni_left_frwd,255);
      analogWrite(omni_right_frwd,255);
      while(analogReadavg(10)>150);
      delay(100);
      stop_bot();
      
      forward();
      delay(200);
      
}

void task_3()
{ 
      stop_bot();
      delay(100);
      
      analogWrite(right_frwd,255);
      analogWrite(left_bkwd,150);
      analogWrite(omni_right_frwd,255);
      analogWrite(omni_left_bkwd,150);
      delay(1400);
      stop_bot();
      delay(100);
      
      analogWrite(left_frwd,255);
      analogWrite(right_frwd,255);
      analogWrite(omni_left_frwd,255);
      analogWrite(omni_right_frwd,255);
      delay(600);
      stop_bot();

}
void task_4()
{
    
  while(analogReadavg(4)>150)
  {
    wall_follow_left();
  }
   stop_bot();
   delay(200);
   
    analogWrite(right_bkwd , 255); // write data to the motors
    analogWrite(omni_right_bkwd , 255);
    analogWrite(omni_left_frwd , 255);
    analogWrite(left_frwd , 255);
    delay(300);
    
    stop_bot();
     
     while(analogReadavg(15)<300)   
     {
       
         analogWrite(left_frwd , 200); // write data to the motors
         analogWrite(omni_left_frwd , 200);
         analogWrite(omni_right_frwd , 255);
         analogWrite(right_frwd , 255);
     }
   stop_bot();
   delay(500);
 

}
void task_5()
{
    analogWrite(left_bkwd,200);
    analogWrite(right_bkwd,200);
    analogWrite(omni_left_bkwd,200);
    analogWrite(omni_right_bkwd,200);
    delay(300);
    stop_bot();
 
    turn_left();
    delay(1800);
    stop_bot();
    delay(200);

     while(analogReadavg(13)<600)
     {
       backward();
     }    
     delay(500);
     stop_bot();
     
}


void go_frodo_go()
{   
     irsend.sendSony(0xa90, 12); // Sony TV power code
      delay(100);
}




