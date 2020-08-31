 public class Prey extends Animal{
  public static final double DANGER_HUNGER=30,MAX_AGE=30,DANGER_DIST=20,BIRTH_CYCLE=2,ADULT_AGE=10;
  public Prey(double age,double org,double hunger,double size,boolean alive,double walkingspeed,double runningspeed,Vector p){super(age,org,hunger,size,alive,walkingspeed,runningspeed,p);}
  public boolean hungry(){return (this.getHunger()<=Prey.DANGER_HUNGER&&this.isAlive());}
  public boolean danger(){if(this.isAlive()){for(int i=0;i<MAX_PREDATOR_NUM;i++)if(predator[i].hungry()&&Vector.dist(this.p,predator[i].p)<=Prey.DANGER_DIST)return true;}return false;}
  public int hunt(){
    int index=0;boolean flag=false;
    for(int i=0;i<MAX_PLANT_NUM;i++)if(plant[i].isAlive()&&Vector.dist(this.p,plant[i].p)<Vector.dist(this.p,plant[index].p)){index=i;flag=true;}
    return flag?index:-1;
  }
  public void feeding(){
    if(this.hungry()&&!this.danger()){
      int index=this.hunt();
      if(index!=-1&&Vector.dist(this.p,plant[index].p)<=Animal.SIGHT&&plant[index].getAge()>5){
        this.v.x=plant[index].p.x-this.p.x;
        this.v.y=plant[index].p.y-this.p.y;
        this.setSpeed((double)this.getRunningSpeed());
      }
    }else if(!this.danger()){this.setSpeed((double)this.getWalkingSpeed());}
  }

  public int smalldeadprey(){for(int i=0;i<MAX_PREY_NUM;i++){if(!prey[i].isAlive()) return i;}return -1;} 
  public void reproduceprey(){if ((int)floor((float)this.getAge())%Prey.BIRTH_CYCLE==0&&this.isAlive()&&!this.hungry()&&this.getAge()>=1){
    
    int re=floor(random(3,9));
    
    for(int j=0;j<re;j++){reproducetime++;
int k=smalldeadprey();
if(k!=-1) {this.setAge(this.getAge()+(double)1/re); 
prey[k]=new Prey(0,random(10,30),random(10,30),3,true,
.5,45000, new Vector(max(min((this.p.x+random(-30,30)),width),0),max(min((this.p.y+random(-30,30)),height),0)));}}}}
  @Override public void metabolism(){if(this.hunger>0){this.hunger-=(7500+Predator.GROWTH)*this.regulate()*Life.FRAMEHOUR;this.org+=Predator.GROWTH*this.regulate();}else {this.org-=7500*Life.FRAMEHOUR*this.regulate();}}
  @Override public void update(){fill(#00FF00);this.reproduceprey();super.update();}
}
