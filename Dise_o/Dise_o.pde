
import controlP5.*; 
import ddf.minim.*;


static final int REPOSO = 0;
static final int DISPARANDO = 1;
static final int INSTRUCCIONES = 2;
static final int DESTRUIDO = 3;
static final int ERROR = 4;


static final int TIEMPO_ESPERA = 5;
static final float gr = 9.8;



ControlP5 p5;

Minim minim;
AudioPlayer sboom;


Sprite tanque;   


float x;             
float y;            
float v_ini=20;      
float angulo=15;     
float t=0;           

float vtank = 3.5;     
float contador = 5;         
int intentos = 5;        
int estado = INSTRUCCIONES; 


PImage bala = null;   
PImage base = null; 
PImage fusil = null;  


PImage desierto = null;

PImage boom = null;

void setup() {
  
  size(700, 600);
  
  p5 = new ControlP5(this);
  
  minim = new Minim(this);
  sboom = minim.loadFile("boom.mp3");

  
  frameRate(24); 

  
  bala = loadImage ("bala.png");
  base = loadImage ("base.png");
  fusil = loadImage ("fusil.png");

  desierto = loadImage("desierto.png");
  boom = loadImage("boom.png");


  p5.setColorActive(color(255, 80, 80));
  p5.setColorForeground(color(255, 80, 80));
  p5.setColorBackground(color(80, 60, 60, 100));

  controlP5.Button boton_v_mas = p5.addButton("boton_v_mas"); 
  boton_v_mas.setPosition(125, 14);
  boton_v_mas.setSize(10, 10);  
  boton_v_mas.setCaptionLabel("+"); 

  controlP5.Button boton_v_menos = p5.addButton("boton_v_menos"); 
  boton_v_menos.setPosition(85, 14);
  boton_v_menos.setSize(10, 10);  
  boton_v_menos.setCaptionLabel("-"); 

  controlP5.Button boton_a_mas = p5.addButton("boton_a_mas"); 
  boton_a_mas.setPosition(125, 34); 
  boton_a_mas.setSize(10, 10); 
  boton_a_mas.setCaptionLabel("+"); 

  controlP5.Button boton_a_menos = p5.addButton("boton_a_menos"); 
  boton_a_menos.setPosition(85, 34); 
  boton_a_menos.setSize(10, 10); 
  boton_a_menos.setCaptionLabel("-"); 
  
  controlP5.Button boto_dispara = p5.addButton("boton_dispara"); 
  boto_dispara.setPosition(15, 80); 
  boto_dispara.setSize(120, 20);  
  boto_dispara.setCaptionLabel("DISPARA"); 

  

  
  tanque = new Sprite((int)(width-178-random(300)), height-130, 2, 1, "tanque.png");
  tanque.limites (width/2+50, width+100);
}


