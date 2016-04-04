void front_rear_sensor_calibration(byte color)
{
 // This function will take samples for A0 to A15 and store maxima and minima into EEPROM

// setting all values 0 and 1000 for maxima and minima
int  afront_max[] = {0,0,0,0,0,0,0,0,0};
int  afront_min[] = {1000,1000,1000,1000,1000,1000,1000,1000,1000};
 
int  arear_max[] = {0,0,0,0,0,0,0};
int  arear_min[] = {1000,1000,1000,1000,1000,1000,1000};


  int sensor_temp_variable = 0 , sensor_id_front = 0 , sensor_id_rear = 0 , color_index = 0;
  double get_millis = millis();
  switch (color)
  {
    case 'R':
     color_index = 0;
     break;
    case 'G':
     color_index = 32;
     break;
    case 'B':
     color_index = 64;
     break;
    case 'g':
     color_index = 96;
     break;
    
    default :
     // error 
     return;    
    
  }
  
    do{
      sensor_temp_variable=analogReadavg(sensor_id_front);
      if(sensor_temp_variable>afront_max[sensor_id_front]){afront_max[sensor_id_front]=sensor_temp_variable;}
      if(sensor_temp_variable<afront_min[sensor_id_front]){afront_min[sensor_id_front]=sensor_temp_variable;}
      
      sensor_temp_variable=analogReadavg(sensor_id_rear+9); // we have added +9 becaus we want to read rear sensor from A9 to A15
      if(sensor_temp_variable>arear_max[sensor_id_rear]){arear_max[sensor_id_rear]=sensor_temp_variable;}
      if(sensor_temp_variable<arear_min[sensor_id_rear]){arear_min[sensor_id_rear]=sensor_temp_variable;}
      
      sensor_id_front++;
      sensor_id_rear++;
        if(sensor_id_rear >6 )
        {
          sensor_id_rear = 0;
        }
        if(sensor_id_front >8 )
        {
          sensor_id_front = 0;
        }
      
      
      }while(millis()<get_millis+calibration_time);

     for(sensor_id_front = 0 ; sensor_id_front < 9 ; sensor_id_front++)    
     {  
       Serial.print("A");
       Serial.print(sensor_id_front);
       Serial.print("max =");
       Serial.print(afront_max[sensor_id_front]);
       Serial.print("\t");
       EEPROM.write(eeprom_add+color_index,map(afront_max[sensor_id_front],0,1023,0,255));
       
       Serial.print("A");
       Serial.print(sensor_id_front);
       Serial.print("min =");
       Serial.print(afront_min[sensor_id_front]);
       Serial.println("\t");
       EEPROM.write(eeprom_add+16+color_index,map(afront_min[sensor_id_front],0,1023,0,255));
       eeprom_add++;
      
     }
      eeprom_add=0;
   
     for(sensor_id_rear = 0 ; sensor_id_rear < 7 ; sensor_id_rear++)    
     {  
       Serial.print("A");
       Serial.print(sensor_id_rear+9);
       Serial.print("max =");
       Serial.print(arear_max[sensor_id_rear]);
       Serial.print("\t");
       EEPROM.write(eeprom_add+9+color_index,map(arear_max[sensor_id_rear],0,1023,0,255));
       
       Serial.print("A");
       Serial.print(sensor_id_rear+9);
       Serial.print("min =");
       Serial.print(arear_min[sensor_id_rear]);
       Serial.println("\t");
       EEPROM.write(eeprom_add+9+16+color_index,map(arear_min[sensor_id_rear],0,1023,0,255));
      eeprom_add++;
     }
    eeprom_add=0;      

}


