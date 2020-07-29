public class Predator extends Animal{
  public final float CRITICAL_FEED=0,WALKING_SPEED=0,RUNNING_SPEED=0,FEED_GRADIENT=0;
  public Predator(float feed,float size,float maxspeed,boolean alive,PVector p){super(feed,size,maxspeed,alive,p);}
  public Predator(float feed,float size,float maxspeed,boolean alive,PVector p,PVector v){super(feed,size,maxspeed,alive,p,v);}
  public Predator(float feed,float size,float maxspeed,boolean alive,PVector p,PVector v,PVector a){super(feed,size,maxspeed,alive,p,v,a);}
  public void display(){fill(#FF0000);super.display();}
}
