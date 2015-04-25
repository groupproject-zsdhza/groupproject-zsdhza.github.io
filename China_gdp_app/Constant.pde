PImage tex;
PImage help;
PFont f1;
PFont f2;
PFont f3;
Table table;

color Cspring=color(201, 62, 245);
color Csummer=color(255, 75, 87);
color Cfall=color(255, 216, 75);
color Cwinter=color(66, 155, 242);

int TextX=25;
int TextXX=25;
int Text=28;
int TextL=40;
int WindowX=1200;
int WindowY=700;
int MapX=667;
int MapY=659;
int CensorX=5;
float Label1=WindowX*0;
float Label2=WindowX*0.15;
float Condition1=WindowX*0.15;
float Condition2=WindowX*0.5;
float deltaCondi=Condition2-Condition1;
float Help1=WindowX*0.56;
float Help2=WindowX;
float deltaY=WindowY*0.25/3;
float Select1=1*deltaY;
float Select2=2*deltaY;
float Select3=3*deltaY;

float rotx = -PI/4;
float roty = -PI/4;
float MapScale=400;
float TextScale=0.001;
float movx=0;
float movy=-200;
float C1=Condition1;
float C2=Condition2;
float H1=Condition1;
float H2=Condition2;

Boolean map=true;
Boolean view=true;
Boolean pannel=false;
Boolean result=false;
Boolean line1=false;
Boolean line2=false;
Boolean line3=false;
Boolean condi=false;
float photlow=0;
float phothigh=1;
float pcaplow=0;
float pcaphigh=1;
int season=3;


int tubeRes = 33;
float[] tubeX = new float[tubeRes+1];
float[] tubeY = new float[tubeRes+1];

