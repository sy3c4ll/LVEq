public class Animal{
  public static final float BASAL_META=.1,ACTIVE_META=.05,SIGHT=10,CRITICAL_HUNGER=0;
  protected float hunger,age,SIZE,WALKING_SPEED,RUNNING_SPEED;
  protected boolean alive;
  protected int CLOCK;
  public PVector p,v;
  public Animal(float age,float hunger,float size,boolean alive,float walkingspeed,float runningspeed,PVector p){this.age=age;this.hunger=hunger;this.SIZE=size;this.alive=alive;this.WALKING_SPEED=walkingspeed;this.RUNNING_SPEED=runningspeed;this.p=p;this.v=PVector.random2D();this.v.limit(walkingspeed);this.CLOCK=FRAMEDEPENDENCY?millis():frameCount;}
  public float getAge(){return this.age;}
  public float getHunger(){return this.hunger;}
  public boolean getAlive(){return this.alive;}
  public float getSize(){return this.SIZE;}
  public PVector getLoc(){return this.p;}
  public PVector getVelo(){return this.v;}
  public float getSpeed(){return this.v.mag();}
  public float getDir(){return this.v.heading();}
  public int getClock(){return this.CLOCK;}
  public void setHunger(float hunger){this.hunger=hunger;}
  public void setAlive(boolean alive){this.alive=alive;}
  public void setLoc(PVector p){this.p=p;}
  public void setVelo(PVector v){this.v=v;}
  public void feed(float food){this.hunger+=food;}
  public void setSpeed(float s){this.v.setMag(s);}
  public void setDir(float theta){this.v=PVector.fromAngle(theta).setMag(this.v.mag());}
  public void rotateDir(float theta){this.v.rotate(theta);}
  public boolean detectCollisionX(){return this.getLoc().x<this.getSize()||this.getLoc().x>width-this.getSize();}
  public boolean detectCollisionY(){return this.getLoc().y<this.getSize()||this.getLoc().y>height-this.getSize();}
  public boolean detectCollision(Animal x){return PVector.dist(this.getLoc(),x.getLoc())<this.getSize()+x.getSize();}
  public boolean detectCollision(Plant x){return PVector.dist(this.getLoc(),x.getLoc())<this.getSize()+x.getSize();}
  public void update(){this.refresh();this.metabolism();this.check();this.grow();this.display();}
  protected void refresh(){this.p.add(PVector.mult(this.v,FRAMEDEPENDENCY?millis()-this.CLOCK:frameCount-this.CLOCK));this.CLOCK=FRAMEDEPENDENCY?millis():frameCount;}
  protected void metabolism(){this.hunger-=(Animal.BASAL_META+Animal.ACTIVE_META*this.getSpeed());}
  protected void check(){if(this.hunger<Animal.CRITICAL_HUNGER)this.alive=false;}
  protected void grow(){this.age+=(FRAMEDEPENDENCY?millis()-CLOCK:frameCount-CLOCK)*AGE_GRADIENT;this.CLOCK=FRAMEDEPENDENCY?millis():frameCount;}
  protected void display(){if(this.alive)ellipse(this.p.x,this.p.y,this.SIZE*2,this.SIZE*2);}
}
