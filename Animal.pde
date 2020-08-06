public class Animal extends Life{
  public static final double SIGHT=50,CRITICAL_ORG=0;
  protected double hunger,org,WALKING_SPEED,RUNNING_SPEED;
  public Vector v;
  public Animal(){this.kill();}
  public Animal(double age,double size,double walkingspeed,double runningspeed,Vector p){this.init(size,walkingspeed,runningspeed,p);this.age=age;}
  public double getHunger(){return this.hunger;}
  public double getOrg(){return this.org;}
  public double getWalkingSpeed(){return this.WALKING_SPEED;}
  public double getRunningSpeed(){return this.RUNNING_SPEED;}
  public Vector getVelo(){return this.v;}
  public double getSpeed(){return this.v.mag();}
  public void setHunger(double hunger){this.hunger=hunger;}
  public void feed(double food){this.hunger+=food;}
  public void setOrg(double org){this.org=org;}
  public void setVelo(Vector v){this.v=v;}
  public void setSpeed(double s){this.v.setMag(s);}
  public int hunt(){return 0;}
  public void chase(){}
  @Override public void kill(){super.kill();this.hunger=0;this.org=0;this.WALKING_SPEED=0;this.RUNNING_SPEED=0;this.v=new Vector();}
  public void init(double size,double walkingspeed,double runningspeed,Vector p){super.init(size,p);this.hunger=random(10,100);this.org=random(10,100);this.WALKING_SPEED=walkingspeed;this.RUNNING_SPEED=runningspeed;this.v=Vector.random2D();this.v.limit(this.WALKING_SPEED);}
  protected void refresh(){this.p.add(Vector.mult(this.v,this.hours()));}
  protected void metabolism(){}
  protected void check(){if(this.org<Animal.CRITICAL_ORG)this.alive=false;}
  @Override protected void grow(){super.grow();}
  @Override protected void display(){super.display();}
  @Override public void update(){this.refresh();this.metabolism();this.check();super.update();}
}
