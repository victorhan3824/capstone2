//final variables
final int INTRO = 0;
final int END = 1;
final int GAME = 2;
final int BUILD = 3;
final int LEADERBOARD = 4;
final int SELECT = 5;

//colors
final color blue =   #023e8a;
final color red =    #d00000;
final color gold =   #ffc300;
final color black =  #000000;
final color white =  #ffffff;
final color indigo = #03045e;
final color brown =  #bc8a5f;

//tile colors (on the map, this is what the program will be reading)
final color tBlue   = #00b7ef; //river
final color tRed    = #ed1c24; //path
final color tYellow = #fff200; //village
final color tGreen  = #a8e61d; //land
final color tWhite  = #ffffff; //starting block
final color tBlack  = #000000; //ending block

//map
PImage map1, map2, map3, map4; //the 4 maps
PImage map1pic, map2pic, map3pic, map4pic; //the 4 pics that are used for buttons selecting maps

//int/float variables----------------------------------
int mode, tileSize;
float startX, startY;
int money, health, waveNum;
int amtSpawned; //used for enemy spawning

//buttons -----------------------------------------
Button playB, leaderboardB, map1B, map2B, map3B, map4B;
Button buildB, nextWaveB, gameB;
Button t0B, t1B, t2B, t3B; //tower building buttons
Button returnB;
Button startB; //go from leaderboard mode to start screen

//aesthetics -------------------------------------------
PFont font;
PImage land, road, mountain, water;
String userName;

//array & arraylists
Tile[][] terrain;
ArrayList<Enemy> enemies;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;

//actual code-------------------------------------------
void setup() {
  fullScreen();
  imageMode(CENTER);
  mode = INTRO;
  
  numbersInitiate();
  arrInitiate();
  aestheticsLoad();
  loadMap();
  buttonMake();
  
  textFont(font, 24);
}

void numbersInitiate() {
  //initialize int and float
  tileSize = 32;
  
  health = 1;
  money = 9999;
  waveNum = amtSpawned = 0;
}

void arrInitiate() {
  //initialize array and arraylists
  terrain = new Tile[48][25]; //must be 48 x 25
  enemies = new ArrayList<Enemy>();
  towers  = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
}

void aestheticsLoad() {
  //load images & fonts  
  font = createFont("aesthetics/Napoleon-Bold.ttf", 24);
  
  land = loadImage("aesthetics/land.jpeg");
  road = loadImage("aesthetics/road.png");
  mountain = loadImage("aesthetics/village.png");
  water = loadImage("aesthetics/water.jpg");
  
  
  //resize image
  PImage[] P = {land, road, mountain, water};
  for (int i=0; i<P.length; i++) {
    P[i].resize(tileSize, tileSize);  
  }
  
  //LEADERBOARD Mode stuff
  userName = "";
}

void loadMap() {
  //loading in the maps and the map pics for buttons
  map1 = loadImage("everything about maps/map1.png");
  map2 = loadImage("everything about maps/map2.png");
  map3 = loadImage("everything about maps/map3.png");
  map4 = loadImage("everything about maps/map4.png");  
  
  //the images, random for now, no need to resize because it's done in the constructor for the buttons
  map1pic = loadImage("everything about maps/map1pic.jpg");
  map2pic = loadImage("everything about maps/map2pic.jpg");
  map3pic = loadImage("everything about maps/map3pic.jpg");
  map4pic = loadImage("everything about maps/map4pic.jpg");
}

void buttonMake() {
  //INTRO
  playB = new Button(0, width*0.8, 600, 300, 60, 3, 0, blue, white, gold, "PLAY");
  leaderboardB = new Button(0, width*0.8, 675, 300, 60, 3, 0, blue, white, gold, "LEADERBOARD");
  
  //SELECT
  map1B = new Button(1,width/5,height/2,200,200,3,white,map1pic);
  map2B = new Button(1,width*0.4,height/2,200,200,3,white,map2pic);
  map3B = new Button(1,width*0.6,height/2,200,200,3,white,map3pic);
  map4B = new Button(1,width*0.8,height/2,200,200,3,white,map4pic);
  
  //GAME
  buildB = new Button(0, width*0.88, 832, 100, 50, 3, 0, white, gold, indigo, "BUILD");
  nextWaveB = new Button(0, width*0.95, 832, 100, 50, 3, 0, white, gold, indigo, "SEND"); 
  
  //BUILD
  gameB = new Button(0, width*0.95, 832, 100, 50, 3, 0, white, gold, indigo, "PLAY");
  t0B =   new Button(0, 160, 832, 300, 50, 3, 0, white, gold, indigo, "type1");
  t1B =   new Button(0, 470, 832, 300, 50, 3, 0, white, gold, indigo, "type2");
  t2B =   new Button(0, 780, 832, 300, 50, 3, 0, white, gold, indigo, "type3");
  t3B =   new Button(0, 1090, 832, 300, 50, 3, 0, white, gold, indigo, "type4");
  
  //END
  returnB = new Button(0, width*0.8, 675, 300, 60, 3, 0, blue, white, gold, "Save and Return");
  
  //leaderboard
  startB = new Button(0, width*0.8, 675, 300, 60, 3, 0, blue, white, gold, "Return to Start");
}

void draw() {
  switch(mode) {
    case INTRO:
      intro();
      break;
    case SELECT:
      select();
      break;
    case GAME:
      game();
      break;
    case BUILD:
      build();
      break;
    case END:
      end();
      break;
    case LEADERBOARD:
      leaderboard();
      break;
  }
}
