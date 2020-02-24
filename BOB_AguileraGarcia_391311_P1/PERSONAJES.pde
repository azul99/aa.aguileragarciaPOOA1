public class personaje{

  int xposicion, yposicion;
  int eleccion;
  float vida;
  float ataque;
  int radio = 80;


  personaje(int xp1, int yp1, float ataque_) {
    this.xposicion=xp1;
    this.yposicion=yp1;
    this.ataque =ataque_;
  }

  void BOB() {
    fill(255, 255, 0);
    rect(150, 150, 100, 100);
  }

  void PATRICIO() {
    fill(255, 0, 128);
    triangle(150, 100, 100, 200, 200, 200);
  }

  void CALAMARDO() {
    fill(0, 156, 140);
    rect(400, 200, 100, 200);
  }

  void GARY() {
    fill(253, 188, 180);
    ellipse(600, 152, radio, radio);
  }

  void PARTICULA98() {
    fill(128, 0, 0);
    ellipse(850, 120, 35, 35);
  }

  void eleccion1() {

    switch(eleccion) {

    case 1:

      BOB();

      break;

    case 2:

      PATRICIO();

      break;

    case 3:

      CALAMARDO();

      break;

    case 4:

      GARY();

      break;

    case 5:

      PARTICULA98();

      break;
    }
  }
}
