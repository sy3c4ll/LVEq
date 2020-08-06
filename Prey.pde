public class Prey extends Animal{
  public static final double BASAL_META=1,ACTIVE_META=.5,STORAGE=1,DANGER_HUNGER=30,MAX_AGE=30,DANGER_DIST=70,BIRTH_CYCLE=3,ADULT_AGE=10;
  public Prey(){this.kill();}
  public Prey(double age,Vector p){this.init(p);this.age=age;}
  public boolean hungry(){return this.getHunger()<=Prey.DANGER_HUNGER;}
  public boolean danger(){if(this.isAlive()){for(int i=0;i<a.length;i++)if(a[i].isAlive()&&a[i].hungry()&&Vector.dist(this.p,a[i].p)<=Prey.DANGER_DIST)return true;}return false;}
  public int hunt(){
    int index=0;boolean flag=false;
    for(int i=0;i<c.length;i++)if(c[i].isAlive()&&Vector.dist(this.p,c[i].p)<Vector.dist(this.p,c[index].p)){index=i;flag=true;}
    return flag?index:-1;
  }
  public void chase(){
    if(this.hungry()&&this.isAlive()&&!this.danger()){
      int index=this.hunt();
      if(index!=-1&&Vector.dist(this.p,c[index].p)<=Animal.SIGHT&&c[index].alive){
        this.v.x=c[index].p.x-this.p.x;
        this.v.y=c[index].p.y-this.p.y;
        this.setSpeed((double)this.getRunningSpeed());
      }
    }else if(!this.danger()){this.setSpeed((double)this.getWalkingSpeed());}
  }
  /*protected void reproduce(){
    if(this.age>=ADULT_AGE&&frameCount%(BIRTH_CYCLE*365*24*FRAMEHOUR)==0){
      int i=0;
      for(;i<b.length&&b[i].isAlive();i++);
      if(i==b.length){println("Out of space!");exit();}
      else b[i].setAlive(true);
    }
  }*/
  @Override public void kill(){super.kill();}
  public void init(Vector p){super.init(random(2,4),random(.04,.08),random(.8,1.2),p);}
  @Override public void metabolism(){if(this.hunger>0){this.hunger-=(Prey.BASAL_META+Prey.ACTIVE_META*this.getSpeed()+Prey.STORAGE)*this.hours();this.org+=Prey.STORAGE*this.hours();}else{this.org-=(Prey.BASAL_META+Prey.ACTIVE_META*this.getSpeed())*this.hours();}}
  @Override public void update(){fill(#00FF00);/*this.reproduce();*/super.update();}
}
