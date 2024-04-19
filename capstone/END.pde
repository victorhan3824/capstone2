
void end() {
  background(red);
  
  stroke(black);
  fill(white);
  rect(width/2, height/2, 500, 50);
  textSize(100);
  text("You Lost", width/2, 100);
  textSize(20);
  text("Score: " + waveNum, width/2, 175);
  
  textAlign(CORNER, CENTER); //instructional text
  textSize(20);
  text("Type your name to save your score. Viewable in Leaderboard Mode", width/2 - 240, height/2 - 100);
  text("Once done, return to main menu to save", width/2 - 240, height/2 - 50);
  
  fill(black); //textbox text
  text(userName, width/2 - 240, height/2);
  noFill();
  textAlign(CENTER, CENTER);

  returnB.show();
  if (returnB.buttonClicked()) {
    mode = INTRO;
    gameReset();
  }
}

void gameReset() {
  //playername reset & save
  saveGameScore(); //must be before game reset  
  userName = "";
  
  //game aspects reset
  health = 1;
  money = 9999;
  waveNum = amtSpawned = 0;
  enemies.clear();
  towers.clear();
}

void saveGameScore() { //saves user name and game score
  String[] oldSave = loadStrings("gamedata.txt");
  String[] newSave = new String[oldSave.length + 1];
  for (int i =0; i < oldSave.length; i++) {
    newSave[i] = oldSave[i]; //copy the old save data into the new save
  }
  newSave[newSave.length - 1] = userName + ":" + str(waveNum); //add the newly saved value
  saveStrings("gamedata.txt", newSave);
  
}

void keyTyped() { //used for typing
  boolean letter = (key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z');
  if (mode == END) {
    if (letter || key == ' ' || (key >= '0' && key <= '9')) { 
      userName += key;
     }else if (key == BACKSPACE && userName.length() > 0) {
      userName = userName.substring(0,userName.length() - 1);
    }
  }
}
