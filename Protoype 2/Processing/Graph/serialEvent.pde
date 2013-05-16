/*
 * Fonction appelée dès fin de ligne sur transmission, avec contenu de la ligne
 * cf. setup() bufferUntil();
 */
void serialEvent(Serial p) { 
   
  // get the ASCII strings
  SaccX = arduino.readStringUntil('\t');
  SaccY = arduino.readStringUntil('\t');
  SaccZ = arduino.readStringUntil('\t');
  
  SgyroXrate = arduino.readStringUntil('\t');
  SgyroYrate = arduino.readStringUntil('\t');
  SgyroZrate = arduino.readStringUntil('\t');

  SaccXangle = arduino.readStringUntil('\t');
  SaccYangle = arduino.readStringUntil('\t');
  SaccZangle = arduino.readStringUntil('\t');  

  SgyroXangle = arduino.readStringUntil('\t');
  SgyroYangle = arduino.readStringUntil('\t');
  SgyroZangle = arduino.readStringUntil('\t');
  
  ScompAngleX = arduino.readStringUntil('\t');
  ScompAngleY = arduino.readStringUntil('\t');
  ScompAngleZ = arduino.readStringUntil('\t');

  SkalAngleX = arduino.readStringUntil('\t');
  SkalAngleY = arduino.readStringUntil('\t');
  SkalAngleZ = arduino.readStringUntil('\t');

  Stemp = arduino.readStringUntil('\t');

  arduino.clear(); // Clear buffer

//  if(debug)
//    printAxis();

  if(log)
    record();
}

//Debug les différentes variables
void printAxis() {
  
  print(SaccX); print("\t");
  print(SaccY); print("\t");
  print(SaccZ); print("\t");

  print(SgyroXrate); print("\t");
  print(SgyroYrate); print("\t");
  print(SgyroZrate); print("\t");

  print(SaccXangle); print("\t");
  print(SaccYangle); print("\t");
  print(SaccZangle); print("\t");

  print(SgyroXangle); print("\t");
  print(SgyroYangle); print("\t");
  print(SgyroZangle); print("\t");
  
  print(ScompAngleX); print("\t");
  print(ScompAngleY); print("\t");
  print(ScompAngleZ); print("\t");
  
  print(SkalAngleX); print("\t");
  print(SkalAngleY); print("\t");
  print(SkalAngleZ); print("\t");

  print(Stemp); print("\n");
  
}
