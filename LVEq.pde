final int MAX_NUM=1000;
Predator[] pred;Prey[] prey;
void setup(){
  size(1500,1000,P2D);frameRate(600);
  background(#000000);noStroke();fill(#FFFFFF);
  pred=new Predator[MAX_NUM];prey=new Prey[MAX_NUM];
  for(int i=0;i<MAX_NUM;i++){
    pred[i]=new Predator(random(10,100),random(3,5),.5,true,new PVector(random(width),random(height)),new PVector(random(-.4,.4),random(-.4,.4)),new PVector(random(-.4,.4),random(-.4,.4)));
    prey[i]=new Prey(random(10,100),random(2,4),.5,true,new PVector(random(width),random(height)),new PVector(random(-.4,.4),random(-.4,.4)),new PVector(random(-.4,.4),random(-.4,.4)));
  }
}
void draw(){
  background(#000000);
  for(int i=0;i<MAX_NUM;i++){pred[i].update(false);prey[i].update(false);pred[i].display();prey[i].display();} //<>//
  for(int i=0;i<MAX_NUM;i++){
    if(pred[i].detectCollision()){pred[i].setLoc(new PVector(min(max(pred[i].getLoc().x,pred[i].getSize()),width-pred[i].getSize()),min(max(pred[i].getLoc().y,pred[i].getSize()),height-pred[i].getSize())));pred[i].rotateDir(PI);}
    if(prey[i].detectCollision()){prey[i].setLoc(new PVector(min(max(prey[i].getLoc().x,prey[i].getSize()),width-prey[i].getSize()),min(max(prey[i].getLoc().y,prey[i].getSize()),height-prey[i].getSize())));prey[i].rotateDir(PI);}
  }
  println(frameRate);
}
