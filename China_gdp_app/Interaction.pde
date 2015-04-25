//rightclick,move
void mouseMoved(){
  if (mouseY>height*0.25) {
    view=true;
    pannel=false;
  }else{
    view=false;
    pannel=true;
    //
    if (mouseX>Condition1 && mouseX<Condition2){
      condi=true;
        float c1=0.5*deltaY;
        float dc1=abs(mouseY-c1);
        float c2=1.5*deltaY;
        float dc2=abs(mouseY-c2);
        float c3=2.5*deltaY;
        float dc3=abs(mouseY-c3);

        if (dc1<dc2 && dc1<dc3) {line1=true;line2=false;line3=false;}
        else if (dc2<dc3 && dc2<dc1) {line2=true;line1=false;line3=false;}
        else if (dc3<dc1 && dc3<dc2) {line3=true;line2=false;line1=false;}  
    }else{
      condi=false;
    }
  }
}
//left drag
void mouseDragged() {
  if (view==true){
      if (mouseButton == LEFT) {
      //Left dragged=>rotate
      float rate = 0.01;
      rotx += (pmouseY-mouseY) * rate;
      roty += (mouseX-pmouseX) * rate;
    } else if (mouseButton == RIGHT) {
      //Right dragged=>move
      float rate = 1;
      movy += (mouseY-pmouseY) * rate;
      movx += (mouseX-pmouseX) * rate;
    }
  }else if (condi==true){
      if (line1==true){
        season=int ((mouseX-Condition1)/deltaCondi);
      }else if (line2==true){
        if ((mouseX-H1)<(H2-mouseX)){
          H1=mouseX;
        }else{
          H2=mouseX;
        }
      }else if (line3==true){
        if ((mouseX-C1)<(C2-mouseX)){
          C1=mouseX;
        }else{
          C2=mouseX;
        }
      }
  }

}

//selece level
void mousePressed(){
  if (condi==true){
      if (line1==true){
        float d=0.25*deltaCondi;
        for (int i=0;i<4;i++){
          if (mouseX>Condition1+i*d && mouseX<Condition1+(i+1)*d)
            season=i+1;
            findWhatNow();
        }
        //println(season);
      }else if (line3==true && pannel==true){
        if (mouseButton == LEFT && mouseX>Condition1){
          H1=mouseX;
        }else if (mouseButton == RIGHT && mouseX<Condition2){
          H2=mouseX;
        }
      }else if (line2==true){
        if (mouseButton == LEFT && mouseX>Condition1){
          C1=mouseX;
        }else if (mouseButton == RIGHT && mouseX<Condition2){
          C2=mouseX;
        }
      }
      Select();
  }
}


void keyPressed() {
  if (view==true){
      if (keyCode==TAB){
        //unable map;
        map=!map;
      }
   }
  }
 

//zoom in and out
void mouseWheel(MouseEvent event) {
  if (view==true){
    float e = event.getCount();
    float rate = 5;
    MapScale += e * rate;
  }

}

void Select(){
    photlow=(H1-Condition1)*100/deltaCondi;
    phothigh=(H2-Condition1)*100/deltaCondi;
    pcaplow=(C1-Condition1)*100/deltaCondi;
    pcaphigh=(C2-Condition1)*100/deltaCondi;

    for (int i=0;i<siteNum;i++){
          float h=whatNow[i]*100/max(whatNow);
          float c=(whatNow[i]*100/capacity[i]*6);
    
        if (h<=phothigh && h>=photlow && c<=pcaphigh && c>=pcaplow){
          selected[i]=1;
        }else {
          selected[i]=0;
        }
    }

}

void findWhatNow(){
              if (season==1){
                for (int k=0;k<siteNum;k++){
                  whatNow[k]=quarter1[k]/6;
                }
              }else if (season==2){
                for (int k=0;k<siteNum;k++){
                  whatNow[k]=quarter2[k]/6;
                }
              }else if (season==3){
                for (int k=0;k<siteNum;k++){
                  whatNow[k]=quarter3[k]/6;
                }
              }else if (season==4){
                for (int k=0;k<siteNum;k++){
                  whatNow[k]=quarter4[k]/6;
                }
              }
}
