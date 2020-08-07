public class Animal extends Life{
  public static final double BASAL_META=1,ACTIVE_META=.5,SIGHT=50,CRITICAL_ORG=0;
  protected double hunger,org,WALKING_SPEED,RUNNING_SPEED;
  public Vector v;
  public Animal(double age,double hunger,double org,double size,boolean alive,double walkingspeed,double runningspeed,Vector p){super(age,size,alive,p);this.hunger=hunger;this.org=org;this.WALKING_SPEED=walkingspeed;this.RUNNING_SPEED=runningspeed;this.v=Vector.random2D();this.v.setMag(walkingspeed);}
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
  protected void refresh(){this.p.add(Vector.mult(this.v,this.regulate()*Life.FRAMEHOUR));}
  protected void metabolism(){}
  protected void check(){if(this.org<Animal.CRITICAL_ORG)this.alive=false;}
  @Override protected void grow(){super.grow();}
  @Override protected void display(){super.display();}
  @Override public void update(){this.refresh();this.metabolism();this.check();super.update();}
}