void front_rear_sensor_eeprom(byte color)
{
 // read the data from eeprom and load it to the maxima and minima global variable of main programme
  int color_index = 0;
   switch(color)
   {
      case 'R':
      //read red color data from eeprom
          color_index = 0;
          Serial.println("Red color");
      break;
      
      case 'G':
      //read green color data from eeprom
          color_index = 32;
          Serial.println("Green color");
      break;
      
      case 'B':
      //read blue color data from eeprom
          color_index = 64;
          Serial.println("Blue color");
      break;
      
      case 'g':
      //read gray color data from eeprom
          color_index = 96;
          Serial.println("Grey color");
      break;
      
      default :
      //return error
      break;
   }
   
   
    for(eeprom_add = 0 ; eeprom_add <9 ; eeprom_add++)
        { 
           Serial.print("A");
           Serial.print(eeprom_add);
           Serial.print("max =");
           Afront_max[eeprom_add] = 4*(int)EEPROM.read(eeprom_add+color_index);
           Serial.print(Afront_max[eeprom_add]);
           Serial.print("\t");
           
           Serial.print("A");
           Serial.print(eeprom_add);
           Serial.print("min =");
           Afront_min[eeprom_add] = 4*(int)EEPROM.read(eeprom_add+color_index+16);
           Serial.print(Afront_min[eeprom_add]);
           Serial.println("\t");
        }
        
    for(eeprom_add = 0 ; eeprom_add <7 ; eeprom_add++)
        {
           Serial.print("A");
           Serial.print(eeprom_add+9);
           Serial.print("max =");  
           Arear_max[eeprom_add] = 4*(int)EEPROM.read(eeprom_add+color_index+9);
           Serial.print(Arear_max[eeprom_add]);
           Serial.print("\t");
           
           Serial.print("A");
           Serial.print(eeprom_add+9);
           Serial.print("min =");
           Arear_min[eeprom_add] = 4*(int)EEPROM.read(eeprom_add+color_index+16+9);
           Serial.print(Arear_min[eeprom_add]);
           Serial.println("\t");
        }
     
   
}


int analogReadavg(int sensor_index)
{
  int i,avg=0;
  int sample_numbers=5;
 
  switch(sensor_index)
  {
     
      case 0:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A0);
         }
         return((int)avg/sample_numbers);
         break;
         
       case 1:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A1);
         }
         return((int)avg/sample_numbers);
         break;
      
      case 2:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A2);
         }
         return((int)avg/sample_numbers);
         break;
         
      case 3:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A3);
         }
         return((int)avg/sample_numbers);
         break;

      case 4:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A4);
         }
         return((int)avg/sample_numbers);
         break;
      
      case 5:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A5);
         }
         return((int)avg/sample_numbers);
         break;
         
      case 6:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A6);
         }
         return((int)avg/sample_numbers);
         break;
         
       case 7:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A7);
         }
         return((int)avg/sample_numbers);
         break;
      
      case 8:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A8);
         }
         return((int)avg/sample_numbers);
         break;
         
      case 9:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A9);
         }
         return((int)avg/sample_numbers);
         break;
   
      case 10:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A10);
         }
         return((int)avg/sample_numbers);
         break;
      
      case 11:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A11);
         }
         return((int)avg/sample_numbers);
         break;
         
      case 12:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A12);
         }
         return((int)avg/sample_numbers);
         break;
         
       case 13:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A13);
         }
         return((int)avg/sample_numbers);
         break;
      
      case 14:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A14);
         }
         return((int)avg/sample_numbers);
         break;
         
      case 15:
         for(i=0;i<sample_numbers;i++)
         {
             avg=avg+analogRead(A15);
         }
         return((int)avg/sample_numbers);
         break; 
      
      default:     
         return -1;  
       //print error on LCD  
  }
}

void all_sensor_test()
{
  // this function shows all A0 to A15 analog pin on serial port
  for(int i=0;i<16;i++)
  {
    Serial.print(analogReadavg(i));
    Serial.print("\t");
  }
  Serial.print(digitalRead(47)); //front object
  Serial.print("\t");
  Serial.print(digitalRead(49)); // rear object
  Serial.print("\t");
  Serial.println("");
}
  

