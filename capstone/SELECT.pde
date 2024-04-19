
void select() {
  generalDisplay();
  selectionCalculation();
}

void generalDisplay() {
  background(gold);
  
  textSize(72);
  text("SELECT YOUR BATTLE", width/2, 150);
  
  textSize(32);
  map1B.show();
  text("A", width/5, 550);
  map2B.show();
  text("A", width*0.4, 550);
  map3B.show();
  text("A", width*0.6, 550);
  map4B.show();  
  text("A", width*0.8, 550);
}

void selectionCalculation() {
  if (map1B.buttonClicked()) {
    mode = GAME;
    loadTerrain(map1);
  }
  if (map2B.buttonClicked()) {
    mode = GAME;
    loadTerrain(map2);
  }
  if (map3B.buttonClicked()) {
    mode = GAME;
    loadTerrain(map3);
  }
  if (map4B.buttonClicked()) {
    mode = GAME;
    loadTerrain(map4);
  }  
}

void loadTerrain(PImage MAP) {
  //println(MAP.width + "," + MAP.height);
  
  for (int x=0; x<MAP.width; x++) {
    for (int y=0; y<MAP.height; y++) {
      color c = MAP.get(x,y);
      Tile t = new Tile(tileSize/2 + x*tileSize, tileSize/2 + y*tileSize, 0);
      switch(c) {
        case tGreen:
          t.type = 0;
          t.tileGraphic = land;
          break;
        case tRed:
          t.type = 1;
          t.tileGraphic = road;
          break;
        case tYellow:
          t.type = 2;
          t.tileGraphic = mountain;
          break;
        case tBlue:
          t.type = 3;
          t.tileGraphic = water;
          break;
        case tWhite: //starting block, only difference between this and regular road is that the system would copy down the coords for these
          t.type = 1;
          t.tileGraphic = road;
          startX = t.x;
          startY = t.y;
          break;
        case tBlack: //ending block
          t.type = 4;
          t.tileGraphic = road;
          break;
      }

      terrain[x][y] = t;
    }
  }
}
