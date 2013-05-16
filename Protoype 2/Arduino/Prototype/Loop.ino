/*
 * Boucle du programme
 *
 */
void loop(){
  
  //Mise à jour des données de position
  updateIMU();
  
  
  /* Ordres de position aux servos */
  
  float pitch, roll;
  
  //On bloque aux valeurs servos mini si retournement
  if(kalAngleX < 90){
    pitch = 90;
  } else if(kalAngleX > 270){
    pitch = 270;
  }
  // Cas général
  else {
     pitch = kalAngleX;
  }

  if(kalAngleY < 90){
    roll = 90;
  } else if(kalAngleY > 270){
    roll = 270;
  }
  // Cas général
  else {
     roll = kalAngleY;
  }
  
  //On lisse
  valueP = smooth(pitch, .9, valueP);
  valueR = smooth(roll, .9, valueR);
  
  //Envoi commandes
  servoP.write(valueP-90+optP);
  servoR.write(180-(valueR-90+optR));

  temps = millis();
  
}

/*
 * Fonction de lissage
 *
 */
int smooth(int data, float filterVal, float smoothedVal) {
  if (filterVal > 1){      // check to make sure param's are within range
    filterVal = .99;
  }
  else if (filterVal <= 0){
    filterVal = 0;
  }
  smoothedVal = (data * (1 - filterVal)) + (smoothedVal  *  filterVal);

  return (int)smoothedVal;
}

