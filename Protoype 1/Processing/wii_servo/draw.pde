void draw(){
      
    valueP = (int)(pitch*180);
    valueR = (int)(roll*180);
    
    //On fait jouer l'accélération pour arriver plus ou moins vite à la position voulue
    //Ne marche pas (une seule accel, 2 axes)
    //valueP = valueP*(int)(1+accel*100);
    //valueR = valueR*(int)(1+accel*100);
    
    if(arduinoConnected){
      arduino.analogWrite(servoP, 180-valueP-optP);
      arduino.analogWrite(servoR, valueR-optR);
    }
  
    dessin();
    
    record();
}


//Dessin
void dessin()
{
  if(show3D)
  {
    background(128);
    lights();
    
    //Gestion de la perspective
    float fov = PI/3.0; 
    float cameraZ = (height/2.0) / tan(fov/2.0); 
    perspective(fov, float(width)/float(height), cameraZ/2.0, cameraZ*2.0); 
    
    //On décale au milieu de la fenêtre
    translate(width/2, height/2, 0);
    
    println(pitch);
    println(roll);
    
    //Rotation du repère en fonction Tangage/Roulis
    rotateX(PI/2-pitch*PI); 
    rotateZ(roll*PI-PI/2); 
    
    box(1); //Point d'origine
    
    //Affichage des données
    text("Picth : " + pitch, 200, -120, 0);
    text("Roll : " + roll, 200, -100, 0);
    text("Yaw : " + pitch, 200, -80, 0);
    
    text("Accel : " + accel*100, 200, -140, 0); //*100
    
    
    scale(20); //On agrandit tout ce qu'on va dessiner ensuite pour simplifier le code
    
    /* Dessin de la plateforme */ 
    // Bottom
    beginShape(QUADS);
    fill(255,0,0); // red
    vertex(-4, 1, 4);
    vertex( 4, 1, 4);
    vertex( 4, 1,-4);
    vertex(-4, 1,-4);
    endShape();  
    // Top
    beginShape(QUADS);
    fill(0,255,0); // green
    vertex(-4, -1, 4);
    vertex( 4, -1, 4);
    vertex( 4, -1,-4);
    vertex(-4, -1,-4);
    endShape();  
    // Front
    beginShape(QUADS);
    fill(255,255,0); // turquoise
    vertex(-4, 1, 4);
    vertex(-4,-1, 4);
    vertex( 4,-1, 4);
    vertex( 4, 1, 4); 
    endShape();
    // Back
    beginShape(QUADS);
    fill(0,255,255); // yellow
    vertex(-4, 1, -4);
    vertex(-4,-1, -4);
    vertex( 4,-1, -4);
    vertex( 4, 1, -4);
    endShape();
    // Left
    beginShape(QUADS);
    fill(255,0,255); // rose
    vertex(-4, 1, -4);
    vertex(-4,-1, -4);
    vertex(-4,-1, 4);
    vertex(-4, 1, 4);
    endShape();
    // Right
    beginShape(QUADS);
    fill(0,0,255); // blue
    vertex(4, 1, -4);
    vertex(4,-1, -4);
    vertex(4,-1, 4);
    vertex(4, 1, 4);
    endShape();
  }
  else
  { 
    background(333);
    ellipse(roll*height, pitch*width, accel*width, accel*height);
    
    //Affichage des données
    text("Picth : " + pitch, 200, -120, 0);
    text("Roll : " + roll, 200, -100, 0);
    text("Yaw : " + pitch, 200, -80, 0);
    
    text("Accel : " + accel*100, 200, -140, 0); //*100 
  }
}
