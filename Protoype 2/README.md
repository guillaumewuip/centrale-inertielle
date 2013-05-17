Prototype 2
===========
Utilisation d'un capteur IMU [MP6050](https://www.sparkfun.com/products/11028) connecté en I2C sur la carte Arduino. L'ordinateur ne sert plus que d'affichage des données en debug

Utilisation
------------

1. Brancher la carte Arduino pilotant les deux servos et le capteur IMU en USB pour y uploader le programme Arduino.
2. Débrancher le protype si on n'utilise pas de debug. Sinon, rester branché en USB et lancer le programme Processing Graph.pde.

Branchement du capteur MP6050
------------------------------
*https://www.sparkfun.com/products/11028#comment-50b3c165ce395f484d000000*

VDD - Arduino 3.3v

GND - Arduino GND

INT - Arduino digital pin 2

FSYNC - leave unconnected

SCL - Arduino SCL (dedicated pin or Analog 5)

SDA - Arduino SDA (dedicated pin or Analog 4)

VIO - Arduino 3.3v

CLK - leave unconnected

ASCL - leave unconnected

ASDA - leave unconnected
