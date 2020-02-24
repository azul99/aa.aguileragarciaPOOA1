class pantalla {
  int P;
  pantalla() {
    this.P=0;
  }
  void p1() {
    background(129, 216, 2087);
    fill(250, 210, 1);


    textSize(150);
    textAlign(CENTER);
    text("BOB", width/2, 300);
    fill(255, 105, 180);
    textSize(30);
    textAlign(CENTER);
    text("realmente cuadrado y sus amigos", width/2, 330);
    textSize(20);
    text("PRESS ñ", 1000, 550);
    rectMode(CENTER);
    fill(255, 255, 0);
    rect( width/2, 450, 200, 200);
    noStroke(); 
    beginShape();
    endShape();
  }

  void p2() {
    background(119, 221, 119);
    noStroke();
    rectMode(CENTER);

    pushMatrix();
    translate(0, 10);
    PER1.BOB();
    popMatrix();

    pushMatrix();
    translate(0, 180);
    PER2.PATRICIO();
    popMatrix();

    pushMatrix();
    translate(90, 10);
    PER3.CALAMARDO();
    popMatrix();

    pushMatrix();
    translate(100, 180);
    PER4.GARY();
    popMatrix();

    pushMatrix();
    translate(150, 10);
    PER5.PARTICULA98();
    popMatrix();
    //--
    //TEXTO
    fill(45, 87, 44);
    textSize(30);
    //textAlign(CENTER,CENTER);
    text("SELECCIONA TU PERSONAJE", 395, 60);//posicionar
    textSize(15);
    fill(45, 87, 44);
    text("BOB 1\nJUGADOR (1) [b]", 150, 230);
    text("PATRICIO 2\nJUGADOR (1) [p] ", 150, 400);
    text("CALAMARDO 3\nJUGADOR (1) [c] ", 380, 200);
    text("GARY 4\nJUGADOR (1) [g]", 700, 390);
    text("PARTICULA 98 5\nJUGADOR (2) [z]", 995, 170);
    fill(45, 87, 44);
    textSize(20);
    text(jug, 350, 450);
    elec1();
    if (sig==1) {
      elec2();
    }
  }

  void p3() {
    strokeWeight(3);
    for (int i=0; i<height; i++) {
      stroke(i, g, b);
      line(0, i, width, i);
    } 
    rectMode(CORNER);
    noStroke();


    background(175, 255, 255);
    fill(255);
    textSize(20);//vida2num
    //text(genert, 450, 250);
    fill(255, 0, 0);
    rect(928, 450, vida2*2, 50, 50);
    fill(0);
    text(numesc2, 1000, 450);
    text(vida2, 980, 485);
    fill(255, 0, 0);
    rect(70, 450, vida1*2, 50, 50);
    fill(0);
    text(vida1, 120, 485);
    //ganador();
    textSize(30);
    fill(255, 105, 180);
    text("J1 atack press (a)-J2 atack press (w)", width/2, 510);
    if (tur1==1) {
      pushMatrix();
      translate(100, 110);
      PER1.eleccion=1;
      PER1.eleccion1();
      PER1.vida=vida1;
      ataque1=PER1.ataque;
      popMatrix();
    }
    if (tur1==2) {
      pushMatrix();
      translate(130, 170);
      PER2.eleccion=2;
      PER2.eleccion1();
      PER2.vida=vida1;
      ataque1=PER2.ataque;
      popMatrix();
    }
    if (tur1==3) {
      pushMatrix();
      translate(-195, 10);
      PER3.eleccion=3;
      PER3.eleccion1();
      PER3.vida=vida1;
      ataque1=PER3.ataque;
      popMatrix();
    }
    if (tur1==4) {
      pushMatrix();
      translate(-345, 150);
      PER4.eleccion=4;
      PER4.eleccion1();
      PER4.vida=vida1;
      ataque1=PER4.ataque;
      popMatrix();
    }
    if (tur1==5) {
      pushMatrix();
      translate(-530, 190);
      PER5.eleccion=5;
      PER5.eleccion1();
      PER5.vida=vida1;
      ataque1=PER5.ataque;
      popMatrix();
    }



    if (tur2==5) {
      pushMatrix();
      translate(130, 190);
      PER5.eleccion=5;
      PER5.eleccion1();
      PER5.vida=vida2;
      ataque2=PER5.ataque;
      popMatrix();
    }
    pelea();
  }
  void p4() {
    pushMatrix();
    translate(90, 90);
    background(161, 133, 148);
    beginShape();

    endShape();
    popMatrix();
    textSize(40);
    textAlign(CENTER);
    text(GANADOR, width/2, 350);
    text("¡¡¡GANADOR!!!", width/2, 300);
    textSize(20);
    text ("PRECIONE k PARA VOLVER A JUGAR", 950, 520);
    reset();
  }

  void el() {
    switch(P) {
    case 1:
      p2();
      break;
    case 3:
      p3();
      break;
    case 4:
      p4();
      break;
    }
  }
}
