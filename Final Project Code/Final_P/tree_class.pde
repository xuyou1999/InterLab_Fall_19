class Tree{
  float size = 0;
  float x;
  float y;
  Tree(){
    x = 50* random(-15, 15);
    //y = random(50, 500);
  }
  void update_size(float in_size){
    size += in_size;
  }
  void display(PImage photo){
    pushMatrix();
    imageMode(CENTER);
    translate(960+x, 1080-554*size);
    scale(size);
    image(photo, 0, 0);
    popMatrix();
  }
}
