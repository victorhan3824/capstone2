void leaderboard() {
  background(tGreen);
  startB.show();
  
  allDisplay();
  
  if (startB.buttonClicked()) mode = INTRO;
}

void allDisplay() {
  fill(white);
  stroke(black);
  rectMode(CORNER);
  textAlign(CORNER, CENTER);
  
  rect(50, 50, width/2 - 100, 750);
  
  for (int i = 50; i < 800; i+= 50) {
    line(50, i, width/2 - 50, i);
  }
  line(width/2 - 130, 50, width/2 - 130, 800);
  
  fill(black);
  textSize(20);
  text("Name:", 70, 80);
  text("Score:", width/2 - 120, 80);
  
  dataDisplay();
  
  noStroke();
  //shade top 3
  fill(219, 183, 2, 100); // gold
  rect(50, 100, width/2 - 100, 50);
  fill(206, 205, 200, 100);
  rect(50, 150, width/2 - 100, 50);
  fill(255, 151, 46, 100);
  rect(50, 200, width/2 - 100, 50);
  
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
}

void dataDisplay() { //displaying graphical elements
  String[] stats = insertionSort(loadStrings("gamedata.txt"));
  
  for (int i = 0; i < stats.length && i < 14; i++) {
    text(split(stats[i], ":")[0], 70, 130 + i*50);
    text(split(stats[i],":")[1], width/2 - 120, 130 + i*50);
  }
  
  noFill();
}

public String[] insertionSort(String[] x) {
  //takes parameter unsorted array
  //after sorts the array from greatest to least
  
  for (int i = 1; i < x.length; i++) {
    String temp = x[i]; //temp String
    int j = i - 1; //while loop index, for each iteration begins at 1 index before i
    while (j >= 0 && retrieveNum(x[j]) < retrieveNum(temp)) { 
      //j traverses backwards towards index 0 when the score value of the string at index j is smaller than that for the string temp
      x[j+1] = x[j]; //swaps the order of two, to put the smaller value in front
      j--;
    }
    x[j+1] = temp; //ends this iteration with x[j+1] ending with the correct sorted string at this index
  }
  
  return x;
}

public int retrieveNum (String s) {
  //retrieves the num value of a string (used for extracting num value from saved String)
  String[] temp = split(s, ":");
  return (int(temp[1]));
}
