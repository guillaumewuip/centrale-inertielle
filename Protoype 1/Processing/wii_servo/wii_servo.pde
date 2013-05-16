/*
 * Stabilisation d'une plateforme à partir des capteurs Wii 
 *
 * Utilisation des données de positions angulaires et d'accélérations linéaires
 *
 * Nécessite OSCulator (OSX only) pour récupération des données
 * Pas de solution Windows/Linux pour l'instant
 *
 */

/*
 * Initialisation
 */

//Librairies 
import oscP5.*; //OSCulator
import netP5.*;

OscP5 osc;

import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

PrintWriter output;

//Variables Globales

//Paramètres généraux
boolean show3D = true; // Représentation 3D de la plateforme en mouvement ?
boolean arduinoConnected = true; // Arduino connecté ? 
boolean debug = true; //Debug activé ?
boolean log = true; //Log activé ?

//Date et Heure
String thedate = day()+"-"+month()+"-"+year();
String thetime = hour()+"-"+minute();

long temps;

//Ports Arduino de commande servos
int servoP = 5; 
int servoR = 6; 

//Décalage pour horizonalité
int optP = 6;
int optR = 10;

//Positions (0-180)
int valueP = 90+optP;
int valueR = 90+optR;

//Positions angulaires
float pitch, roll, yaw;
float accel; //Accélération des positions angulaires 

//Accélérations linéraires
float x, y, z;

//Pitch et Roll calculé en fonction des accélérations x, y, z
float accXval, accYval, accZval;
float pitchCalc, rollCalc;

/*
 * Setup()
 *
 * Actions au démarrage : création liaisons arduino, lancement écoutes Wii
 *
 */
void setup(){
  
  //Taille fenêtre graphique
  if(show3D){
     print("--- running 3D. \n");
     size(800, 460, P3D);
     noStroke();
  }
  else
    size(600,600);

  //Arduinno
  if(arduinoConnected){
    //println(Arduino.list());
    arduino = new Arduino(this, Arduino.list()[4]); //Choisir le bon port
    
    if(debug)
      print("--- Arduino connected. \n");
    
    //Définir les ports comme sorties
    arduino.pinMode(servoP, Arduino.OUTPUT);
    arduino.pinMode(servoR, Arduino.OUTPUT);
    
    if(debug)
      print("--- Ports Ok. \n");
    
    //Ecriture des positions
    arduino.analogWrite(servoP, valueP);
    arduino.analogWrite(servoR, valueR);
    
  }
  
  //Ecoutes Wii
  osc = new OscP5(this,9000);
  osc.plug(this,"xyz","/wii/1/accel/xyz"); 
  osc.plug(this,"pry","/wii/1/accel/pry"); 
  
  //Log data csv
  if(log)
  {
    output = createWriter("data-" + thedate + "-" + thetime + ".csv");
    //output.println("--- Record Started ---");
    output.println("time  pitch  roll");
    output.flush();
    
    if(debug)
      println("\n --- Record Started. \n");
  }
  
}




