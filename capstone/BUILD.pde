void build() {
  animateEverything(); //source in the GAME tab
  
  gameB.show();
  t0B.show();
  t1B.show();
  t2B.show();
  t3B.show();
  
  if (gameB.buttonClicked()) mode = GAME;
  if (health <= 0) mode = END;
  
  if (t0B.buttonClicked() && notCurrentlyPlacing()) {
    towers.add(new Tower(0,mouseX, mouseY));
    money -= 100;
  }
  if (t1B.buttonClicked() && notCurrentlyPlacing()) {
    towers.add(new Tower(1,mouseX, mouseY));
    money -= 200;
  }
  if (t2B.buttonClicked() && notCurrentlyPlacing()) {
    towers.add(new Tower(2,mouseX, mouseY));
    money -= 300; 
  }    
  if (t3B.buttonClicked() && notCurrentlyPlacing()) {
    towers.add(new Tower(3,mouseX, mouseY));
    money -= 400;    
  }
}

boolean notCurrentlyPlacing () {
  //status when placing == 0
  if (towers.size() > 0) return (towers.get(towers.size() - 1).status != 0);
  else return true;
}
