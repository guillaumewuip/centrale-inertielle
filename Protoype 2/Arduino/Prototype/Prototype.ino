/*
 * Stabilisation d'une plateforme selon tangage et roulis
 *
 * Infos capteur IMU MP6050
 * Commandes de deux servos
 * Communication optionnel avec un programme Processing via USB
 *
 */
 
#include <Wire.h>
#include "Kalman.h"
#include <Servo.h> 

Kalman kalmanX;
Kalman kalmanY;
Kalman kalmanZ;

uint8_t IMUAddress = 0x68; //port de connexion IMU
 
//Paramètres généraux
boolean serial = true;
boolean debug = false;

//Ports Arduino de commande servos
int portServoP = 10; 
int portServoR = 9;
Servo servoP;
Servo servoR;

//Décalage pour horizonalité
int optP = -8;
int optR = -14;

//Positions (0-180)
int valueP = 90+optP;
int valueR = 90+optR;

double start = millis();
double temps = start;

//Variables IMU

/* IMU Data */
int16_t accX;
int16_t accY;
int16_t accZ;
int16_t tempRaw;
int16_t gyroX;
int16_t gyroY;
int16_t gyroZ;

//Température
double temp;
// Angles calculés depuis l'accéléromètre
double accXangle; 
double accYangle;
double accZangle;
//Vitesses angualaires
double gyroXrate; 
double gyroYrate;
double gyroZrate;
// Angles calculés depuis le gyroscope
double gyroXangle = 90; 
double gyroYangle = 90;
double gyroZangle = 90;
// Angles calculés avec un filtre maison 
//@see github.com/TKJElectronics/Example-Sketch-for-IMU-including-Kalman-filte 
double compAngleX = 90; 
double compAngleY = 90;
double compAngleZ = 90;
// Angles calculé avec un filtre Kalman
double kalAngleX;
double kalAngleY;
double kalAngleZ;

uint32_t timer;

/*
 * Setup()
 *
 * Actions au démarrage : lancement écoutes, lancement communication usb
 *
 */
void setup(){
  
  //Servos
  servoP.attach(portServoP);
  servoR.attach(portServoR);
  
  servoP.write(90);
  servoP.write(90);
  
  //Connexion IMU
  Wire.begin();
  i2cWrite(0x6B,0x00); // Disable sleep mode  
  
  //Connexion Processing
  if(serial)
  {
    Serial.begin(115200);
    Serial.print("Start");Serial.print("\n");
    
    if(i2cRead(0x75,1)[0] != 0x68) { // Read "WHO_AM_I" register
      Serial.print(F("MPU-6050 0x"));
      Serial.print(IMUAddress, HEX);
      Serial.println(F(" n'est pas connecté"));
    }
    else{
      Serial.println("accX  accY  accZ  gyroXrate  gyroYrate  gyroZrate  accXangle  accYangle  accXangle  gyroXangle  gyroYangle  gyroZangle  compAngleX  compAngleY  compAngleZ  kalAngleX  kalAngleY  kalAngleZ");
      Serial.print("\n");
    } 
  }
  
  kalmanX.setAngle(0); // On définie l'angle de départ
  kalmanY.setAngle(0);
  kalmanZ.setAngle(0);
  
  //On stocke le temps en micro-secondes
  timer = micros();
  
}
