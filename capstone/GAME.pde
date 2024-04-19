void game() {
  /*
  display: 1536 x 864, this is the dimensions for the canvas for processing, 
  however build bar is at the buttom, so actual display is 1536 x 800
  this means when tileSize = 32, map needs to be 48 x 25  
  */
  animateEverything();
  
  nextWaveB.show();
  buildB.show();
  
  int totalAmt = waveNum;
  if (nextWaveB.buttonClicked() && enemies.size() == 0 && amtSpawned == totalAmt) {
    waveNum++;
    amtSpawned = 0;
  }
  if (frameCount % 30 == 0 && amtSpawned < totalAmt) {
    enemies.add(new Enemy(startX, startY, 0, 0, 8, 50, 100, 1, map1)); //enemy speed can ONLY be 1,2,4,8,16 (due to the movement code)
    amtSpawned++;
  }
  
  if (buildB.buttonClicked()) mode = BUILD;
  if (health <= 0) mode = END;  
}

void animateEverything() { //also used in BUILD
  //this function is for displaying everything that is shown in both GAME and BUILD
  background(white);
  noStroke();
  //the bar
  fill(blue);
  rect(width/2, 832, width, 64);
  //showing terrain
  terrainShow();  
  //calculating things for enemies
  for (int i=0; i<enemies.size(); i++) {
    Enemy e = enemies.get(i);
    e.show();
    e.move();
  }
  //calculating things for towers
  for (Tower t: towers) {
    t.act();  
  }
  //calculating things for bullets
  for (int i=0; i<bullets.size(); i++) {
    bullets.get(i).act();  
  }
  //wave count display
  textSize(32);
  fill(indigo);
  text("WAVE COUNT: " + waveNum, width/2, 38);
  
  //money and health display
  textSize(16);
  fill(indigo);
  text("Health: " + health, 1450,38);
  text("Resources: " + money, 1450, 55);
}

void terrainShow() {
  //draw the terrain
  for (Tile[] tt: terrain) {
    for (Tile t: tt) {
      t.show();  
    }
  }
}