void draw() {
  image(desierto, -300,-50);
 
  
  if (contador > 0) contador -= (1/frameRate); 

  if (contador <= 1 && estado >= INSTRUCCIONES) {
       contador = 0;
    intentos = 5;
    x = 0;
    estado = REPOSO;
    v_ini=20;  
    angulo=15;
  }
 
  textAlign(CENTER, CENTER);
  textSize(16);

  switch (estado) {
  case INSTRUCCIONES : 
    fill(0, 0, 0, 208); 
    rect(width/2-300, height/2-120, 600, 240, 10);  
    fill(235,99,107);
    text("Has de destruir el tanque cambiando el ángulo y la velocidad\r\n a la que lanza el cañón\r\n\r\n"+
      "Flechas arriba / abajo para variar el ángulo\r\n"+
      "Flechas izquierda / derecha para variar la velocidad\r\n"+
      "ESPACIO para disparar\r\n\r\n"+
      "También puedes hacer servir los controles del cuadro de mando", 
      width/2, height/2);

    textSize(80);
    fill(55, 55, 0, 208);
    text((int)contador, width-50, 50);
    break;
  case DESTRUIDO :
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(0, 0, 0, 208);  
    rect(width/2-250, height/2-75, 500, 150, 10);  
    fill(225,99,107);
    text("¡E X C E L E N T E !\r\n\r\nHas destruido el tanque.", width/2, height/2);
    image(boom, x-boom.width/2, height-boom.height);
    break;
  case ERROR:
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(0, 0, 0, 208); 
    rect(width/2-250, height/2-75, 500, 150, 10);  
    fill(235,99,107);
    text("¡O H  N O!\r\n\r\nNO has podido atacar al tanque.", width/2, height/2);
    break;
  case DISPARANDO:
  case REPOSO:

 
 
     pinta_cano();
    tanque.draw();
    
    pinta_bala();

      if (tanque.dentro(x, y)) {
      
      estado = DESTRUIDO;
      contador = TIEMPO_ESPERA;
      
      tanque.pos((int)(width-178-random(300)), tanque.getY());
      tanque.reset();
      sboom.play();
    } else {
     
      tanque.mover(vtank, 0);
    }
    break;
  }
 
  fill(50, 30, 30, 200);   
  stroke(255, 255, 255);    
  strokeWeight(2);          
  rect(5, 5, 140, 110, 10);
  textSize(12);            

  fill(255);               
  textAlign(LEFT, TOP);    
  text("Velocidad :    "+v_ini/10, 20, 12);         
  text("Angulo    :     "+(int)angulo+"º", 20, 32); 
  text("Intentos  : "+intentos, 20, 60);            

  
  fill(255); // Creditos de color AMARILLO
  text("HAZ CLICK EN + O - PARA CAMBIAR LA VELOCIDAD Y EL ANGULO DEL DISPARO", 150, 25);
}


void keyPressed() {
  
  if (estado == DISPARANDO) return;

  switch (keyCode) {
  case UP :    
    boton_a_mas();     
    break;
  case DOWN :  
    boton_a_menos();    
    break;
  case LEFT :  
    boton_v_menos();    
    break;
  case RIGHT : 
    boton_v_mas();    
    break;
  case 32 :    
    boton_dispara();    
    break;
  }
}

void pinta_cano() {
  image(base, 40, height-42); 
  pushMatrix(); 
  imageMode(CENTER);
  translate(88-angulo/4, height-60-angulo/5); 
  rotate(radians(-angulo)); 
  image(fusil, 0, 0); 
  imageMode(CORNER);  
  popMatrix(); 
}

void pinta_bala() {
  
  if (estado == DISPARANDO) {
    
    x= 130+(-angulo/2)+v_ini*cos(radians(angulo))*t;
    y= (height-60-angulo)-(v_ini*sin(radians(angulo))*t-gr*pow(t, 2)/2);

    float zoom = 0.8-(cos(t*3)/6);
    pushMatrix(); 
    imageMode(CENTER); 
    translate(x, y); 
    rotate(radians(-angulo+t*(100/v_ini)*7)); 
    scale(zoom); 
    image(bala, 0, 0); 
    imageMode(CORNER); 
    popMatrix(); 
    
    t+=0.25;
    
    if (y > height) {
      estado = REPOSO;
      x = 0;
      intentos--; 
      if (intentos <= 0) {
        
        contador = TIEMPO_ESPERA;
        estado = ERROR;
        
        tanque.pos((int)(width-178-random(300)), tanque.getY());
        tanque.reset();
      }
    }
  }
}


void boton_v_mas() {
  if (estado == DISPARANDO) return;
  if (v_ini < 80) v_ini += 5;
}  

void boton_v_menos() {
  if (estado == DISPARANDO) return;
  if (v_ini > 20) v_ini -= 5;
}

void boton_a_mas() {
  if (estado == DISPARANDO) return;
  if (angulo < 90) angulo += 5;
}

void boton_a_menos() {
  if (estado == DISPARANDO) return;
  if (angulo > 0) angulo -= 5;
}

void boton_dispara() {
  if (estado == DISPARANDO) return;
  if (intentos > 0) {
    t = 0;
    estado = DISPARANDO;
  }
}
