void AdjustView(){
  translate(width/2.0 + movx, height/2.0 + movy, -100);
  rotateX(rotx);
  rotateY(roty);
  scale(MapScale);
}

void Pannel(){
  float left=Help1;
  float right=(Help1+Help2)*0.5;
  
  fill(255,255,255,80);
  rectMode(CENTER);
      rect(width*0.5, height*0.20/2, WindowX,WindowY*0.25);
  
  textMode(SHAPE);
      fill(255);
      textFont(f1,20);
      textAlign(CENTER, CENTER);
      text("Help",left+30,(Select1)*0.3);
      textFont(f3,20);
      textAlign(LEFT, CENTER);
      text("TAB:   Show/Hide Map",left+30,50);
      text("Left Drag:   Rotate View",left+30,80);
      text("Right Drag:   Move Map",left+30,110);
      text("Middle Mouse:   Zoom In/Out",left+30,140);
      //text("Click R/L:   Select Filter",right,70);
      //text("UP/DOWN:   Front/Top View",right,110);
      //text("LEFT:   Default View",right,150);
      //text("RIGHT:   Result Show/Hide",right,190);


textMode(SHAPE);
      textAlign(CENTER, CENTER);
      textFont(f1,20);
      fill(255);
      text("Quarter",(Label1+Label2)*0.5,(Select1)*0.7);
      text("Percentage",(Label1+Label2)*0.5,(Select1+Select2)*0.5);


textMode(SHAPE);
      textAlign(CENTER,CENTER);
      textFont(f1,12);
      fill(255,225,0);
      text("3D Map of GDP of Every Quarter ",(Label1+Label2)*0.55,Select1*3);
      text("Authored by:",(Label1+Label2)*0.55,Select1*3.3);
      text("Shaodong Zhang & Ziang Hu",(Label1+Label2)*0.55,Select1*3.6);
 
 
  rectMode(CENTER);
      LevelBar();
      SlideBar(2);           
}

//draw level bar
void LevelBar(){
  float deltax=(Condition2-Condition1)*0.25;
  float deltay=deltaY;
  float minx=Condition1+deltax*0.5;
  float ceny=deltaY*0.7;
  String[] ssss={"Quarter1","Quarter2","Quarter3","Quarter4"};
  
  for (int i=0;i<4;i++){
        if(i==0){
          fill(Cspring);
        }else if (i==1){
          fill(Csummer);
        }else if (i==2){
          fill(Cfall);
        }else if (i==3){
          fill(Cwinter);
        }
 
     rectMode(CENTER);
       noStroke();
       rect(minx+i*deltax,ceny,deltax*0.8,deltay*0.6);
     textMode(SHAPE);
       textAlign(CENTER, CENTER);
       textFont(f1,14);
       fill(255);
       text(ssss[i],minx+i*deltax,ceny);
     if (season==(i+1)){
        stroke(255);
        noFill();
        strokeWeight(3);
        rect(minx+i*deltax,ceny,deltax*0.9,deltay*0.7);
     }
  }
}

//draw bar
void SlideBar(int line){
  int piece=20;
  float deltax=deltaCondi/20;
  float deltay=deltaY;
  float minx=Condition1+deltax*0.5;
  float ceny=deltaY*(line-0.5);
  float P1=Condition1;
  float P2=Condition2;
  
  //display bar
    rectMode(CENTER);
    noStroke();
    for(int i=0;i<piece;i++){
          fill(ColorChoose(((i+0.5)*deltax)/deltaCondi));
          rect(minx+i*deltax,ceny,deltax,deltay*0.6);
        }
   

 
  //display censor
  

    P1=C1;P2=C2;
  rectMode(CENTER);
    noStroke();
    fill(255,255,255,140);
    rect(P1,ceny,CensorX,deltay*0.7);
    rect(P2,ceny,CensorX,deltay*0.7);
    
  //display precentage
  textMode(SHAPE);
    textAlign(CENTER, CENTER);
    textFont(f3,20);
    fill(255);
      
      
          text(" "+int((P1-Condition1)*100/deltaCondi)+" %",P1,ceny);
          text(" "+int((P2-Condition1)*100/deltaCondi)+" %",P2,ceny);
          textFont(f3,18);
          text("Low",P1,ceny+30);
          text("High",P2,ceny+30);  
  

}

