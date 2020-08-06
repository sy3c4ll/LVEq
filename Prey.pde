public class Prey extends Animal{
  public static final double BASAL_META=1,ACTIVE_META=.5,STORAGE=1,DANGER_HUNGER=30,MAX_AGE=30,DANGER_DIST=150,BIRTH_CYCLE=3,ADULT_AGE=10;
  public boolean danger;
  public Prey(){this.kill();}
  public Prey(double age,Vector p){this.init(p);this.age=age;}
  public boolean hungry(){return this.getHunger()<=Prey.DANGER_HUNGER;}
  public boolean danger(){return this.danger;}
  public void setDanger(boolean danger){this.danger=danger;}
  public int hunt(){
    int index=0;boolean flag=false;
    for(int i=0;i<MAX_PLANT_NUM;i++)
  if(c[i].isAlive()&&Vector.dist(this.p,c[i].p)<Vector.dist(this.p,c[index].p)){
index=i;flag=true;}
    return flag?index:-1;
  }
  public void chase(){
    if(this.hungry()&&this.isAlive()&&!this.danger){
      int index=this.hunt();
      if(index!=-1&&Vector.dist(this.p,c[index].p)<=Animal.SIGHT&&c[index].alive){
        this.v.x=c[index].p.x-this.p.x;
        this.v.y=c[index].p.y-this.p.y;
        this.setSpeed(this.getRunningSpeed());
      }
    }else if(this.isAlive()&&!this.danger)this.setSpeed(this.getWalkingSpeed());
  }
  /*protected void reproduce(){
    if(this.age>=ADULT_AGE&&frameCount%(BIRTH_CYCLE*365*24*FRAMEHOUR)==0){
      int i=0;
      for(;i<b.length&&b[i].isAlive();i++);
      if(i==b.length){println("Out of space!");exit();}
      else b[i].setAlive(true);
    }
  }*/
  public int smalldeadprey(){
    int k=((int)Math.floor(random(0,MAX_PREY_NUM)))%MAX_PREY_NUM;
    for(int i=0;i<MAX_PREY_NUM;i++){if(!this.b[(k+i)%MAX_PREY_NUM].isAlive())return (k+i)%MAX_PREY_NUM;}return -1;
  } 
  public void reproduce(){
    if((int)floor((float)this.age)%Prey.BIRTH_CYCLE==0&&this.isAlive()){
      int k=smalldeadprey();
      if(k!=-1){this.age+=1;b[k]=new Prey(random(0,Prey.MAX_AGE),new Vector(random(0,(double)width),random(0,(double)height)));}
    }
  }
  @Override public void kill(){super.kill();}
  public void init(Vector p){super.init(random(2,4),random(.4,.8),random(8,12),p);this.danger=false;}
  @Override public void metabolism(){if(this.hunger>0){this.hunger-=(Prey.BASAL_META+Prey.ACTIVE_META*this.getSpeed()+Prey.STORAGE)*this.hours();this.org+=Prey.STORAGE*this.hours();}else{this.org-=(Prey.BASAL_META+Prey.ACTIVE_META*this.getSpeed())*this.hours();}}
  @Override public void update(){fill(#00FF00);this.reproduce();super.update();}
}
