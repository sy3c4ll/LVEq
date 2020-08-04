public class Prey extends Animal{
  public static final float WALKING_SPEED=0,RUNNING_SPEED=0,CRITICAL_HUNGER=0,DANGER_HUNGER=30,HUNGER_GRADIENT=0,MAX_AGE=30,DANGER_DIST=7;
  public Prey(float age,float hunger,float size,float maxspeed,boolean alive,PVector p){super(age,hunger,size,maxspeed,alive,p);}
  public Prey(float age,float hunger,float size,float maxspeed,boolean alive,PVector p,PVector v){super(age,hunger,size,maxspeed,alive,p,v);}
  public int hunt(Plant[] x){
    int index=0;
    for(int i=0;i<x.length;i++)if(PVector.dist(this.p,x[i].p)<PVector.dist(this.p,x[index].p))index=i;
    return index;
  }
  public boolean danger(Predator[] x){
    for(int i=0;i<x.length;i++)if(PVector.dist(this.p,x[i].p)<=DANGER_DIST)return true;
    return false;
  }
  public boolean hungry(){return this.hunger<=this.DANGER_HUNGER;}
  @Override public void update(){fill(#00FF00);super.update();}
}
