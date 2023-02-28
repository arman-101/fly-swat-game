class Fly
{
  // members
  float x, y;
  float speed;

  PImage[] images = new PImage[2];
  int imageCounter = 0;

  // constructor
  Fly (float xInput, float yInput, float speedInput)
  {
    this.x = xInput;
    this.y = yInput;
    this.speed = speedInput;

    for (int i = 0; i < images.length; i++) {
      // Link - https://opengameart.org/content/red-horned-bee-fly-game-sprites-character
      images[i] = loadImage("Fly/fly" + (i+1) + ".png");
    }
  }

  // methods
  private void move(Cake other)
  {
    if (this.x < other.x)
    {
      this.x += this.speed;
    } else if (this.x > other.x)
    {
      this.x -= this.speed;
    }

    if (this.y < other.y)
    {
      this.y += this.speed;
    } else if (this.y > other.y)
    {
      this.y -= this.speed;
    }
  }

  private void display()
  {
    // Resizing images
    images[0].resize(35, 35);
    images[1].resize(35, 35);
    
    // Changing image in length of list via counter
    image (images[imageCounter/15 % images.length], x, y);
    imageCounter += 1;
  }

  void update()
  {
    move(cake);
    display();
  }
}
