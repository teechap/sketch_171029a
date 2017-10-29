class Circle {
  float translationW, translationH, rotation, n;
  int w, h;
  
  Circle(int w, int h) {
    this.w = w;
    this.h = h;
    this.translationW = random(-w,w);
    this.translationH = random(-h,h);
    this.rotation = radians(random(-180,180));
    this.n = random(1);
  }
  
  void display(float transX, float transY) {
    fill(0);
    rect(0,0,w,h);
    if (n > 0.1) {
      pushMatrix();
      float x,y;
      if (n < 0.5) {
        x = transX;
        y = transY;
      } else {
        x = -transX;
        y = -transY;
      }
      translate(translationW+x,translationH+y);
      fill(255);
      ellipse(0,0, w,h);
      popMatrix();
    }
    
  }
}