public class Prey extends Animal{
  public static final double DANGER_HUNGER=30,MAX_AGE=30,DANGER_DIST=70,BIRTH_CYCLE=3,ADULT_AGE=10;
  public Prey(double age,double org,double hunger,double size,boolean alive,double walkingspeed,double runningspeed,Vector p){super(age,org,hunger,size,alive,walkingspeed,runningspeed,p);}
  public boolean hungry(){return this.getHunger()<=Prey.DANGER_HUNGER;}
  public boolean danger(){for(int i=0;i<a.length;i++)if(Vector.dist(this.p,a[i].p)<=Prey.DANGER_DIST)return true;return false;}
  public int hunt(){
    int index=0;boolean flag=false;
    for(int i=0;i<c.length;i++)if(Vector.dist(this.p,c[i].p)<Vector.dist(this.p,c[index].p)){index=i;flag=true;}
    return flag?index:-1;
  }
   public void feeding(){
    if(this.hungry()&&this.isAlive()&&!this.danger()){
      int index=this.hunt();
      if(index!=-1&&Vector.dist(this.p,c[index].p)<=Animal.SIGHT&&c[index].alive){
        this.v.x=c[index].p.x-this.p.x;
        this.v.y=c[index].p.y-this.p.y;
        this.setSpeed((double)this.getRunningSpeed());
      }
    }
    else if(!this.danger()) {this.setSpeed((double)this.getWalkingSpeed());}
  }
  protected void reproduce(){
    if(this.age>=ADULT_AGE&&frameCount%(BIRTH_CYCLE*365*24*FRAMEHOUR)==0){
      int i=0;
      for(;i<b.length&&b[i].isAlive();i++);
      if(i==b.length){println("Out of space!");exit();}
      else b[i].setAlive(true);
    }
  }
   @Override public void metabolism(){if(this.hunger>0){this.hunger-=(Animal.BASAL_META+Animal.ACTIVE_META*this.getSpeed()+Predator.GROWTH)*this.regulate()*Life.FRAMEHOUR;this.org+=Predator.GROWTH*this.regulate();}else {this.org-=Animal.BASAL_META+Animal.ACTIVE_META*this.getSpeed();}}
  @Override public void update(){fill(#00FF00);
this.reproduce();
super.update();}
}
