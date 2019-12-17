color update_bg(color bg, float co2){
  float r = map(co2, 0, 100, 46, 200);
  float g = map(co2, 0, 100, 115, 37);
  float b = map(co2, 0, 100, 24, 56);
  return color(r, g, b);
  }
  
float[] update_co2(float co2, float change, float breath){
  float[] a = new float[2];
  if(co2 - change + breath >= 0){
    a[0] = co2 - change + breath;
    a[1] = change;
    return a;
  }else{
    a[0] = 0;
    a[1] = 0;
    return a;
  }
}

int update_tree(Tree[] tree, int amount, float change){
  if(tree[amount].size >= 0.5){
    tree[amount+1].update_size(change/100);
    return amount+1;
  }else{
    tree[amount].update_size(change/100);
    return amount;
  }
}
