// A4 is for left front wall sensor
// A12 is for right wall sensor
// A15 is the front middle sensor
// A10 is the left back sensor
// A9 is the right back sensor
// A13 is the back middle sensor

int th = 110 ; //this is a threshold for grid detection
int wall = 0;
int fwdmin=280,fwdmax=400;
int far_max=100;
int near_max=650;
int front_object = 49;
int rear_object = 47;
int slope_time=3000;
int time;



int wall_follow_right()
{
    if(analogRead(A12)>fwdmin && analogRead(A12)<fwdmax) //normal---forward
  {
      forward();
      digitalWrite(13,LOW);
  }
  
  else if(analogRead(A12)<fwdmin ) 
  {
      wall= map(constrain(analogRead(A12),far_max,fwdmin),far_max,fwdmin,150,255);
      
      analogWrite(left_frwd,wall);
      analogWrite(right_frwd,wall-100);
      analogWrite(omni_left_frwd,wall);
      analogWrite(omni_right_frwd,wall-100);
  }      
    
  
  else if(analogRead(A12)>fwdmax) // near wallt ---- slight left
  {
      wall= map(constrain(analogRead(A12),fwdmax,near_max),fwdmax,near_max,255,150);
      
      analogWrite(right_frwd,wall);
      analogWrite(left_frwd,wall-100); 
      analogWrite(omni_right_frwd,wall);
      analogWrite(omni_left_frwd,wall-100);
  }
    
    // detecting grid
    
//     if((analogReadavg(0) < ( Afront_min[0] + th + 60 )) && (analogReadavg(1) < ( Afront_min[1] + th + 60 )))
//     {
//       digitalWrite(led1,1);
//       delay(100);
//       while((analogReadavg(0) < ( Afront_min[0] + th + 50 )) && (analogReadavg(1) < ( Afront_min[1] + th + 50 ))); // wait untill robot comes out of white line
//       digitalWrite(led1,0);
//       return 0;
//     }
    else return 1;
    
          
     
}
int wall_follow_left()
{   //this prog is for wall-detect in case bot sensor doesnt work...
    
  //below program is for wall follow
    if(analogRead(A4)>fwdmin && analogRead(A4)<fwdmax) //normal---forward
  {
      forward();
      digitalWrite(13,LOW);
  }
  
  else if(analogRead(A4)<fwdmin ) 
  {
      wall= map(constrain(analogRead(A4),far_max,fwdmin),far_max,fwdmin,150,255);
      
      analogWrite(right_frwd,wall);
      analogWrite(left_frwd,wall-100);
      analogWrite(omni_right_frwd,wall);
      analogWrite(omni_left_frwd,wall-100);
  }      
    
  
  else if(analogRead(A4)>fwdmax) // near wallt ---- slight left
  {
      wall= map(constrain(analogRead(A4),fwdmax,near_max),fwdmax,near_max,255,150);
      
      analogWrite(left_frwd,wall);
      analogWrite(right_frwd,wall-100); 
      analogWrite(omni_left_frwd,wall);
      analogWrite(omni_right_frwd,wall-100);
  }
    
    // detecting grid
    
//     if((analogReadavg(8) < ( Afront_min[8] + th )) && (analogReadavg(7) < ( Afront_min[7] + th )))
//     {
//
//       while((analogReadavg(8) < ( Afront_min[8] + th + 50 )) && (analogReadavg(7) < ( Afront_min[7] + th  + 50))); // wait untill robot comes out of white line
//
//       return 0;
//     }
    else return 1;
     
}

