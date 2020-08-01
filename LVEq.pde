final boolean FRAMEDEPENDENCY=false;
final int MAX_NUM=1000;
Animal[] predator,prey;
void setup(){
float[][] pred_prey_dis = new float[MAX_NUM][1];// what pred/ 0->what prey/ 1->dis
  size(1500,1000,P2D);frameRate(600);
  background(#000000);noStroke();fill(#FFFFFF);
  predator=new Predator[MAX_NUM];prey=new Prey[MAX_NUM];
  for(int i=0;i<MAX_NUM;i++){
    predator[i]=new Predator(random(10,100),random(3,5),.5,true,new PVector(random(width),random(height)),new PVector(random(-.4,.4),random(-.4,.4)),new PVector(random(-.4,.4),random(-.4,.4)));
    prey[i]=new Prey(random(10,100),random(2,4),.5,true,new PVector(random(width),random(height)),new PVector(random(-.4,.4),random(-.4,.4)),new PVector(random(-.4,.4),random(-.4,.4)));
  }
}
public float dis(int k, int q){
  return (pred[k].getLoc().x-prey[q].getLoc().x)*(pred[k].getLoc().x-prey[q].getLoc().x)+(pred[k].getLoc().y-prey[q].getLoc().y)*(pred[k].getLoc().y-prey[q].getLoc().y);
}//pred[k]_prey[q] dis^2
public int hunt(int k)
{
  pred_prey_dis[k][0]=0;
  pred_prey_dis[k][1]=dis(k,0);//start from prey[0]
 for (q=0;q<MAX_NUM;q++)
 {
   if(pred_prey_dis[k][1]>dis(k,q)){// more closer
   pred_prey_dis[k][1]=min(pred_prey_dis[k][1],dis(k,q));//from now on this is the closest dis 
   pred_prey_dis[k][0]=q;  //from now on this is the closest one
 }
 }
 return q;// closest one
}// what prey to hunt
void draw(){
  background(#000000);
  for(int i=0;i<MAX_NUM;i++){predator[i].update();prey[i].update();predator[i].display();prey[i].display();}
  for(int i=0;i<MAX_NUM;i++){
    if(predator[i].detectCollision()){predator[i].setLoc(new PVector(min(max(predator[i].getLoc().x,predator[i].getSize()),width-predator[i].getSize()),min(max(predator[i].getLoc().y,predator[i].getSize()),height-predator[i].getSize())));predator[i].rotateDir(PI);}
    if(prey[i].detectCollision()){prey[i].setLoc(new PVector(min(max(prey[i].getLoc().x,prey[i].getSize()),width-prey[i].getSize()),min(max(prey[i].getLoc().y,prey[i].getSize()),height-prey[i].getSize())));prey[i].rotateDir(PI);}
  }
  println(frameRate);
}
