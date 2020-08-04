public class Prey extends Animal{
  public static final float CRITICAL_HUNGER=0,DANGER_HUNGER=30,HUNGER_GRADIENT=0,MAX_AGE=30,DANGER_DIST=7;
  public Prey(float age,float hunger,float size,boolean alive,PVector p){super(age,hunger,size,alive,p);}
  public Prey(float age,float hunger,float size,boolean alive,PVector p,PVector v){super(age,hunger,size,alive,p,v);}
  public boolean hungry(){return this.hunger<=Prey.DANGER_HUNGER;}
  public boolean danger(Predator[] x){
    for(int i=0;i<x.length;i++)if(PVector.dist(this.p,x[i].p)<=Prey.DANGER_DIST)return true;
    return false;
  }
  public int hunt(Plant[] x){
    int index=0;
    for(int i=0;i<x.length;i++)if(PVector.dist(this.p,x[i].p)<PVector.dist(this.p,x[index].p))index=i;
    return index;
  }
  @Override public void update(){fill(#00FF00);super.update();}
}
