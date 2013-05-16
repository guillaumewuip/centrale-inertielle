/*
 * record()
 *
 * Enregistre les données capteurs dans un fichier (cf. setup()) 
 */
void record(){
 
    if((millis()-temps) > 499) //Toute les 0.5 sec pour limiter le nombre de données
    {
       //On construit la ligne
       output.println(millis() + "  " + SaccX + "  " + SaccY + "  " + SaccZ + "  " + SgyroXrate + "  " + SgyroYrate + "  " + SgyroZrate + "  " + SaccXangle + "  " + SaccYangle + "  " + SaccZangle + "  " + SgyroXangle + "  " + SgyroYangle + "  " + SgyroZangle + "  " + ScompAngleX + "  " + ScompAngleY + "  " + ScompAngleZ + "  " + SkalAngleX + "  " + SkalAngleY + "  " + SkalAngleZ + "  " + Stemp);
       output.flush(); //on écrit dans le fichier
      
       temps = millis();
    }
  
}
