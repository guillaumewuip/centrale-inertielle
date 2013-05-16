/*
 * Mis à jour des valeurs IMU
 *
 */
void updateIMU(){
  
  /* Mise à jour de toutes les valeurs */
  
  uint8_t* data = i2cRead(0x3B,14); //On lit les données IMU
  
  //Accéléromètre
  accX = ((data[0] << 8) | data[1]);
  accY = ((data[2] << 8) | data[3]);
  accZ = ((data[4] << 8) | data[5]); 
  
  tempRaw = ((data[6] << 8) | data[7]); //Température
  
  //Gyroscope
  gyroX = ((data[8] << 8) | data[9]);
  gyroY = ((data[10] << 8) | data[11]);
  gyroZ = ((data[12] << 8) | data[13]);
  
  
  /* Calculs basés sur différent filtres */
  
  accXangle = (atan2(accY,accZ)+PI)*RAD_TO_DEG;
  accYangle = (atan2(accX,accZ)+PI)*RAD_TO_DEG;
  accZangle = (atan2(accY,accX)+PI)*RAD_TO_DEG;
  
  gyroXrate = (double)gyroX/131.0; 
  gyroYrate = -((double)gyroY/131.0);
  gyroZrate = ((double)gyroZ/131.0);
  
  // Sans filtre
  gyroXangle += gyroXrate*((double)(micros()-timer)/1000000);
  gyroYangle += gyroYrate*((double)(micros()-timer)/1000000);
  gyroZangle += gyroZrate*((double)(micros()-timer)/1000000);
  
  //FIltre complémentaire
  compAngleX = (0.93*(compAngleX+(gyroXrate*(double)(micros()-timer)/1000000)))+(0.07*accXangle); 
  compAngleY = (0.93*(compAngleY+(gyroYrate*(double)(micros()-timer)/1000000)))+(0.07*accYangle);  
  compAngleZ = (0.93*(compAngleZ+(gyroZrate*(double)(micros()-timer)/1000000)))+(0.07*accZangle);  
  
  //Filtre kalman
  kalAngleX = kalmanX.getAngle(accXangle, gyroXrate, (double)(micros()-timer)/1000000);
  kalAngleY = kalmanY.getAngle(accYangle, gyroYrate, (double)(micros()-timer)/1000000);
  kalAngleZ = kalmanZ.getAngle(accZangle, gyroZrate, (double)(micros()-timer)/1000000);
  
  timer = micros();
  temp = ((double)tempRaw + 12412.0) / 340.0; //Température
  
  //Envoi sur usb
  if(serial)
    printSerial();
  
}

/**
 *i2cWrite method
 *
 * Envoi un ordre à l'IMU
 *
 * @params registerAddress
 * @params data
 */
void i2cWrite(uint8_t registerAddress, uint8_t data){
  Wire.beginTransmission(IMUAddress); //On appelle l'IMU
  Wire.write(registerAddress); //On demande
  Wire.write(data);
  Wire.endTransmission(); // On stop
}

/**
 * i2cRead method
 *
 * Lit un certain nombre de bytes
 *
 * @params registerAddress
 * @params nbytes
 */
uint8_t* i2cRead(uint8_t registerAddress, uint8_t nbytes) {
  uint8_t data[nbytes];  
  Wire.beginTransmission(IMUAddress);
  Wire.write(registerAddress);
  Wire.endTransmission(false); // Don't release the bus
  Wire.requestFrom(IMUAddress, nbytes); // Send a repeated start and then release the bus after reading
  for(uint8_t i = 0; i < nbytes; i++)
    data[i] = Wire.read();
  return data;
} 
