public class Prey extends Animal{
  public static final float CRITICAL_HUNGER=0,WALKING_SPEED=0,RUNNING_SPEED=0,HUNGER_GRADIENT=0;
  public Prey(float hunger,float size,float maxspeed,boolean alive,PVector p){super(hunger,size,maxspeed,alive,p);}
  public Prey(float hunger,float size,float maxspeed,boolean alive,PVector p,PVector v){super(hunger,size,maxspeed,alive,p,v);}
  public Prey(float hunger,float size,float maxspeed,boolean alive,PVector p,PVector v,PVector a){super(hunger,size,maxspeed,alive,p,v,a);}
  public void display(){fill(#00FF00);super.display();}
}
