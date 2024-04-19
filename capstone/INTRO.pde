
void intro() {
  background(brown);  
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  
  buttonCalculations();
}

void buttonCalculations() {
  leaderboardB.show();
  playB.show();
  
  if (playB.buttonClicked()) mode = SELECT;
  if (leaderboardB.buttonClicked()) mode = LEADERBOARD;
}
