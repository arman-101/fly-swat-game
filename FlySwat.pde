// Variables
final int OFF = 0;
final int ON = 1;
final int DONE = 2;

int gameMode = ON;
int fliesNumber = 5;
int score = 0;
int randX, randY;

// Initialising Classes
Cake cake;

// Creating Array List
ArrayList<Fly> flyList = new ArrayList<>();

void setup()
{
  size(500, 500);
  imageMode(CENTER);

  cake = new Cake(width/2, height/2);

  createFlies();
}

void draw()
{
  // Gamemode on
  if (gameMode == 1)
  {
    gameOn();
  }
  // Gamemode off
  else if (gameMode == OFF)
  {
    gameOff();
  }
  // Gamemode done
  else if (gameMode == DONE)
  {
    gameDone();
  }
}

void mouseClicked()
{
  for (int i = flyList.size () -1; i >= 0; i--)
  {
    Fly currentFly = flyList.get(i);
    int distance = 20;
    if (dist(mouseX, mouseY, currentFly.x, currentFly.y) < distance)
    {
      flyList.remove(currentFly);
      score += 1;
    }
  }
}

void gameOn() {
  background(255);
  textSize(20);
  fill(0, 0, 255);
  text("Score : " + score, 10, 25);

  cake.display();
  for (int i = flyList.size () -1; i >= 0; i--)
  {
    Fly currentFly = flyList.get(i);

    // Update fly when not close to cake
    if (!cake.collision(flyList.get(i)))
    {
      currentFly.update();
    }
    // When fly collides with cake, gamemode changes to off
    if (cake.collision(currentFly))
    {
      gameMode = OFF;
    }
  }
  // When score is equal to number of flies, all flies are hit, so gamemode is done
  if (score == fliesNumber)
  {
    gameMode = DONE;
  }
}

void gameOff() {
  background (0);
  fill (255, 0, 0);
  textSize (48);
  text ("Game over.", 135, 150) ;
  textSize (24);
  text ("You got " + score + " flies", 175, 250) ;
  text ("You missed " + (fliesNumber - score) + " of them", 135, 300) ;
  textSize(20);
  text ("Resources", 18, 375) ;
  textSize(14);
  // Links to images for the cake and fly
  text ("Cake Image Link:\nhttps://opengameart.org/content/cute-cakes", 20, 400);
  text ("Fly Image Link:\nhttps://opengameart.org/content/red-horned-bee-fly-game-sprites-character", 20, 450);
}

void gameDone() {
  background (0);
  fill (0, 255, 0);
  textSize (48);
  text ("Well Done!", 135, 150) ;
  textSize (30);
  text ("You got all " + score + " Flies.", 130, 250) ;
  textSize(20);
  text ("Resources", 18, 375) ;
  textSize(14);
  // Links to images for the cake and fly
  text ("Cake Image Link:\nhttps://opengameart.org/content/cute-cakes", 20, 400);
  text ("Fly Image Link:\nhttps://opengameart.org/content/red-horned-bee-fly-game-sprites-character", 20, 450);
}

// Makes Random Coordinates for the flies
void makeCoords() {
  randX = int ( random (0, width) );
  randY = int ( random (0, height) );
}

// Checks if Coordinates from the MakeCoords procedure range from 0-150 and 350-500
boolean checkCoords(int randX, int randY) {
  if (randX > 150 && randX < 350)
    return false;
  else if (randY > 150 && randY < 350)
    return false;
  else
    return true;
}

void createFlies() {

  // Loops to create fly objects
  for (int i=0; i< fliesNumber; i++) {
    // Creates random coordinates in between 0-150 and 350-500
    makeCoords();
    while (!checkCoords(randX, randY))
    {
      makeCoords();
    }

    flyList.add( new Fly (randX, randY, 0.5) );
  }
}
