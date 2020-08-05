public class Animal extends Life{
  public static final double BASAL_META=.1,ACTIVE_META=.05,SIGHT=10,CRITICAL_HUNGER=0;
  protected double hunger,WALKING_SPEED,RUNNING_SPEED,org;
  public PVector v;
  public Animal(double age,double org,double hunger,float size,boolean alive,double walkingspeed,double runningspeed,PVector p){super(age,size,alive,p);this.hunger=hunger;this.org=org;this.WALKING_SPEED=walkingspeed;this.RUNNING_SPEED=runningspeed;this.v=PVector.random2D();this.v.limit((float)walkingspeed);}
  public double getHunger(){return this.hunger;}
  public double getorg(){return this.org;}
  public double getWalkingSpeed(){return this.WALKING_SPEED;}
  public double getRunningSpeed(){return this.RUNNING_SPEED;}
  public PVector getVelo(){return this.v;}
  public double getSpeed(){return this.v.mag();}
  public double getDir(){return this.v.heading();}
  public void setorg(double org){this.org=org;}
  public void setHunger(double hunger){this.hunger=hunger;}
  public void feed(double food){this.hunger+=food;}
  public void setVelo(PVector v){this.v=v;}
  public void setSpeed(float s){this.v.setMag(s);}
  protected void refresh(){this.p.add(PVector.mult(this.v,FRAMEDEPENDENCY?millis()-this.CLOCK:frameCount-this.CLOCK));}
  protected void metabolism(){}
  protected void check(){if(this.hunger<Animal.CRITICAL_HUNGER)this.alive=false;}
  @Override protected void grow(){super.grow();}
  @Override protected void display(){super.display();}
  @Override public void update(){this.refresh();this.metabolism();this.check();super.update();}
}
