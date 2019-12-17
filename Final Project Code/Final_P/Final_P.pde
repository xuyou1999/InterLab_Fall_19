import processing.serial.*;
import processing.video.*;
import processing.sound.*;

String myString = null;
Serial myPort;

int NUM_OF_VALUES = 1;   /** YOU MUST CHANGE THIS ACCORDING TO YOUR PROJECT **/
float[] sensorValues;      /** this array stores values from Arduino **/

Movie explosion;
PImage globe;
SoundFile success;
SoundFile bomb;

color bg = color(46, 127, 24);
float change_p = 0;
float total_pressure = 0;
float p_pressure = 0;
int tree_amount = 0;
float o2 = 0;
float co2 = 0;
float breath = 0;
PImage photo_tree;
float[] co2_change_array = new float[2];
Tree[] tree;

boolean movie_mode = false;
boolean pause = false;
boolean bomb_play = false;

void setup(){
  size(1920, 1080);
  colorMode(RGB);
  setupSerial();
  photo_tree = loadImage("tree.png");
  tree = new Tree[20];
  for(int i = 0; i < tree.length; i ++){
    tree[i] = new Tree();
  }
  explosion = new Movie(this, "Explosion.mp4");
  globe = loadImage("globe.png");
  success = new SoundFile(this, "Success.mp3");
  bomb = new SoundFile(this, "bomb.mp3");
  //display_start();
}

void draw(){
  if(pause){
    background(0);
    textSize(100);
    text("PAUSED", 900, 500);
  }else{
    if(movie_mode == false){
      play_game();
      if(co2 >= 100){
        movie_mode = true;
        bomb_play = true;
        reset();
        explosion.play();
      }
    }else{
      if (explosion.available()) {
        explosion.read();
      }
      image(explosion, width/2, height/2);
      if (bomb_play){
        bomb.play();
        bomb_play = false;
      }
      if (explosion.time() == explosion.duration()){
        movie_mode = false;
        explosion.stop();
      }
    }
  }
}

void play_game(){
  updateSerial();
  //if(mousePressed){
  //  sensorValues[0] = 100;
  //}else{
  //  sensorValues[0] = 0;
  //}
  total_pressure = get_pressure(sensorValues);
  breath = get_breath(tree_amount);
  change_p = get_change(total_pressure, p_pressure);
  if(change_p > 0){
    success.play();
  }
  p_pressure = total_pressure;
  bg = update_bg(bg, co2);
  co2_change_array = update_co2(co2, change_p, breath);
  co2 = co2_change_array[0];
  change_p = co2_change_array[1];
  o2 = 100 - co2;
  tree_amount = update_tree(tree, tree_amount, change_p);
  
  display_bg(bg);
  pushMatrix();
  translate(960, 1250);
  scale(4, 1);
  image(globe, 0, 0);
  popMatrix();
  display_tree(tree, photo_tree, tree_amount);
  display_co2(co2);
  display_o2(o2);

}

void reset(){
  bg = color(46, 127, 24);
  tree_amount = 0;
  o2 = 0;
  co2 = 0;
  tree = new Tree[10];
  for(int i = 0; i < tree.length; i ++){
    tree[i] = new Tree();
  }
}

void keyPressed(){
  if(pause == true){
    pause = false;
  }else{
    pause = true;
  }
}
