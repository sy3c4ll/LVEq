public class Predator extends Animal{
  public static final float CRITICAL_HUNGER=0,WALKING_SPEED=0,RUNNING_SPEED=0,HUNGER_GRADIENT=0,MAX_AGE=20;
  public Predator(float age,float hunger,float size,float maxspeed,boolean alive,PVector p){super(age,hunger,size,maxspeed,alive,p);}
  public Predator(float age,float hunger,float size,float maxspeed,boolean alive,PVector p,PVector v){super(age,hunger,size,maxspeed,alive,p,v);}
  public int hunt(Prey[] x){
    int index=0;
    for(int i=0;i<x.length;i++)if(PVector.dist(this.p,x[i].p)<PVector.dist(this.p,x[index].p))index=i;
    return index;
  }
  @Override public void update(){fill(#FF0000);super.update();}
}
