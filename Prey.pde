public class Prey extends Animal{
  public static final float DANGER_HUNGER=30,MAX_AGE=30,DANGER_DIST=7;
  public Prey(float age,float hunger,float size,boolean alive,float walkingspeed,float runningspeed,PVector p){super(age,hunger,size,alive,walkingspeed,runningspeed,p);}
  public boolean hungry(){return this.hunger<=Prey.DANGER_HUNGER;}
  public boolean danger(Predator[] x){
    for(int i=0;i<x.length;i++)if(PVector.dist(this.p,x[i].p)<=Prey.DANGER_DIST)return true;
    return false;
  }
  public int hunt(Plant[] k){
    int index=0;
    for(int i=0;i<k.length;i++)if(PVector.dist(this.p,k[i].p)<PVector.dist(this.p,k[index].p))index=i;
    return index;
  }
   public void feeding(Plant[] k,Predator[] l){
    if(this.hungry()&&this.alive&&!this.danger(l)){
      for(int i=0;i<k.length;i++)if(PVector.dist(this.p,k[i].p)<=Animal.SIGHT&&k[i].alive){
        this.v.x=k[this.hunt(k)].p.x-this.p.x;
        this.v.y=k[this.hunt(k)].p.y-this.p.y;
        this.setSpeed(this.RUNNING_SPEED);
      }
      return;
    }
  }
  @Override public void update(){fill(#00FF00);super.update();}
}
