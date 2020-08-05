public class Animal extends Life{
  public static final float BASAL_META=1,ACTIVE_META=.5,SIGHT=100,CRITICAL_ORG=0;
  protected float hunger,WALKING_SPEED,RUNNING_SPEED,org;
  public PVector v;
  public Animal(float age,float org,float hunger,float size,boolean alive,float walkingspeed,float runningspeed,PVector p){super(age,size,alive,p);this.hunger=hunger;this.org=org;this.WALKING_SPEED=walkingspeed;this.RUNNING_SPEED=runningspeed;this.v=PVector.random2D();this.v.limit((float)walkingspeed);}
  public float getHunger(){return this.hunger;}
  public float getorg(){return this.org;}
  public float getWalkingSpeed(){return this.WALKING_SPEED;}
  public float getRunningSpeed(){return this.RUNNING_SPEED;}
  public PVector getVelo(){return this.v;}
  public float getSpeed(){return this.v.mag();}
  public float getDir(){return this.v.heading();}
  public void setorg(float org){this.org=org;}
  public void setHunger(float hunger){this.hunger=hunger;}
  public void feed(float food){this.hunger+=food;}
  public void setVelo(PVector v){this.v=v;}
  public void setSpeed(float s){this.v.setMag(s);}
  protected void refresh(){this.p.add(PVector.mult(this.v,this.regulate()));}
  protected void metabolism(){}
  protected void check(){if(this.org<Animal.CRITICAL_ORG)this.alive=false;}
  @Override protected void grow(){super.grow();}
  @Override protected void display(){super.display();}
  @Override public void update(){this.refresh();this.metabolism();this.check();super.update();}
}
