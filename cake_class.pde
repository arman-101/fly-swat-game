class Cake
{
  // members
  int x, y;
  PImage cake;

  // constructor
  Cake (int xInput, int yInput)
  {
    this.x = xInput;
    this.y = yInput;
    
    // Link - https://opengameart.org/content/cute-cakes
    cake = loadImage("Cake/pink cake.png");
  }

  // methods
  void display()
  {
    imageMode(CENTER);
    cake.resize(50, 50);
    image(cake, x, y);
  }
  
  boolean collision(Fly other) {
    
  float distance = 35;
  if (dist(this.x, this.y, other.x, other.y) < distance)
  {
    return true;
  }
  return false;
  }
}
