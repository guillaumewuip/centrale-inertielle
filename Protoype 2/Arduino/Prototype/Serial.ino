/*
 * Debug des données sur port USB
 *
 * Voir programme Processing (réception, courbes)
 *
 */
void printSerial(){
 
  //Acélérations linéaires
  Serial.print(accX);Serial.print("\t");
  Serial.print(accY);Serial.print("\t");  
  Serial.print(accZ);Serial.print("\t");    
  
  //Gyroscope
  Serial.print(gyroXrate);Serial.print("\t");  
  Serial.print(gyroYrate);Serial.print("\t");   
  Serial.print(gyroZrate);Serial.print("\t");  
  
  //Angles
  Serial.print(accXangle);Serial.print("\t");
  Serial.print(accYangle);Serial.print("\t"); 
  Serial.print(accZangle);Serial.print("\t");
    
  Serial.print(gyroXangle);Serial.print("\t");
  Serial.print(gyroYangle);Serial.print("\t");
  Serial.print(gyroZangle);Serial.print("\t");
  
  Serial.print(compAngleX);Serial.print("\t");
  Serial.print(compAngleY);Serial.print("\t");
  Serial.print(compAngleZ);Serial.print("\t");
  
  Serial.print(kalAngleX);Serial.print("\t");
  Serial.print(kalAngleY);Serial.print("\t");
  Serial.print(kalAngleZ);Serial.print("\t");
  
  Serial.print(temp);Serial.print("\t"); //Température
   
  Serial.print("\n");
  
  delay(1);
  
}
