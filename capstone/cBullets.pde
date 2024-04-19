public class Bullet {
  float x, y, vx, vy, startX, startY;
  int range;
  
  public Bullet(float X, float Y, float VX, float VY, int R) {
    x = startX = X;
    y = startY = Y;
    vx = VX;
    vy = VY;
    range = R;
  }
  
  void act() {
    fill(black);
    circle(x, y, 6);
    x += vx;
    y += vy;
    
    collideWithEnemy();
    //self removal if outside range
    if (dist(startX, startY, x, y) > range) bullets.remove(this);
  }
  
  void collideWithEnemy() {
    for (int i=0; i<enemies.size(); i++) {
      Enemy e = enemies.get(i);
      if (dist(x, y, e.x, e.y) < e.d/2) {//if collide
        e.hp--;   
        bullets.remove(this);
      }
    }
  }
}
