public class Predator extends Animal{
  public static final float WALKING_SPEED=0,RUNNING_SPEED=0,CRITICAL_HUNGER=0,DANGER_HUNGER=30,HUNGER_GRADIENT=0,MAX_AGE=20;
  public Predator(float age,float hunger,float size,float maxspeed,boolean alive,PVector p){super(age,hunger,size,maxspeed,alive,p);}
  public Predator(float age,float hunger,float size,float maxspeed,boolean alive,PVector p,PVector v){super(age,hunger,size,maxspeed,alive,p,v);}
  public boolean hungry(){return this.hunger<=DANGER_HUNGER;}
  public int hunt(Prey[] x){
    int index=0;
    for(int i=0;i<x.length;i++)if(PVector.dist(this.p,x[i].p)<PVector.dist(this.p,x[index].p))index=i;
    return index;
  }
  public void chase(Prey[] x){
    if(this.hungry()&&this.alive)
      for(int i=0;i<PREY_NUM;i++)if(PVector.dist(this.p,x[i].p)<Prey.DANGER_DIST&&prey[i].alive){
        prey[i].v.x=prey[i].p.x-this.p.x;
        prey[i].v.y=prey[i].p.y-this.p.y;
        prey[i].setSpeed(Prey.RUNNING_SPEED);
      }
  }
  @Override public void update(){fill(#FF0000);super.update();}
}
