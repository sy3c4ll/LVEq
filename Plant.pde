public class Plant extends Life{
  public static final double MIN_AGE=500;
  public Plant(double age,Vector p){super(age,5,false,p);this.checkAlive();}
  @Override public void setAge(double age){super.setAge(age);this.checkAlive();}
  protected void checkAlive(){this.alive=(age>=MIN_AGE)?true:false;}
  @Override protected void grow(){this.age+=this.years();}
  @Override protected void display(){fill(#0000FF);super.display();}
  @Override public void update(){this.checkAlive();super.update();}
}
