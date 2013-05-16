/*
 * record()
 *
 * Enregistre les données capteurs dans un fichier (cf. setup()) 
 */
void record(){
 
    if((millis()-temps) > 499) //Toute les 0.5 sec
    {
      
       output.println(millis() + "  " + pitch + "  " + roll);
       output.flush();
      
      temps = millis();
    }
  
}
