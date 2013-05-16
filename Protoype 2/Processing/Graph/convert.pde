/*
 * Conversion des données lues sur le port (String) en donnée exploitable
 *
 * 1/ String->Float 
 * 2/ Mapage sur plage 0-360
 * 3/ Adaptation à taille fenêtre
 *
 */
int minAngle = 0;
int maxAngle = 360;

void convert() {   
  
  StringToArray(SaccX, accX);
  StringToArray(SaccY, accY);
  StringToArray(SaccZ, accZ);
  
  StringToArray(SgyroXrate, gyroXrate);
  StringToArray(SgyroYrate, gyroYrate);
  StringToArray(SgyroZrate, gyroZrate);
  
  StringToArray(SaccXangle, accXangle);
  StringToArray(SaccYangle, accYangle);
  StringToArray(SaccZangle, accZangle);
  
  StringToArray(SgyroXangle, gyroXangle);
  StringToArray(SgyroYangle, gyroYangle);
  StringToArray(SgyroZangle, gyroZangle);
  
  StringToArray(ScompAngleX, compAngleX);
  StringToArray(ScompAngleY, compAngleY);
  StringToArray(ScompAngleZ, compAngleZ);

  StringToArray(SkalAngleX, kalAngleX);
  StringToArray(SkalAngleY, kalAngleY);
  StringToArray(SkalAngleZ, kalAngleZ);
  
  StringToArray(Stemp, temp);

}

/*
 * Convertit une données sous forme de chaine (String) en nombre (float)
 * Et map le résultat pour correspondre à la taille de la fenêtre et être affiché.
 */
void StringToArray(String input, float output[]){
 
  if(input != null){
    // trim off any whitespace
    input = trim(input);
    // convert to an float and map to the screen height, then save in buffer
    output[output.length-1] = map(float(input), minAngle, maxAngle, 0, height);
  }
  
}
