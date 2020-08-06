public class Predator extends Animal{
  public static final double GROWTH=1;
  public static final double DANGER_HUNGER=30,MAX_AGE=20;
  public Predator(double age,double org,double hunger,double size,boolean alive,double walkingspeed,double runningspeed,Vector p){super(age,org,hunger,size,alive,walkingspeed,runningspeed,p);}
  public boolean hungry(){return this.getHunger()<=Predator.DANGER_HUNGER;}
  public int hunt(){
    int index=0;boolean flag=false;
    if(this.isAlive())for(int i=0;i<b.length;i++)if(Vector.disten(this.p,b[i].p)<Vector.disten(this.p,b[index].p)&&b[i].isAlive()){index=i;flag=true;}
    return flag?index:-1;
  }
  public void hunting(){
    if(this.hungry()&&this.isAlive()){
      int index=this.hunt();
      for(int i=0;i<b.length;i++){
        if(Vector.disten(this.p,b[i].p)<=Prey.DANGER_DIST&&b[i].isAlive()){
        b[i].v.x=b[i].p.x-this.p.x;
        b[i].v.y=b[i].p.y-this.p.y;
        b[i].setSpeed((float)b[i].getRunningSpeed());}
        else b[i].setSpeed((float)b[i].getWalkingSpeed());
      }
      if(index!=-1&&Vector.disten(this.p,b[index].p)<=Animal.SIGHT){
        this.v.x=b[index].p.x-this.p.x;
        this.v.y=b[index].p.y-this.p.y;
        this.setSpeed((double)this.getRunningSpeed());
      }
    }else this.setSpeed((double)this.getWalkingSpeed());
  }
  public int smalldeadpredator(){for(int i=0;i<MAX_PREY_NUM;i++){int k=((int)floor(random(0,MAX_PREY_NUM)+i))%MAX_PREY_NUM; if(!a[k].isAlive()) return k;}return -1;} 
  public void reproducepredator(){if ((int)floor((float)this.getAge())%Predator.BIRTH_CYCLE==0&&this.isAlive()){int k=smalldeadpredator();
if(k!=-1) {this.setAge(this.getAge()+1); reproducetime+=1;
a[k]=new Predator(random(0,Predator.MAX_AGE),random(10,100),random(10,100),random(2,4),true,random(.4,.8),random(8,12),new Vector(random(0,(double)width),random(0,(double)height)));}}}
  @Override public void metabolism(){if(this.hunger>0){this.hunger-=(Animal.BASAL_META+Animal.ACTIVE_META*this.getSpeed()+Predator.GROWTH)*this.regulate()*Life.FRAMEHOUR;this.org+=Predator.GROWTH*this.regulate();}else{this.org-=(Animal.BASAL_META+Animal.ACTIVE_META*this.getSpeed());}}
  @Override public void update(){fill(#FF0000);this.reproducepredator();super.update();}
}
