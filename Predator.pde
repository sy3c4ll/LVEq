 public class Predator extends Animal{
  public static final double GROWTH=1, BIRTH_CYCLE=2;
  public static final double DANGER_HUNGER=30,MAX_AGE=20;

  public Predator(double age,double org,double hunger,double size,boolean alive,double walkingspeed,double runningspeed,Vector p){super(age,org,hunger,size,alive,walkingspeed,runningspeed,p);}
  public boolean hungry(){return (this.getHunger()<=Predator.DANGER_HUNGER&&this.isAlive());}
  public int hunt(){
    int index=0;boolean flag=false;
    if(this.isAlive())for(int i=0;i<MAX_PREY_NUM;i++)if(Vector.dist(this.p,prey[i].p)<Vector.dist(this.p,prey[index].p)&&prey[i].isAlive()){index=i;flag=true;}
    return flag?index:-1;
  }
  public void hunting(){
    if(this.hungry()){
      int index=this.hunt();
      for(int i=0;i<MAX_PREY_NUM;i++){
        if(Vector.dist(this.p,prey[i].p)<=Prey.DANGER_DIST&&prey[i].isAlive()){
        prey[i].v.x=prey[i].p.x-this.p.x;
        prey[i].v.y=prey[i].p.y-this.p.y;
        prey[i].setSpeed((float)prey[i].getRunningSpeed());}
        else prey[i].setSpeed((float)prey[i].getWalkingSpeed());
      }
      if(index!=-1&&Vector.dist(this.p,prey[index].p)<=Animal.SIGHT){
        this.v.x=prey[index].p.x-this.p.x;
        this.v.y=prey[index].p.y-this.p.y;
        this.setSpeed((double)this.getRunningSpeed());
      }
    }else this.setSpeed((double)this.getWalkingSpeed());
  }
  public int smalldeadpredator(){for(int i=0;i<MAX_PREDATOR_NUM;i++){if(!predator[i].isAlive()) return i;}return -1;} 
  public void reproducepredator(){if ((int)floor((float)this.getAge())%Predator.BIRTH_CYCLE==0&&this.isAlive()&&this.getAge()>=1&&!this.hungry()){int k=smalldeadpredator();
   int re=floor(random(1,9));
   for(int j=0;j<re;j++){
if(k!=-1) {this.setAge(this.getAge()+(double)1/re);
predator[k]=new Predator(0,random(10,100),random(10,100),3,
true,1,8, new Vector(max(min((this.p.x+random(-30,30)),width),0),max(min((this.p.y+random(-30,30)),height),0)));}}}}
  @Override public void metabolism(){if(this.hunger>0){this.hunger-=(5+Predator.GROWTH)*this.regulate()*Life.FRAMEHOUR;this.org+=Predator.GROWTH*this.regulate();}else{this.org-=5*this.regulate()*Life.FRAMEHOUR;}}
  @Override public void update(){fill(#FF0000);this.reproducepredator();super.update();}
}
