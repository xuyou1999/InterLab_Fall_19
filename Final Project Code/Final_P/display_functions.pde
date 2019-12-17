void display_start(){
  //test
    rect(400, 400, 200, 200);
    //if(mousePressed){
    //  break;
    //}
  //}
  //test
}

void display_bg(color bg){
  background(bg);
  fill(255, 255, 255);
  textSize(50);
  text("Humans Breath Consume O2 and Produce CO2", 400, 100);
  text("Trees Consume CO2 and Produce O2", 500, 200);
  textSize(100);
  text("SAVE ME!", 730, 900);
}

void display_tree(Tree[] tree, PImage photo_tree, int tree_amount){
  for(int i = 0; i < tree_amount + 1; i++){
    tree[i].display(photo_tree);
  }
}

void display_co2(float co2){
  //bg
  noStroke();
  fill(255, 255, 255);
  rect(200, 300, 100, 780);
  //co2
  float hight = map(co2, 0, 100, 0, 775);
  fill(255, 0, 0);
  rect(205, 1080-hight, 90, hight);
  //text
  fill(255, 255, 255);
  textSize(50);
  text("CO2", 200, 280);
}

void display_o2(float o2){
  //bg
  noStroke();
  fill(255, 255, 255);
  rect(1620, 300, 100, 780);
  //o2
  float hight = map(o2, 0, 100, 0, 775);
  fill(0, 255, 0);
  rect(1625, 1080-hight, 90, hight);
  //text
  fill(255, 255, 255);
  textSize(50);
  text("O2", 1635, 280);
}
