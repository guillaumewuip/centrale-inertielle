
/*
 * Affichage des courbes
 * @see http://github.com/TKJElectronics/Example-Sketch-for-IMU-including-Kalman-filter/blob/master/IMU6DOF/MPU6050/Graph/DrawAxis.pde
 */
void updateAxis(){
 // put all data one array back
  for(int i = 1; i<accXangle.length;i++)
    accXangle[i-1] = accXangle[i];
    
  for(int i = 1; i<gyroXangle.length;i++)
    gyroXangle[i-1] = gyroXangle[i];  
    
  for(int i = 1; i<compAngleX.length;i++)
    compAngleX[i-1] = compAngleX[i];
 
  for(int i = 1; i<kalAngleX.length;i++)
    kalAngleX[i-1] = kalAngleX[i];
  
   // put all data one array back
  for(int i = 1; i<accYangle.length;i++)
    accYangle[i-1] = accYangle[i];
    
  for(int i = 1; i<gyroYangle.length;i++)
    gyroYangle[i-1] = gyroYangle[i];  
    
  for(int i = 1; i<compAngleY.length;i++)
    compAngleY[i-1] = compAngleY[i];
 
  for(int i = 1; i<kalAngleY.length;i++)
    kalAngleY[i-1] = kalAngleY[i];
    
   // put all data one array back
  for(int i = 1; i<accZangle.length;i++)
    accZangle[i-1] = accZangle[i];
    
  for(int i = 1; i<gyroZangle.length;i++)
    gyroZangle[i-1] = gyroZangle[i];  
    
  for(int i = 1; i<compAngleZ.length;i++)
    compAngleZ[i-1] = compAngleZ[i];
 
  for(int i = 1; i<kalAngleZ.length;i++)
    kalAngleZ[i-1] = kalAngleZ[i];
}

//Axe X
void drawAxisX() {
 
  if(touches[3]){
    /* draw acceleromter x-axis */
    textSize(20);
    fill(0, 255, 0);
    text("Accéléromètre", 10, 30); 
    noFill();
    stroke(0,255,0); // green
    // redraw everything
    beginShape();
    for(int i = 0; i<accXangle.length;i++)
      vertex(i,accXangle[i]);  
    endShape();
  }
   
    
  if(touches[4]){
    /* draw gyro x-axis */
    textSize(20);
    fill(255, 255, 0);
    text("Gyroscope", 10, 60); 
    noFill();
    stroke(255,255,0); // yellow
    // redraw everything
    beginShape();
    for(int i = 0; i<gyroXangle.length;i++)
      vertex(i,gyroXangle[i]);
    endShape();
  } 
   
  if(touches[5]){
    /* draw complementary filter x-axis */
    fill(0, 0, 255);
    text("Filtre Complémentaire", 10, 90);
    noFill();
    stroke(0,0,255); // blue
    // redraw everything
    beginShape();
    for(int i = 0; i<compAngleX.length;i++)
      vertex(i,compAngleX[i]);
    endShape();
  }
   
  if(touches[6]){
    /* draw kalman filter x-axis */
    fill(255, 0, 0);
    text("Filtre Kalman", 10, 120);
    noFill();
    stroke(255,0,0);//red
    // redraw everything
    beginShape();
    for(int i = 0; i<kalAngleX.length; i++)
      vertex(i,kalAngleX[i]);  
    endShape();
  }
  
}


//Axe Y
void drawAxisY() {
 
  if(touches[3]){
    /* draw acceleromter x-axis */
    textSize(20);
    fill(0, 255, 0);
    text("Accéléromètre", 10, 30); 
    noFill();
    stroke(0,255,0); // green
    // redraw everything
    beginShape();
    for(int i = 0; i<accYangle.length;i++)
      vertex(i,accYangle[i]);  
    endShape();
  }
   // put all data one array back
  for(int i = 1; i<accYangle.length;i++)
    accYangle[i-1] = accYangle[i];
    
  if(touches[4]){
    /* draw gyro x-axis */
    textSize(20);
    fill(255, 255, 0);
    text("Gyroscope", 10, 60); 
    noFill();
    stroke(255,255,0); // yellow
    // redraw everything
    beginShape();
    for(int i = 0; i<gyroYangle.length;i++)
      vertex(i,gyroYangle[i]);
    endShape();
  } 
   
  if(touches[5]){
    /* draw complementary filter x-axis */
    fill(0, 0, 255);
    text("Filtre Complémentaire", 10, 90);
    noFill();
    stroke(0,0,255); // blue
    // redraw everything
    beginShape();
    for(int i = 0; i<compAngleY.length;i++)
      vertex(i,compAngleY[i]);
    endShape();
  }
   // put all data one array back
  for(int i = 1; i<compAngleY.length;i++)
    compAngleY[i-1] = compAngleY[i];
   
  if(touches[6]){
    /* draw kalman filter x-axis */
    fill(255, 0, 0);
    text("Filtre Kalman", 10, 120);
    noFill();
    stroke(255,0,0);//red
    // redraw everything
    beginShape();
    for(int i = 0; i<kalAngleY.length; i++)
      vertex(i,kalAngleY[i]);  
    endShape();
  }
   // put all data one array back
  for(int i = 1; i<kalAngleY.length;i++)
    kalAngleY[i-1] = kalAngleY[i];
  
}

//Axe Z
void drawAxisZ() {
 
  if(touches[3]){
    /* draw acceleromter x-axis */
    textSize(20);
    fill(0, 255, 0);
    text("Accéléromètre", 10, 30); 
    noFill();
    stroke(0,255,0); // green
    // redraw everything
    beginShape();
    for(int i = 0; i<accZangle.length;i++)
      vertex(i,accZangle[i]);  
    endShape();
  }
  // put all data one array back
  for(int i = 1; i<accZangle.length;i++)
    accZangle[i-1] = accZangle[i];
    
  if(touches[4]){
    /* draw gyro x-axis */
    textSize(20);
    fill(255, 255, 0);
    text("Gyroscope", 10, 60); 
    noFill();
    stroke(255,255,0); // yellow
    // redraw everything
    beginShape();
    for(int i = 0; i<gyroZangle.length;i++)
      vertex(i,gyroZangle[i]);
    endShape();
  } 
  // put all data one array back
  for(int i = 1; i<gyroZangle.length;i++)
    gyroZangle[i-1] = gyroZangle[i];  
   
  if(touches[5]){
    /* draw complementary filter x-axis */
    fill(0, 0, 255);
    text("Filtre Complémentaire", 10, 90);
    noFill();
    stroke(0,0,255); // blue
    // redraw everything
    beginShape();
    for(int i = 0; i<compAngleZ.length;i++)
      vertex(i,compAngleZ[i]);
    endShape();
  }
  // put all data one array back
  for(int i = 1; i<compAngleZ.length;i++)
    compAngleZ[i-1] = compAngleZ[i];
   
  if(touches[6]){
    /* draw kalman filter x-axis */
    fill(255, 0, 0);
    text("Filtre Kalman", 10, 120);
    noFill();
    stroke(255,0,0);//red
    // redraw everything
    beginShape();
    for(int i = 0; i<kalAngleZ.length; i++)
      vertex(i,kalAngleZ[i]);  
    endShape();
  }
  // put all data one array back
  for(int i = 1; i<kalAngleZ.length;i++)
    kalAngleZ[i-1] = kalAngleZ[i];
}


