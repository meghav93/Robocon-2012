int got_it=0;
int flag=0;
int current=0;
void task_second()
{
    while(wall_follow_right_blank());
    low_speed();
    stop_bot();    
    
   // basket_scan();
    
     if(got_it==1)
    {
    
       go_for_first_cup();  
    }
    
    else
    {
       go_for_second_cup();
    
    }

}
void go_for_first_cup()
{
    stop_bot(); 
    forward();
    while(analogReadavg(15)<450);
    stop_bot();
    fork_up();
    stop_bot();
     while(wall_follow_left_rev_blank());
   stop_bot();
   delay(100);
   stop_bot();
      
//--------------------------------Robot is now back ----------------------------  
   basket_down();
   
   
}

void go_for_second_cup()
{
//    forward();
//    delay(300);
    stop_bot();
    delay(100);
    current=millis();
    while(millis()<(current+1100))
    {
      wall_follow_right_rev_blank();
    }  
//   analogWrite(left_bkwd,255);
//   analogWrite(right_bkwd,255);              //back
//   analogWrite(omni_left_bkwd,255);
//   analogWrite(omni_right_bkwd,255);
//   delay(1000);
   stop_bot();
   delay(100);
   
    analogWrite(left_bkwd,255);
    analogWrite(right_frwd,255);
    analogWrite(omni_left_bkwd,255);
    analogWrite(omni_right_frwd,255);
   delay(900);
   
    stop_bot();
   
   while(analogReadavg(15)<250)
   
   {
     forward();
   }
   stop_bot();
   
   turn_right();
   delay(900);
   stop_bot();
   
   while(analogReadavg(15)<230)// edit value here
   {
     forward();
   }
   stop_bot();
   delay(100);
   
   got_it=0;
 //  basket_scan();
   
   forward();   
   while(analogReadavg(15)<400);
   stop_bot();
   
   fork_up();
   stop_bot();
   delay(100);
   
   backward();
   delay(300);
   stop_bot();
   delay(100);
   
    analogWrite(right_frwd,255);
    analogWrite(left_bkwd,255);
    analogWrite(omni_right_frwd,255);
    analogWrite(omni_left_bkwd,255);
    delay(600);
    stop_bot();
    
    analogWrite(right_bkwd,255);
    analogWrite(left_bkwd,160);
    analogWrite(omni_right_bkwd,255);
    analogWrite(omni_left_bkwd,160);
    delay(500);
    while(analogReadavg(9)<300);
    stop_bot();
    
    analogWrite(right_bkwd,255);
    analogWrite(left_bkwd,100);
    analogWrite(omni_right_bkwd,255);
    analogWrite(omni_left_bkwd,100);
    while((analogReadavg(9)-analogReadavg(12))>40);
    stop_bot();
    
    while(wall_follow_right_rev_blank());
    stop_bot();
    delay(100);
    stop_bot();
      
//--------------------------------Robot is now back ----------------------------  
   basket_down();

}


void basket_down()
{
    analogWrite(right_frwd,80);
    analogWrite(left_bkwd,255);
    analogWrite(omni_right_frwd,80);
    analogWrite(omni_left_bkwd,255);
    while(analogReadavg(12)>100);

    while(!((analogReadavg(10) - analogReadavg(4))< 40));
    
    stop_bot(); 
    delay(200);
   forward();
   while(analogReadavg(15)<600);
//   while(wall_follow_left_blank());
   stop_bot();   
    forward();
    delay(100);
    stop_bot();
    fork_down();
    stop_bot();
    backward();
   while(analogReadavg(13)<600);
    
//   while(wall_follow_left_rev_blank());
    stop_bot();
    
    fork_up_for_colloector();
    
     analogWrite(right_frwd,255);
    analogWrite(left_frwd,50);
    analogWrite(omni_right_frwd,255);
    analogWrite(omni_left_frwd,50);
    delay(400);
    stop_bot();
    
     analogWrite(right_frwd,150);
    analogWrite(left_frwd,255);
    analogWrite(omni_right_frwd,150);
    analogWrite(omni_left_frwd,255);
    delay(500);
    stop_bot(); 
}


void basket_scan()
{
  int tick=millis();
   
   while(((tick+150)>millis()) && got_it==0)// edit value here
   {
     if(analogReadavg(14)<150)
     {
      turn_left();
      
     }
     else 
     {
     got_it=1;
     }
   
   }
   
   
   stop_bot();
   delay(100);
   
     while(((tick+400)>millis()) && got_it==0 )// edit value here
     {
       if(analogReadavg(14)<150)
       {
         turn_right();
      
       }
     else 
     {
     got_it=1;
     }
    }  
     stop_bot();
     delay(100);
    
}
