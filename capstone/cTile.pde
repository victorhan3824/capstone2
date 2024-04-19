
class Tile {
  float x ,y, w, h; //x, y, width, height
  int type; //type of the tile
  //0: land, 1: path, 2: village, 3: river, 4: end
  PImage tileGraphic;
  
  Tile(float X, float Y, int T) {
    this.x = X;
    this.y = Y;
    this.w = tileSize;
    this.h = tileSize;
    this.type = T;
    this.tileGraphic = null;
  }
  
  void show() {
    image(tileGraphic, x , y);    
    
    if (towers.size() != 0) { //this part checks whether player is placing tower, and display the tile accordingly
      Tower T = towers.get(towers.size() - 1);
      if (T.status == 0 && this.type != 0) {
        noStroke();
        fill(255,0,0,150);    
        square(x, y, 32);
      }
    }
  }  
} 
