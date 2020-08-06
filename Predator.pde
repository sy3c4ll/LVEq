public class Predator extends Animal{
  public static final double BASAL_META=1,ACTIVE_META=.5,STORAGE=1,DANGER_HUNGER=30,MAX_AGE=20;
  public Predator(){this.kill();}
  public Predator(double age,Vector p){this.init(p);this.age=age;}
  public boolean hungry(){return this.getHunger()<=Predator.DANGER_HUNGER;}
  @Override public int hunt(){
    int index=0;boolean flag=false;
    if(this.isAlive())for(int i=0;i<b.length;i++)if(Vector.dist(this.p,b[i].p)<Vector.dist(this.p,b[index].p)&&b[i].isAlive()){index=i;flag=true;}
    return flag?index:-1;
  }
  @Override public void chase(){
    if(this.hungry()&&this.isAlive()){
      int index=this.hunt();
      for(int i=0;i<b.length;i++){
        if(Vector.dist(this.p,b[i].p)<=Prey.DANGER_DIST&&b[i].isAlive()){
        b[i].v.x=b[i].p.x-this.p.x;
        b[i].v.y=b[i].p.y-this.p.y;
        b[i].setSpeed((float)b[i].getRunningSpeed());}
        else b[i].setSpeed((float)b[i].getWalkingSpeed());
      }
      if(index!=-1&&Vector.dist(this.p,b[index].p)<=Animal.SIGHT){
        this.v.x=b[index].p.x-this.p.x;
        this.v.y=b[index].p.y-this.p.y;
        this.setSpeed((double)this.getRunningSpeed());
      }
    }else this.setSpeed((double)this.getWalkingSpeed());
  }
  @Override public void kill(){super.kill();}
  public void init(Vector p){super.init(random((double)3,(double)5),random((double).04,(double).08),random((double).8,(double)1.2),p);}
  @Override public void metabolism(){if(this.hunger>0){this.hunger-=(Predator.BASAL_META+Predator.ACTIVE_META*this.getSpeed()+Predator.STORAGE)*this.hours();this.org+=Predator.STORAGE*this.hours();}else{this.org-=(Predator.BASAL_META+Predator.ACTIVE_META*this.getSpeed())*this.hours();}}
  @Override public void update(){fill(#FF0000);super.update();}
}
