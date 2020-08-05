public class Life{
  public static final double FRAMEHOUR=.1;
  public static final boolean FRAMEDEPENDENCY=false;
  protected double age;
  protected double SIZE;
  protected boolean alive,reproduced;
  protected int CLOCK;
  public Vector p;
  public Predator[] a;public Prey[] b;public Plant[] c;
  public Life(double age,double size,boolean alive,Vector p){this.age=age;this.SIZE=size;this.alive=alive;this.reproduced=false;this.CLOCK=FRAMEDEPENDENCY?millis():frameCount;this.p=p;}
  public void link(Predator[] a,Prey[] b,Plant[] c){this.a=a;this.b=b;this.c=c;}
  public double getAge(){return this.age;}
  public double getSize(){return this.SIZE;}
  public boolean isAlive(){return this.alive;}
  public int getClock(){return this.CLOCK;}
  public Vector getLoc(){return this.p;}
  public void setAge(double age){this.age=age;}
  public void setSize(double size){this.SIZE=size;}
  public void setAlive(boolean alive){this.alive=alive;}
  public void setLoc(Vector p){this.p=p;}
  public boolean detectCollisionX(){return this.getLoc().x<this.getSize()||this.getLoc().x>width-this.getSize();}
  public boolean detectCollisionY(){return this.getLoc().y<this.getSize()||this.getLoc().y>height-this.getSize();}
  public boolean detectCollision(Life x){return Vector.dist(this.getLoc(),x.getLoc())<this.getSize()+x.getSize();}
  public int regulate(){return FRAMEDEPENDENCY?millis()-this.CLOCK:frameCount-this.CLOCK;}
  public void update(){grow();display();this.CLOCK=FRAMEDEPENDENCY?millis():frameCount;}
  protected void grow(){this.age+=this.regulate()/(365*24)*FRAMEHOUR;}
  protected void display(){if(this.alive)ellipse((float)this.p.x,(float)this.p.y,(float)this.SIZE*2,(float)this.SIZE*2);}
}
