public class Plant extends Life{
  public static final double MAX_AGE=100,MIN_AGE=30;
  public Plant(){kill();}
  public Plant(double age,Vector p){this.init(p);this.age=age;}
  @Override public void kill(){super.kill();}
  public void init(Vector p){super.init(2.5,p);}
  @Override protected void grow(){super.grow();this.age%=Plant.MAX_AGE;}
  @Override protected void display(){fill(#0000FF);super.display();}
  @Override public void update(){super.update();}
}
