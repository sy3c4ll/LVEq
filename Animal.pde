public class Animal extends Life{
  public static final float BASAL_META=.1,ACTIVE_META=.05,SIGHT=10,CRITICAL_HUNGER=0;
  protected float hunger,WALKING_SPEED,RUNNING_SPEED;
  public PVector v;
  public Animal(float age,float hunger,float size,boolean alive,float walkingspeed,float runningspeed,PVector p){super(age,size,alive,p);this.hunger=hunger;this.WALKING_SPEED=walkingspeed;this.RUNNING_SPEED=runningspeed;this.v=PVector.random2D();this.v.limit(walkingspeed);}
  public float getHunger(){return this.hunger;}
  public float getWalkingSpeed(){return this.WALKING_SPEED;}
  public float getRunningSpeed(){return this.RUNNING_SPEED;}
  public PVector getVelo(){return this.v;}
  public float getSpeed(){return this.v.mag();}
  public float getDir(){return this.v.heading();}
  public void setHunger(float hunger){this.hunger=hunger;}
  public void feed(float food){this.hunger+=food;}
  public void setVelo(PVector v){this.v=v;}
  public void setSpeed(float s){this.v.setMag(s);}
  public void setDir(float theta){float m=this.v.mag();this.v=PVector.fromAngle(theta);v.setMag(m);}
  public void rotateDir(float theta){this.v.rotate(theta);}
  protected void refresh(){this.p.add(PVector.mult(this.v,FRAMEDEPENDENCY?millis()-this.CLOCK:frameCount-this.CLOCK));}
  protected void metabolism(){this.hunger-=(Animal.BASAL_META+Animal.ACTIVE_META*this.getSpeed());}
  protected void check(){if(this.hunger<Animal.CRITICAL_HUNGER)this.alive=false;}
  @Override protected void grow(){super.grow();}
  @Override protected void display(){super.display();}
  @Override public void update(){this.refresh();this.metabolism();this.check();super.update();}
}
