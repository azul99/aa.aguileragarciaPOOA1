int tur1=0;
int x, y;
int tur2=0;
int TURNO=1;
int jugadordos=0;
int sig=0;
String jug="elige jugador 1 (b,p,c,g)";
float vida1=100;
float vida2=100;
String GANADOR="";
String numesc2="";
int numero1=0;
int numero2=0;
int ganador=0;
float ataque1;
float ataque2;
float r=0;
float g=0;
float b=0;

personaje PER1;
personaje PER2;
personaje PER3;
personaje PER4;
personaje PER5;
pantalla p1;
void setup() {
  p1= new pantalla();
  PER1= new personaje(0, 0, random(1, 20));
  PER2= new personaje(0, 0, random(1, 20));
  PER3= new personaje(0, 0, random(1, 20));
  PER4= new personaje(0, 0, random(1, 20));
  PER5= new personaje(0, 0, random(1, 20));
  size(1200, 600);
  frameRate(30);
}
void draw() {
  p1.el();
  if (p1.P==0) {
    p1.p1();
  }
  if ((key=='ñ')&&(p1.P==0)) {
    System.out.println("ENTER");
    p1.P=1;
  }
}

void elec1() {
  if (tur1==0) {
    text(jug, 350, 390);
  }
  if ((key=='b')&&(p1.P==1)) {
    System.out.println("b");
    tur1=1;
    jug="elige jugador 2 (z)";
    sig=1;
    //elec2();
  }
  if ((key=='p')&&(p1.P==1)) {
    System.out.println("p");
    tur1=2;
    jug="elige jugador 2 (z)";
    sig=1;
    // elec2();
  }
  if ((key=='c')&&(p1.P==1)) {
    System.out.println("c");
    tur1=3;
    jug="elige jugador 2 (z)";
    sig=1;
    //elec2();
  }
  if ((key=='g')&&(p1.P==1)) {
    System.out.println("g");
    tur1=4;
    jug="elige jugador 2 (z)";
    sig=1;
    //elec2();
  }
}
void elec2() {
  if (key=='z') {
    System.out.println("z");
    tur2=5;
    p1.P=3;
  }
}
void pelea() {
  if ((keyPressed==true)&&(TURNO==1)&&(key=='w')) {   
    System.out.println("x");
    vida2=vida2-ataque1;
    keyPressed=false;
    TURNO=2;
  }
  if ((keyPressed==true)&&(TURNO==2)&&(key=='a')) {      
    System.out.println("m");
    vida1=vida1-ataque2;
    keyPressed=false;
    TURNO=1;
  }
  if (vida1<=0) {
    GANADOR="JUGADOR 2";
    p1.P=4;
  }
  if (vida2<=0) {
    GANADOR="JUGADOR 1";
    p1.P=4;
  }
}
void reset() {
  if ((keyPressed==true)&&(key=='k')) {
    p1.P=0;
    vida1=100;  
    vida2=100;
  }
}