int wall_follow_left_rev()
{
  Serial.println(analogReadavg(10));
  //this prog is for wall-detect in case bot sensor doesnt work...
   if(analogReadavg(13)>350)
    {
      stop_bot();
      return 0;
    }
   
  
  
  //below program is for wall follow
  
     if(analogRead(A10)>fwdmin && analogRead(A10)<fwdmax) //normal---forward
  {
      backward();
      digitalWrite(13,LOW);
  }
  
  else if(analogRead(A10)<fwdmin ) 
  {
      wall= map(constrain(analogRead(A10),far_max,fwdmin),far_max,fwdmin,100,255);
      
      analogWrite(right_bkwd,wall);
      analogWrite(left_bkwd,wall-100);
      analogWrite(omni_right_bkwd,wall);
      analogWrite(omni_left_bkwd,wall-100);
  }      
    
  
  else if(analogRead(A10)>fwdmax) // near wallt ---- slight left
  {
      wall= map(constrain(analogRead(A10),fwdmax,near_max),fwdmax,near_max,255,100);
      
      analogWrite(left_bkwd,wall);
      analogWrite(right_bkwd,wall-100); 
      analogWrite(omni_left_bkwd,wall);
      analogWrite(omni_right_bkwd,wall-100);
  }
    
    // detecting grid
    
     if((analogReadavg(8) < ( Afront_min[8] + th )) && (analogReadavg(7) < ( Afront_min[7] + th )))
     {

       while((analogReadavg(8) < ( Afront_min[8] + th + 50 )) && (analogReadavg(7) < ( Afront_min[7] + th  + 50))); // wait untill robot comes out of white line

       return 0;
     }
    else return 1;
     
}





int wall_follow_left_rev_blank()
{
     if(analogRead(A10)>fwdmin && analogRead(A10)<fwdmax) //normal---forward
  {
      backward();
      digitalWrite(13,LOW);
  }
  
  else if(analogRead(A10)<fwdmin ) 
  {
      wall= map(constrain(analogRead(A10),far_max,fwdmin),far_max,fwdmin,150,255);
      
      analogWrite(right_bkwd,wall);
      analogWrite(left_bkwd,wall-100);
      analogWrite(omni_right_bkwd,wall);
      analogWrite(omni_left_bkwd,wall-100);
  }      
    
  
  else if(analogRead(A10)>fwdmax) // near wallt ---- slight left
  {
      wall= map(constrain(analogRead(A10),fwdmax,near_max),fwdmax,near_max,255,150);
      
      analogWrite(left_bkwd,wall);
      analogWrite(right_bkwd,wall-100); 
      analogWrite(omni_left_bkwd,wall);
      analogWrite(omni_right_bkwd,wall-100);
  }
    
    // detecting back wall
     if(analogReadavg(13)>600)
     {
      // Serial.println(analogReadavg(13));
       stop_bot();
       return 0;
     }
    else return 1;
    
     
}

//for blue theme .......edit below

int wall_follow_right_rev_blank()
{
     if(analogRead(A9)>fwdmin && analogRead(A9)<fwdmax) //normal---forward
  {
      backward();
      digitalWrite(13,LOW);
  }
  
  else if(analogRead(A9)<fwdmin ) 
  {
      wall= map(constrain(analogRead(A9),far_max,fwdmin),far_max,fwdmin,150,255);
      
      analogWrite(left_bkwd,wall);
      analogWrite(right_bkwd,wall-100);
      analogWrite(omni_left_bkwd,wall);
      analogWrite(omni_right_bkwd,wall-100);
  }      
    
  
  else if(analogRead(A9)>fwdmax) // near wallt ---- slight left
  {
      wall= map(constrain(analogRead(A10),fwdmax,near_max),fwdmax,near_max,255,150);
      
      analogWrite(right_bkwd,wall);
      analogWrite(left_bkwd,wall-100); 
      analogWrite(omni_right_bkwd,wall);
      analogWrite(omni_left_bkwd,wall-100);
  }
    
    // detecting back wall
     if(analogReadavg(13)>250)
     {
      // Serial.println(analogReadavg(13));
       stop_bot();
       return 0;
     }
    else return 1;
    
     
}




void turn_right()
{
   analogWrite(left_frwd,255);
  analogWrite(right_bkwd,255);
  analogWrite(omni_left_frwd,255);
  analogWrite(omni_right_bkwd,255);
  
}


void turn_left()
{
  

  analogWrite(right_frwd,255);
  analogWrite(left_bkwd,255);
  analogWrite(omni_left_bkwd,255);
  analogWrite(omni_right_frwd,255);
 
  //delay(250);
}
  
