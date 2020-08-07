public class Plant extends Life{
  public static final double MAX_AGE=100,MIN_AGE=5;
  public Plant(double age,Vector p){super(age,2.5,false,p);this.checkAlive();}
  @Override public void setAge(double age){super.setAge(age);this.checkAlive();}
  protected void checkAlive(){this.alive=(age>=MIN_AGE&&age<MAX_AGE)?true:false;}
  @Override protected void grow(){if(this.age<=99){this.age+=this.hours();}}
  @Override protected void display(){fill(#0000FF);super.display();}
  @Override public void update(){this.checkAlive();super.update();}
}
