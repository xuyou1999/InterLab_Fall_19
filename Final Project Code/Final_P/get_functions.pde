float get_pressure(float[] sensorValues){
  return sensorValues[0]/20;
}

float get_breath(int tree_amount){
  return 0.1*(tree_amount + 1);
}

float get_change(float total_pressure, float p_pressure){
  if(total_pressure - p_pressure > 2.5){
    return 3;
  }else{
    return 0.0;
  }
}
