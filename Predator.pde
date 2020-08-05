public class Predator extends Animal{
  public static final float DANGER_HUNGER=30,MAX_AGE=20;
  public Predator(float age,float hunger,float size,boolean alive,float walkingspeed,float runningspeed,PVector p){super(age,hunger,size,alive,walkingspeed,runningspeed,p);}
  public boolean hungry(){return this.getHunger()<=Predator.DANGER_HUNGER;}
  public int hunt(){
    int index=0;boolean flag=false;
    if(this.isAlive())for(int i=0;i<b.length;i++)if(PVector.dist(this.p,b[i].p)<PVector.dist(this.p,b[index].p)&&b[i].isAlive()){index=i;flag=true;}
    return flag?index:-1;
  }
  public void hunting(){
    if(this.hungry()&&this.isAlive()){
      int index=this.hunt();
      if(index!=-1&&PVector.dist(this.p,b[index].p)<=Animal.SIGHT){
        this.v.x=b[index].p.x-this.p.x;
        this.v.y=b[index].p.y-this.p.y;
        this.setSpeed(this.getRunningSpeed());
      }
      for(int i=0;i<PREY_NUM;i++){
        if(PVector.dist(this.p,b[i].p)<=Prey.DANGER_DIST&&b[i].isAlive()){b[i].v.x=b[i].p.x-this.p.x;b[i].v.y=b[i].p.y-this.p.y;b[i].setSpeed(b[i].getRunningSpeed());}
        else b[i].setSpeed(b[i].getWalkingSpeed());
      }
    }
  }
  @Override public void update(){fill(#FF0000);super.update();}
}
