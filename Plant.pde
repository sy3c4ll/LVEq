public class Plant{
  public static final float MAX_AGE=100,MIN_AGE=30;
  protected float age,SIZE;
  protected boolean alive;
  public PVector p;
  protected int CLOCK;
  public Plant(float age,boolean alive,PVector p){this.age=age;this.SIZE=2.5;this.alive=alive;this.p=p;this.CLOCK=FRAMEDEPENDENCY?millis():frameCount;}
  public float getAge(){return this.age;}
  public float getSize(){return this.SIZE;}
  public boolean getAlive(){return this.alive;}
  public PVector getLoc(){return this.p;}
  public int getClock(){return this.CLOCK;}
  public void setAge(float age){this.age=age;}
  public void setAlive(boolean alive){this.alive=alive;}
  public void setLoc(PVector p){this.p=p;}
  public void update(){if(this.age<Plant.MIN_AGE)this.alive=false;else this.alive=true;this.grow();this.display();}
  protected void grow(){this.age+=((FRAMEDEPENDENCY?millis()-this.CLOCK:frameCount-this.CLOCK)*AGE_GRADIENT)%Plant.MAX_AGE;this.CLOCK=FRAMEDEPENDENCY?millis():frameCount;}
  protected void display(){fill(#0000FF);if(this.alive)ellipse(this.p.x,this.p.y,this.SIZE*2,this.SIZE*2);}
}
