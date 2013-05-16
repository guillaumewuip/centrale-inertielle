/*
 * xyz()
 *
 * Ecoute des accélérations linéaires
 */
void xyz(float _x, float _y, float _z) {
  x = _x;
  y = _y;
  z = _z;
  
  //print(x +" "+ y +" "+ z + "\n\r");
  
  accXval = -(x-0.5)*10;
  accYval = (y-0.5)*10;
  accZval = (z-0.5)*10;
  
  //print(accXval + " " + accYval + " " + accZval + "\n\r");
  
  //Angle value in radians (from 0 to PI)
  pitchCalc = -atan2(accYval, accZval)+PI/2;
  rollCalc = -atan2(accXval, accZval)+PI/2;
  
}

/*
 * pry()
 *
 * Ecoute des positions angulaires
 */
void pry(float _pitch, float _roll, float _yaw, float _accel) {
  pitch = _pitch;
  roll = _roll;
  yaw = _yaw;
  
  accel = abs(_accel-0.206);
  
  //print(accel*100);
  
  //print ("xyz "+x+" "+y+" "+z+"\n"); 
  //print ("pry "+pitch+" "+roll+" "+yaw+"\n"); 
}

