/**
 * dessin()
 *
 * Représentation 3D de la plateforme
 */
void dessin()
{
    background(128);
    lights();
    
    //Gestion de la perspective
    float fov = PI/3.0; 
    float cameraZ = (height/2.0) / tan(fov/2.0); 
    perspective(fov, float(width)/float(height), cameraZ/2.0, cameraZ*2.0); 
    
    //On décale au milieu de la fenêtre
    translate(width/2, height/2, 0);
    
     
    float pitch = (float)((kalAngleX[1199]-180)/(2.2));
    pitch = 1-pitch/180;
    
    float roll = (float)((kalAngleY[1199]-180)/(2.2));
    roll = roll/180 -0.07;
   
    
    //Rotation du repère en fonction Tangage/Roulis
    rotateX(PI/2-pitch*PI); 
    rotateZ(roll*PI-PI/2); 
    
    box(1); //Point d'origine
    
    //Affichage des données
    text("Picth : " + kalAngleX[1199], 200, -120, 0);
    text("Roll : " + kalAngleY[1199], 200, -100, 0);
    text("Yaw : " + kalAngleZ[1199], 200, -80, 0);
    
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