void offset_right()
{
  stop_bot();
  while(analogReadavg(15)<300)
  {
    analogWrite(left_frwd,200);
    analogWrite(right_frwd,200);
    analogWrite(omni_left_frwd,200);
    analogWrite(omni_right_frwd,200);
  }
  delay(100);
  stop_bot();
   
}


int wall_follow_right_blank()
{
      if(analogRead(A12)>fwdmin && analogRead(A12)<fwdmax) //normal---forward
  {
      forward();
      digitalWrite(13,LOW);
  }
  
  else if(analogRead(A12)<fwdmin ) 
  {
      wall= map(constrain(analogRead(A12),far_max,fwdmin),far_max,fwdmin,150,255);
      
      analogWrite(left_frwd,wall);
      analogWrite(right_frwd,wall-100);
      analogWrite(omni_left_frwd,wall);
      analogWrite(omni_right_frwd,wall-100);
  }      
    
  
  else if(analogRead(A12)>fwdmax) // near wallt ---- slight left
  {
      wall= map(constrain(analogRead(A12),fwdmax,near_max),fwdmax,near_max,255,150);
      
      analogWrite(right_frwd,wall);
      analogWrite(left_frwd,wall-100); 
      analogWrite(omni_right_frwd,wall);
      analogWrite(omni_left_frwd,wall-100);
  }
    
    // detecting grid
    
  if(analogReadavg(15)>300) 
 {
   //stop_bot();
   low_speed();
 } 
 
 if(analogReadavg(15)>375)
 {
   stop_bot();
   return 0;
 }
   else return 1;
    
}
int wall_follow_right_map()
{
   
    wall = map(constrain(analogRead(A12),200,600),200,600,0,255);
    Serial.println(wall);
    analogWrite(left_frwd , 255 -wall); // write data to the motors
    analogWrite(omni_left_frwd , 255 - wall);
    analogWrite(omni_right_frwd , wall);
    analogWrite(right_frwd ,  wall);
    
    // detecting grid
    
     if((analogReadavg(0) < ( Afront_min[0] + th + 60 )) && (analogReadavg(1) < ( Afront_min[1] + th + 60 )))
     {

       delay(10); // it was 100 befotre
       while((analogReadavg(0) < ( Afront_min[0] + th + 50 )) && (analogReadavg(1) < ( Afront_min[1] + th + 50 ))); // wait untill robot comes out of white line

       return 0;
     }
    else return 1;
    
          
     
}
int wall_follow_left_map()
{
   if(analogReadavg(15)>300)
   { stop_bot();
     return 0;
   }
   
    wall = map(constrain(analogRead(A4),200,600),200,600,0,255);
    Serial.println(wall);
    analogWrite(left_frwd ,  wall); // write data to the motors
    analogWrite(omni_left_frwd , wall);
    analogWrite(omni_right_frwd , 255 - wall);
    analogWrite(right_frwd , 255 - wall);
    
    // detecting grid
    
//     if((analogReadavg(8) < ( Afront_min[8] + th )) && (analogReadavg(7) < ( Afront_min[7] + th )))
//     {
//
//       while((analogReadavg(8) < ( Afront_min[8] + th + 50 )) && (analogReadavg(7) < ( Afront_min[7] + th  + 50))); // wait untill robot comes out of white line
//
//       return 0;
//     }
    return 1;
     
}
int wall_follow_left_blank()
{
     if(analogRead(A4)>fwdmin && analogRead(A4)<fwdmax) //normal---forward
  {
      forward();
      digitalWrite(13,LOW);
  }
  
  else if(analogRead(A4)<fwdmin ) 
  {
      wall= map(constrain(analogRead(A4),far_max,fwdmin),far_max,fwdmin,150,255);
      
      analogWrite(right_frwd,wall);
      analogWrite(left_frwd,wall-100);
      analogWrite(omni_right_frwd,wall);
      analogWrite(omni_left_frwd,wall-100);
  }      
    
  
  else if(analogRead(A4)>fwdmax) // near wallt ---- slight left
  {
      wall= map(constrain(analogRead(A4),fwdmax,near_max),fwdmax,near_max,255,150);
      
      analogWrite(left_frwd,wall);
      analogWrite(right_frwd,wall-100); 
      analogWrite(omni_left_frwd,wall);
      analogWrite(omni_right_frwd,wall-100);
  }
    
    // detecting grid
    
    if(analogReadavg(15)>550)
    {
      low_speed();
      stop_bot();
      return 0;
    }
    
    
//     if(analogReadavg(15)>450)
//     {
//      // delay(100);
//       stop_bot();
//       return 0;
//     }
    else return 1;
 
 
 
    
}
int wall_follow_left_blank1()
{
     if(analogRead(A4)>fwdmin && analogRead(A4)<fwdmax) //normal---forward
  {
      forward();
      digitalWrite(13,LOW);
  }
  
  else if(analogRead(A4)<fwdmin ) 
  {
      wall= map(constrain(analogRead(A4),far_max,fwdmin),far_max,fwdmin,150,255);
      
      analogWrite(right_frwd,wall);
      analogWrite(left_frwd,wall-100);
      analogWrite(omni_right_frwd,wall);
      analogWrite(omni_left_frwd,wall-100);
  }      
    
  
  else if(analogRead(A4)>fwdmax) // near wallt ---- slight left
  {
      wall= map(constrain(analogRead(A4),fwdmax,near_max),fwdmax,near_max,255,150);
      
      analogWrite(left_frwd,wall);
      analogWrite(right_frwd,wall-100); 
      analogWrite(omni_left_frwd,wall);
      analogWrite(omni_right_frwd,wall-100);
  }
    
    // detecting grid
    
    if(analogReadavg(15)>250)
    {
      low_speed();
      stop_bot();
      return 0;
      
    }
    else return 1;
    
    
    
}




