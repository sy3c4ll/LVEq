public class Predator extends Animal{
  public static final double GROWTH=1, BIRTH_CYCLE=3;
  public static final double DANGER_HUNGER=30,MAX_AGE=20;
  public Predator(double age,double org,double hunger,double size,boolean alive,double walkingspeed,double runningspeed,Vector p){super(age,org,hunger,size,alive,walkingspeed,runningspeed,p);}
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
          b[i].setSpeed(b[i].getRunningSpeed());
          b[i].setDanger(true);
        }
        else b[i].setSpeed(b[i].getWalkingSpeed());
      }
      if(index!=-1&&Vector.dist(this.p,b[index].p)<=Animal.SIGHT){
        this.v.x=b[index].p.x-this.p.x;
        this.v.y=b[index].p.y-this.p.y;
        this.setSpeed(this.getRunningSpeed());
      }
    }else this.setSpeed(this.getWalkingSpeed());
  }
  public int smalldeadpredator(){for(int i=0;i<MAX_PREDATOR_NUM;i++){int k=((int)floor(random(0,MAX_PREDATOR_NUM)+i))%MAX_PREDATOR_NUM; if(!a[k].isAlive()) return k;}return -1;} 
  public void reproducepredator(){if ((int)floor((float)this.getAge())%Predator.BIRTH_CYCLE==0&&this.isAlive()){int k=smalldeadpredator();
if(k!=-1) {this.setAge(this.getAge()+1); reproducetime+=1;
a[k]=new Predator(random(0,Predator.MAX_AGE),random(10,100),random(10,100),random(2,4),true,random(.4,.8),random(8,12),new Vector(random(0,(double)width),random(0,(double)height)));}}}
  @Override public void metabolism(){if(this.hunger>0){this.hunger-=(Animal.BASAL_META+Animal.ACTIVE_META*this.getSpeed()+Predator.GROWTH)*this.regulate()*Life.FRAMEHOUR;this.org+=Predator.GROWTH*this.regulate();}else{this.org-=(Animal.BASAL_META+Animal.ACTIVE_META*this.getSpeed());}}
  @Override public void update(){fill(#FF0000);this.reproducepredator();super.update();}
}
