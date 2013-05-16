/*
 * Programme Processsing
 *
 * Debug des données envoyées par le programme arduino de stabilisation d'une plateforme  
 *
 * Affichage 3D ou courbes
 * Log des données en csv
 */

import processing.serial.*; 
Serial arduino; 

PrintWriter output;

//Paramètres
boolean debug = true;
boolean log = true;
boolean show3D = true; // Représentation 3D de la plateforme en mouvement ?

int width  = 1200;
int height = 800;

//Date et Heure
String thedate = day()+"-"+month()+"-"+year();
String thetime = hour()+"-"+minute();
long temps;

/* Variables pour données reçues sur serial (voir prg Arduino) */
//Accélérations linéaires
String SaccX;
String SaccY;
String SaccZ;
//Accélérations angulaires
String SgyroXrate;
String SgyroYrate;
String SgyroZrate;
//Angles calculés avec accéléromètre
String SaccXangle;
String SaccYangle;
String SaccZangle;
//Angles calculés avec gyroscope
String SgyroXangle;
String SgyroYangle;
String SgyroZangle;
//Angles calculés avec filtre complémentaire
String ScompAngleX;
String ScompAngleY;
String ScompAngleZ;
//Angles calculés avec filtre kalman
String SkalAngleX;
String SkalAngleY;
String SkalAngleZ;
//Température
String Stemp;

//Données extraites
float[] accX = new float[width];
float[] accY = new float[width];
float[] accZ = new float[width];

float[] gyroXrate = new float[width];
float[] gyroYrate = new float[width];
float[] gyroZrate = new float[width];

float[] accXangle = new float[width];
float[] accYangle = new float[width];
float[] accZangle = new float[width];

float[] gyroXangle = new float[width];
float[] gyroYangle = new float[width];
float[] gyroZangle = new float[width];

float[] compAngleX = new float[width];
float[] compAngleY = new float[width];
float[] compAngleZ = new float[width];

float[] kalAngleX = new float[width];
float[] kalAngleY = new float[width];
float[] kalAngleZ = new float[width];

float[] temp = new float[width];

boolean[] touches = new boolean[13];


/*
 * Fonction setup()
 * Déclanchée une fois au démarrage du programme
 */
void setup(){
  
  if(show3D){
     //Si 3D, on active le P3D
     print("--- running 3D. \n");
     size(width, height, P3D);
     noStroke();
  } else {
    size(width, height); 
  }
 
  if(debug)
    println(Serial.list()); //Liste de tous les ports disponibles 
  arduino = new Serial(this, Serial.list()[4], 115200); //Connexion arduino au bon port (à changer selon config)
  
  arduino.bufferUntil('\n'); //Mise en mémoire ligne par ligne
  
  //Log data csv
  if(log)
  {
    output = createWriter("data-" + thedate + "-" + thetime + ".csv");
    output.println("time  pitch  roll");
    output.flush();
    if(debug)
      println("\n --- Record Started. \n");
  }
  
  // On prépare les variables
  for (int i=0;i<width;i++) 
  { 
    accX[i]   = height/2;
    accY[i]   = height/2;
    accZ[i]   = height/2;
    
    gyroXrate[i]   = height/2;
    gyroYrate[i]   = height/2; 
    gyroZrate[i]   = height/2; 
    
    accXangle[i]   = height/2;
    accYangle[i]   = height/2; 
    accZangle[i]   = height/2; 

    gyroXangle[i] = height/2; 
    gyroYangle[i] = height/2;
    gyroZangle[i] = height/2;
    
    compAngleX[i] = height/2; 
    compAngleY[i] = height/2;
    compAngleZ[i] = height/2;
    
    kalAngleX[i] = height/2; 
    kalAngleY[i] = height/2;
    kalAngleZ[i] = height/2;
    
    temp[i] = height/2;
  }
  
  //Paramètrage des touches claviers
  for(int i = 0; i<13; i++){
    touches[i] = false; 
  }
  //On active l'affichage du graph x et des valeurs Kalman 
  touches[0] = true; 
  touches[6] = true;
  
}
