
int blockSize = 35;

ArrayList<Circle> circles;
void setup() {
  size(1000,1000);
  
  noStroke();
  noiseDetail(2, 0.6);
  
  circles = new ArrayList<Circle>();
  for (int x = -blockSize; x <= (width*4); x += blockSize) {
    for (int y = -blockSize; y <= height; y += blockSize) {
      circles.add(new Circle(blockSize, blockSize));
    }
  }
}

float time = 0;
float increment = 0.03;
int screenTranslation = 0;

void draw() {
  background(0);
  
  translate(blockSize+screenTranslation,blockSize);
  int n = 0;
  for (int x = (width*4); x >= -blockSize; x -= blockSize) {
    float xoff = float(x) * (increment/1.5);
    for (int y = (height); y >= -blockSize; y -= blockSize) {
      float yoff = float(y) * (increment);
      float nois = noise(xoff,yoff,time);
      float transX = map(nois,0,1, 0,blockSize);
      float transY = map(nois,0,1, -blockSize, blockSize);
      pushMatrix();
      translate(x,y);
      Circle c = circles.get(n);
      c.display(transX, transY);
      popMatrix();
      n += 1;
    }
  }
  time += (increment/3.85);
  if (screenTranslation > -((width*3))) {
    screenTranslation -= 1;
  }
  
}