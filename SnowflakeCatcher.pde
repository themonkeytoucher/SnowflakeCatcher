Snowflake Ice = new Snowflake();
Snowflake[] snow;
int mx,mx2,my,my2;

void setup()
{
  size(300,300);
  snow = new Snowflake[300];
  for (int i=0;i<snow.length;i++){
    snow[i]=new Snowflake();
  }
  
  background(0);
}

void draw()
{
  for (int i=0;i<snow.length;i++){
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
  }
}

void mouseDragged()
{
  stroke(255,0,0);
  strokeWeight(3);
  line(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(1);
}

class Snowflake
{
  int x,y;
  boolean isMoving;

  Snowflake()
  {
    x = (int)(Math.random()*300);
    y = (int)(Math.random()*300);
    isMoving = true;
  }

  void show()
  {
    fill (255);
    stroke(0);
    ellipse(x,y,5,5);
  }

  void lookDown()
  {
    if (x>0 && x<301 && y>0 && y<290) {
      if (get(x,y+4) != color (0)){
        isMoving = false;
      } else {
        isMoving = true;
      }
    }
  }

  void erase()
  {
    fill(0);
    stroke(0);
    ellipse(x,y,7,7);
  }

  void move()
  {
    if (isMoving == true ) {
      y++;
    }
  }

  void wrap()
  {
    if (y>300) {
      y=0;
      x=(int)(Math.random()*300);
    }
  }
}


