public class Predator extends Animal{
  public static final float CRITICAL_HUNGER=0,DANGER_HUNGER=90,HUNGER_GRADIENT=0,MAX_AGE=20;
  public Predator(float age,float hunger,float size,boolean alive,float walkingspeed,float runningspeed,PVector p){super(age,hunger,size,alive,walkingspeed,runningspeed,p);}
  public boolean hungry(){return this.hunger<=Predator.DANGER_HUNGER;}
  public int hunt(Prey[] x){
    int index=0;
    if(this.alive)for(int i=0;i<x.length;i++)if(PVector.dist(this.p,x[i].p)<PVector.dist(this.p,x[index].p)&&x[i].alive)index=i;
    return index;
  }
  public void hunting(Prey[] k){
    if(this.hungry()&&this.alive){
      for(int i=0;i<PREY_NUM;i++)if(PVector.dist(this.p,k[i].p)<=Prey.DANGER_DIST&&k[i].alive){
        k[i].v.x=k[i].p.x-this.p.x;
        k[i].v.y=k[i].p.y-this.p.y;
        k[i].setSpeed(k[i].RUNNING_SPEED);
      }
      int index=this.hunt(k);
      if(PVector.dist(this.p,k[index].p)<=Animal.SIGHT)
      {
        this.v.x=k[index].p.x-this.p.x;
        this.v.y=k[index].p.y-this.p.y;
        this.setSpeed(this.RUNNING_SPEED);
      }
      return;
    }
  }
  @Override public void update(){fill(#FF0000);super.update();}
}