int wall_follow_right_high_speed()
{
     
    if(millis()>(current_time+slope_time))
    {
      stop_bot();
      return 0;
    }
    
    
  
    if(analogRead(A12)>fwdmin && analogRead(A12)<fwdmax) //normal---forward
  {
      forward();
      digitalWrite(13,LOW);
  }
  
  else if(analogRead(A12)<fwdmin ) 
  {
      wall= map(constrain(analogRead(A12),far_max,fwdmin),far_max,fwdmin,150,255);
      
      analogWrite(left_frwd,wall);
      analogWrite(right_frwd,wall-100);
      analogWrite(omni_left_frwd,wall);
      analogWrite(omni_right_frwd,wall-100);
  }      
    
  
  else if(analogRead(A12)>fwdmax) // near wallt ---- slight left
  {
      wall= map(constrain(analogRead(A12),fwdmax,near_max),fwdmax,near_max,255,150);
      
      analogWrite(right_frwd,wall);
      analogWrite(left_frwd,wall-100); 
      analogWrite(omni_right_frwd,wall);
      analogWrite(omni_left_frwd,wall-100);
  }
    
    // detecting grid
    
//     if((analogReadavg(0) < ( Afront_min[0] + th + 60 )) && (analogReadavg(1) < ( Afront_min[1] + th + 60 )))
//     {
//       digitalWrite(led1,1);
//       delay(100);
//       while((analogReadavg(0) < ( Afront_min[0] + th + 50 )) && (analogReadavg(1) < ( Afront_min[1] + th + 50 ))); // wait untill robot comes out of white line
//       digitalWrite(led1,0);
//       return 0;
//     }
    else return 1;
    
         
}

int sense_key1()
{
   if(digitalRead(key1)==0)
  {
      delay(100);
      if(digitalRead(key1)==0)
      {
        return 0;
      }
      else
      {
        return 1;
      }
  }     
}      
int sense_key2()
{
   if(digitalRead(key2)==0)
  {
      delay(100);
      if(digitalRead(key2)==0)
      {
        return 0;
      }
      else
      {
        return 1;
      }
  }     
}      
 

