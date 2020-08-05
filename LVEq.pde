final double PREY_TO_PREDATOR_E=1,PLANT_TO_PREY_E=1; //<>// //<>//
final int PREDATOR_NUM=100,PREY_NUM=1000,PLANT_NUM=2000,ARRAY_SIZE=10;
Predator[] predator;Prey[] prey;Plant[] plant;
double random(double a,double b){return Math.random()*(b-a)+a;}
double min(double a,double b){return a<b?a:b;}
double max(double a,double b){return a>b?a:b;}
int predatorAlive(){int sum=0;for(int i=0;i<PREDATOR_NUM;i++)if(predator[i].isAlive())sum++;return sum;}
int preyAlive(){int sum=0;for(int i=0;i<PREY_NUM;i++)if(prey[i].isAlive())sum++;return sum;}
int plantAlive(){int sum=0;for(int i=0;i<PLANT_NUM;i++)if(plant[i].isAlive())sum++;return sum;}
int predatorHungry(){int sum=0;for(int i=0;i<PREDATOR_NUM;i++)if(predator[i].isAlive()&&predator[i].hungry())sum++;return sum;}
int preyHungry(){int sum=0;for(int i=0;i<PREY_NUM;i++)if(prey[i].isAlive()&&prey[i].hungry())sum++;return sum;}
int predatorStarving(){int sum=0;for(int i=0;i<PREDATOR_NUM;i++)if(predator[i].getHunger()<=0)sum++;return sum;}
int preyStarving(){int sum=0;for(int i=0;i<PREY_NUM;i++)if(prey[i].getHunger()<=0)sum++;return sum;}
void setup(){
  randomSeed(1);
  size(1000,1000,P2D);surface.setTitle("Lotka-Volterra Equations");surface.setResizable(false);frameRate(600);
  background(#000000);noStroke();fill(#FFFFFF);
  predator=new Predator[PREDATOR_NUM*ARRAY_SIZE];prey=new Prey[PREY_NUM*ARRAY_SIZE];plant=new Plant[PLANT_NUM*ARRAY_SIZE];
  for(int i=0;i<PREDATOR_NUM;i++)predator[i]=new Predator(random(0,Predator.MAX_AGE),random(10,100),random(10,100),random(3,5),true,random(.04,.08),random(.8,1.2),new Vector(random(0,(double)width),random(0,(double)height)));
  for(int i=0;i<PREY_NUM;i++)prey[i]=new Prey(random(0,Prey.MAX_AGE),random(10,100),random(10,100),random(2,4),true,random(.04,.08),random(.8,1.2),new Vector(random(0,(double)width),random(0,(double)height)));
  for(int i=0;i<PLANT_NUM;i++)plant[i]=new Plant(random(Plant.MIN_AGE,Plant.MAX_AGE),new Vector(random(0,(double)width),random(0,(double)height)));
  for(int i=PREDATOR_NUM;i<PREDATOR_NUM*ARRAY_SIZE;i++)predator[i]=new Predator(random(0,Predator.MAX_AGE),random(10,100),random(10,100),random(3,5),false,random(.4,.8),random(.8,1.2),new Vector(random(0,(double)width),random(0,(double)height)));
  for(int i=PREY_NUM;i<PREY_NUM*ARRAY_SIZE;i++)prey[i]=new Prey(random(0,Prey.MAX_AGE),random(10,100),random(10,100),random(2,4),false,random(.4,.8),random(.8,1.2),new Vector(random(0,(double)width),random(0,(double)height)));
  for(int i=PLANT_NUM;i<PLANT_NUM*ARRAY_SIZE;i++)plant[i]=new Plant(random(0,Plant.MIN_AGE),new Vector(random(0,(double)width),random(0,(double)height))); //TODO
  for(int i=0;i<PREDATOR_NUM*ARRAY_SIZE;i++)predator[i].link(predator,prey,plant);
  for(int i=0;i<PREY_NUM*ARRAY_SIZE;i++)prey[i].link(predator,prey,plant);
  for(int i=0;i<PLANT_NUM*ARRAY_SIZE;i++)plant[i].link(predator,prey,plant);
}
void draw(){
  background(#000000);
  for(int i=0;i<PREDATOR_NUM;i++){
    if(predator[i].detectCollisionX()){predator[i].p.x=min(max(predator[i].p.x,predator[i].getSize()),width-predator[i].getSize());predator[i].v.x=-predator[i].v.x;}
    if(predator[i].detectCollisionY()){predator[i].p.y=min(max(predator[i].p.y,predator[i].getSize()),height-predator[i].getSize());predator[i].v.y=-predator[i].v.y;}
    if(predator[i].hungry()&&predator[i].isAlive())for(int j=0;j<PREY_NUM;j++)if(prey[j].isAlive()&&predator[i].detectCollision(prey[j])){predator[i].feed(prey[j].getHunger()*PREY_TO_PREDATOR_E);prey[j].setAlive(false);}
    predator[i].hunting();
  }
  for(int i=0;i<PREY_NUM;i++){
    if(prey[i].detectCollisionX()){prey[i].p.x=min(max(prey[i].p.x,prey[i].getSize()),width-prey[i].getSize());prey[i].v.x=-prey[i].v.x;}
    if(prey[i].detectCollisionY()){prey[i].p.y=min(max(prey[i].p.y,prey[i].getSize()),height-prey[i].getSize());prey[i].v.y=-prey[i].v.y;}
    if(prey[i].hungry()&&prey[i].isAlive())for(int j=0;j<PLANT_NUM;j++)if(plant[j].isAlive()&&prey[i].detectCollision(plant[j])){prey[i].feed(plant[j].getAge()*PLANT_TO_PREY_E);plant[j].setAge(0);}
    prey[i].feeding();
  }
  for(int i=0;i<PREDATOR_NUM;i++)predator[i].update();
  for(int i=0;i<PREY_NUM;i++)prey[i].update();
  for(int i=0;i<PLANT_NUM;i++)plant[i].update();
}
void keyPressed(){
  println(Life.FRAMEDEPENDENCY?millis()+"ms":"Frame "+frameCount+" ("+frameRate+"fps)");
  println("Predator : "+predatorAlive() + "\tHungry : " + predatorHungry() + "\tStarving : " +predatorStarving());
  println("Prey : "+preyAlive() + "\tHungry : " + preyHungry() + "\tStarving : " +preyStarving());
  println("Plant : "+plantAlive());
  println();
}
