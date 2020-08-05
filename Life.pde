public class Life{
  public static final double FRAMEHOUR=.1;
  public static final boolean FRAMEDEPENDENCY=false;
  protected double age;
  protected float SIZE;
  protected boolean alive,reproduced;
  protected int CLOCK;
  public PVector p;
  public Predator[] a;public Prey[] b;public Plant[] c;
  public Life(double age,float size,boolean alive,PVector p){this.age=age;this.SIZE=size;this.alive=alive;this.reproduced=false;this.CLOCK=FRAMEDEPENDENCY?millis():frameCount;this.p=p;}
  public void link(Predator[] a,Prey[] b,Plant[] c){this.a=a;this.b=b;this.c=c;}
  public double getAge(){return this.age;}
  public float getSize(){return this.SIZE;}
  public boolean isAlive(){return this.alive;}
  public int getClock(){return this.CLOCK;}
  public PVector getLoc(){return this.p;}
  public void setAge(float age){this.age=age;}
  public void setSize(float size){this.SIZE=size;}
  public void setAlive(boolean alive){this.alive=alive;}
  public void setLoc(PVector p){this.p=p;}
  public boolean detectCollisionX(){return this.getLoc().x<this.getSize()||this.getLoc().x>width-this.getSize();}
  public boolean detectCollisionY(){return this.getLoc().y<this.getSize()||this.getLoc().y>height-this.getSize();}
  public boolean detectCollision(Life x){return PVector.dist(this.getLoc(),x.getLoc())<this.getSize()+x.getSize();}
  public void update(){grow();display();}
  protected void grow(){this.age+=(FRAMEDEPENDENCY?millis()-CLOCK:frameCount-CLOCK)/(356*24)*FRAMEHOUR;this.CLOCK=FRAMEDEPENDENCY?millis():frameCount;}
  protected void display(){if(this.alive)ellipse(this.p.x,this.p.y,this.SIZE*2,this.SIZE*2);}
}
