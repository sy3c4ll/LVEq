public class Vector extends java.awt.geom.Point2D.Double{
  public Vector(){super();}
  public Vector(double x,double y){super(x,y);}
  public Vector toFloat(){return new Vector((double)this.x,(double)this.y);}
  public void set(double x,double y){super.setLocation(x,y);}
  public void set(Vector a){super.setLocation(a);}
  public void set(double[] a){if(a.length>=1)this.x=a[0];if(a.length>=2)this.y=a[1];}
  public static Vector random2D(){Vector a=new Vector(Math.random(),Math.random());return a;}
  public Vector copy(){return (Vector)this.clone();}
  public double mag(){return this.distance(0,0);}
  public double magSq(){return this.distanceSq(0,0);}
  public static Vector add(Vector a,Vector b){return new Vector(a.x+b.x,a.y+b.y);}
  public void add(Vector a){this.x+=a.x;this.y+=a.y;}
  public void add(double p,double q){this.x+=p;this.y+=q;}
  public static Vector sub(Vector a,Vector b){return new Vector(a.x-b.x,a.y-b.y);}
  public void sub(Vector a){this.x-=a.x;this.y-=a.y;}
  public void sub(double x,double y){this.x-=x;this.y-=y;}
  public static Vector mult(Vector a,double k){return new Vector(a.x*k,a.y*k);}
  public void mult(double k){this.x=this.x*k;this.y=this.y*k;}
  public static Vector div(Vector a,double k){return new Vector(a.x/k,a.y/k);}
  public void div(double k){this.x/=k;this.y/=k;}
  public static double disten(Vector a,Vector b){return java.awt.geom.Point2D.Double.distance(a.x,a.y,b.x,b.y);}
  public double disten(Vector a){return this.distance(a);}
  public static Vector normalize(Vector a){a.x/=a.mag();a.y/=a.mag();return a;}
  public void normalize(){this.x/=this.mag();this.y/=this.mag();}
  public static Vector limit(Vector a,double m){if(a.mag()>m)a.setMag(m);return a;}
  public void limit(double m){if(this.mag()>m)this.setMag(m);}
  public static Vector setMag(Vector a,double m){a.normalize();a.mult(m);return a;}
  public void setMag(double m){this.normalize();this.mult(m);}
}
