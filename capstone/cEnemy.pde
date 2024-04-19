
public class Enemy {
  float x, y, vx, vy, s, d;
  int hp, maxHP, value;
  PImage graphics;
  int Xtile, Ytile, prevXtile, prevYtile;

  public Enemy(float X, float Y, float VX, float VY, float S, float D, int HP, int V, PImage I) {
    x = X;
    y = Y;
    vx = VX;
    vy = VY;
    hp = maxHP = HP;
    value = V; //amount of reward after killing the enemy
    s = S; //control speed of the enemy
    d = D; //control the size, the diameter of the enemy, used for collision and display
    graphics = I; //graphics
    graphics.resize(int(d), int(d));
    
    Xtile = prevXtile = int((startX-tileSize/2)/tileSize); 
    Ytile = prevYtile = int((startY-tileSize/2)/tileSize);    
  } 
  
  void show() {
    gettingHit();
    
    noStroke();
    fill(gold);
    circle(x,y,d);
    healthbar();
  }
  
  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-d/2-2, y-(d/2+10)-2, d+4, 6);//background
    fill(white);
    rect(x-d/2, y-(d/2+10), d, 5);
    fill(color(0,255,0));
    rect(x-d/2, y-(d/2+10), hp*d/maxHP, 5);
    rectMode(CENTER);
  }
  
  void gettingHit() {
     if (hp <= 0) enemies.remove(this);
  }
  
  void move() {
    if ((x-tileSize/2) % tileSize == 0 && (y-tileSize/2) % tileSize == 0) {
      prevXtile = Xtile; //setting the tile previously on as the prev tile
      prevYtile = Ytile;
      
      Xtile = int((x-tileSize/2)/tileSize); //find the current X tile we are on
      Ytile = int((y-tileSize/2)/tileSize); //find the current Y tile we are on
      
      //println(Xtile + "," + Ytile);      
      //println("(" + prevXtile + "," + prevYtile + ")");      
      
      //make sure don't draw a map that touch the edges, otherwise it's array list out of bound;
      if (terrain[Xtile + 1][Ytile].type == 1 && Xtile+1 != prevXtile) {
        vx = 1;
        vy = 0;
      } else if (terrain[Xtile - 1][Ytile].type == 1 && Xtile-1 != prevXtile) {
        vx = -1;      
        vy = 0;  
      } else if (terrain[Xtile][Ytile+1].type == 1 && Ytile+1 != prevYtile) { 
        vy = 1;
        vx = 0;
      } else if (terrain[Xtile][Ytile-1].type == 1 && Ytile-1 != prevYtile) {
        vy = -1;
        vx = 0;
      } else if (terrain[Xtile][Ytile].type == 4) { //reaching the end
        enemies.remove(this);
        health-=value; //reduce player health
      }
    }
    x += vx*s;
    y += vy*s;
  }
}
