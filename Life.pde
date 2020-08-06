public class Life{
  public static final boolean FRAMEDEPENDENCY=false;
  public static final double FRAMEHOUR=.1;
  protected double age,SIZE;
  protected boolean alive;
  protected int CLOCK;
  public Vector p;
  public Predator[] a;public Prey[] b;public Plant[] c;
  public Life(){this.kill();}
  public Life(double age,double size,Vector p){this.init(size,p);this.age=age;}
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
  public double hours(){return (Life.FRAMEDEPENDENCY?millis()-this.CLOCK:frameCount-this.CLOCK)*Life.FRAMEHOUR;}
  public double years(){return (Life.FRAMEDEPENDENCY?millis()-this.CLOCK:frameCount-this.CLOCK)*Life.FRAMEHOUR/(365*24);}
  public void kill(){this.age=0;this.SIZE=0;this.alive=false;this.CLOCK=0;this.p=new Vector();}
  public void init(double size,Vector p){this.age=0;this.SIZE=size;this.alive=true;this.CLOCK=Life.FRAMEDEPENDENCY?millis():frameCount;this.p=p;}
  public void update(){if(this.alive){grow();display();this.CLOCK=Life.FRAMEDEPENDENCY?millis():frameCount;}}
  protected void grow(){this.age+=this.years();}
  protected void display(){ellipse((float)this.p.x,(float)this.p.y,(float)this.SIZE*2,(float)this.SIZE*2);}
}
