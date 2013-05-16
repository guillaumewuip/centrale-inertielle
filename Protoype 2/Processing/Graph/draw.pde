/*
 * Boucle de traitement
 */
void draw(){
  
  convert();
  
  if(show3D){
    dessin();
  }
  else
  {
    //Affichage des courbes
    background(255);
    
    //Cadriage
    
    for (int i=0 ; i<=width/10; i++)
    {    
      stroke(200); // gray
      //cf. http://processing.org/reference/frameCount.html
      line((-frameCount%10)+i*10, 0, (-frameCount%10)+i*10, height);
      line(0, i*10, width, i*10);
    }
  
    stroke(0); // black
    for (int i = 1; i <= 2; i++)
      line(0, height/4*i, width, height/4*i); // Draw line, indicating 90 deg, 180 deg, and 270 deg
    
    //Choix de l'axe à représenter sur le graphe
    if(touches[0]){
      drawAxisX();
    } else if(touches[1]) {
      drawAxisY();  
    } else if(touches[2]){
      drawAxisY(); 
    }
    
  }
  
   updateAxis();
}


/*
 * Fonction déclanchée par appui touche clavier 
 */
void keyPressed() {
    if(key == 'x') touches[0]  = !touches[0];
    if(key == 'y') touches[1]  = !touches[1];
    if(key == 'z') touches[2]  = !touches[2];
    if(key == '1') touches[3]  = !touches[3];
    if(key == '2') touches[4]  = !touches[4];
    if(key == '3') touches[5]  = !touches[5];
    if(key == '4') touches[6]  = !touches[6];
    if(key == '5') touches[7]  = !touches[7];
    if(key == '6') touches[8]  = !touches[8];
    if(key == '7') touches[9]  = !touches[9];
    if(key == '8') touches[10] = !touches[10];
    if(key == '9') touches[11] = !touches[11];
    if(key == '0') touches[12] = !touches[12];

}