void BaseMap(PImage tex) {
  beginShape(QUADS);
  texture(tex);
  // +Y "bottom" face
  vertex(-1, 1, -1, 0, 0);
  vertex( 1, 1, -1, 1, 0);
  vertex( 1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);
  endShape();
}

void VisitBar(int i){
  float lx,ly,r,h,c,empty;
  float Rrate=0.00007;
  float Hrate=0.001;
  
  findWhatNow();
  
  lx=x[i]/MapX*2-1;
  ly=y[i]/MapY*2-1;
  r=total[i]*Rrate/2/6;
  h=whatNow[i]*Hrate;
  c=capacity[i]/6*Hrate;
  empty=TextL*1000*Hrate;
  
     if (selected[i]==1){
        Cylinder(lx,ly,r,h,c,i);
        Text(lx,ly,c*1.05,empty,i);
    }

}

void Cylinder(float x,float y,float r,float h,float c,int i){
  pushMatrix();
    translate(x,1,y);

    float nSpr=quarter1[i]/tubeRes/total[i];
    float nSum=quarter2[i]/tubeRes/total[i]+nSpr;
    float nFal=quarter3[i]/tubeRes/total[i]+nSum;
    //println("color:"+nSpr+" "+nSum+" "+nFal); 
 
    beginShape(QUAD_STRIP);
      fill(ColorChoose(h/c));
      for (int j = 0; j <= tubeRes; j++) {
        float xx = tubeX[j] * r;
        float zz = tubeY[j] * r;
        vertex(xx, -h,zz);
        vertex(xx, 0,zz);
      }
      endShape();
      
      fill(255,255,255,175);
      for (int j = 0; j <= tubeRes; j++) {
        float xx = tubeX[j] * r;
        float zz = tubeY[j] * r;
        vertex(xx, -c,zz);
        vertex(xx, -h,zz);
      }
      endShape();
      
    translate(0,-c,0);
    beginShape(QUAD_STRIP);
      fill(0);
      for (int j = 0; j <= tubeRes; j++) {
        if(j<=nSpr){
          fill(Cspring);
        }else if (nSpr<j && j<=nSum){
          fill(Csummer);
        }else if (nSum<j && j<=nFal){
          fill(Cfall);
        }else{
          fill(Cwinter);
        }
         


        float xx = tubeX[j] * r;
        float zz = tubeY[j] * r;
        vertex(0, 0,0);
        vertex(xx, 0,zz);
      }
      endShape();  
      
  popMatrix();
  
 
}

void Text(float x,float y,float h,float perh,int i){
  String str0,str1;
  str0=name[i];
  str1="Percentage: "+(whatNow[i]*100/capacity[i]*6)+"%.";
  
  pushMatrix();
    textMode(SHAPE);
    textAlign(CENTER, BOTTOM);
    fill(255);
    
    translate(x,1,y);
    translate(0,-h*0.95,0);
    rotateX(-rotx);
    rotateY(-roty);
    scale(TextScale);
    translate(0,-perh,0);
        textFont(f2,TextX);
        textLeading(TextL);
        text(str1,0,0);
    translate(0,-perh,0);
        //fill(255,255,0);
        textFont(f1,TextXX);
        textLeading(TextL);
        text(str0,0,0);            
  popMatrix();
  
}
       
color ColorChoose(float prec){
  color col;
  float scale=190;
  
  col=color(60+prec*scale,250-prec*scale,70);
  return col;
}

void showResult(){
    if (result){ 
      
        float y=WindowY*0.3;
        float x=WindowX*0.90;
          textMode(SHAPE);
             fill(255);
             textAlign(CENTER,UP);
             textFont(f1,40);
             textLeading(50);
             text("Result",x,y);
             textFont(f3,25);
             textLeading(30);
          int t=2;
          for (int i=0; i<siteNum; i++){
            if (selected[i]==1){
                text(name[i],x,y+t*30);
                t++;      
            }
          }
    }

} 

