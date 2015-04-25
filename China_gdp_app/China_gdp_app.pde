void setup() {
  size(WindowX, WindowY, P3D);
  fill(255);
  
  //prepare for Cylinder
  float angle = 2*PI / tubeRes;
  for (int i = 0; i < tubeRes; i++) {
    tubeX[i] = cos(i * angle);
    tubeY[i] = sin(i * angle);
  }
  tubeX[tubeRes]=1;
  tubeY[tubeRes]=0;
  stroke(color(44, 48, 32));

  tex = loadImage("ChinaMap.jpg");
  f1 = createFont("Elephant",2,true);
  f2 = createFont("Agency FB",2,true);
  f3 = createFont("Chaparral Pro Light",2,true);
  textureMode(NORMAL);
}

void draw() {
  background(0);
  noStroke();
  //lights();
  

  
  pushMatrix();
  AdjustView();
  if(map==true){
      BaseMap(tex);
  }
  for(int i = 0 ;i < siteNum ;i++){
    VisitBar(i);    
  }
  popMatrix();

  Pannel();
  showResult(); 
}


