


class Sprite {
  
  private PImage img;

  private float x;           
  private float y;          
  private int wi;            
  private int he;           
  private int minX=0;       
  private int maxX=width;   

  private float speed;      
  private int nFramesX;     
  private int nFramesY;     
  private float nFrame=0;   

  private int sentit = 1;   
  private int flip=1;       

  private boolean visible = true;

  private Sprite() {
  }

 
  Sprite(int x, int y, int nx, int ny, String file) {
    img = loadImage(file);
    this.x = x;
    this.y = y;
    this.nFramesX = nx;
    this.nFramesY = ny;
    this.wi = img.width/nx;
    this.he = img.height/ny;
    
    speed = (nFramesX*nFramesY)/frameRate;
  }

 
  void reset() {
    flip = 1;
    sentit = 1;
    nFrame = 0;
    visible = true;
  }


  void pos(int xx, int yy) {
    this.x = xx;
    this.y = yy;
  }


  void velocidad(float s) {
    this.speed = s;
  }


  void medida(int w, int h) {
    this.wi = w;
    this.he = h;
  }

 
  void limites(int min, int max) {
    minX = min;
    maxX = max;
    
    if (x < minX) x = minX;
    if (x > maxX) x = maxX;
  }

  void mover_der(float nx, float ny) {
    x += nx;  
    y += cos(x)*ny;  
    if (x > maxX) x = minX; 
  }


  void mover_izq(float nx, float ny) {
    x-=nx;  
    y += cos(x)*ny; 
    if (x < minX) x = maxX; 
  }


  void mover(float xx, float yy) {
    x += (xx*sentit);  
    y += cos(x)*yy;    

   
    if (x + (xx*sentit) < minX || x + (xx*sentit) > maxX) {
      sentit = -sentit;
      if (yy > 0) y = random(height/2);
      voltea();
    }
  }

 
  void voltea() {
    flip = (flip > 0) ? -1 : 1;
  }

 
  boolean volteado() {
    return flip < 0;
  }

 
  int getFrame() {
    return (int)nFrame;
  }


  int getX() {
    return (int)x;
  }
  

  int getY() {
    return (int)y;
  }

  void draw() {
    draw(-1);
  }

  void draw(int nf) {
    
    if (!visible) return;
    
    
    if (nf < 0) {
      nFrame += speed;
     
      if (nFrame >= nFramesX*nFramesY) nFrame = 0;
    } else {
      
      nFrame = nf;
    }
    
    int w = img.width/nFramesX;
    int h = img.height/nFramesY;

    
    PImage frame = createImage(this.wi, this.he, ARGB);

     
    frame.copy(img, (int)(nFrame%nFramesX)*w, (int)(nFrame/nFramesX)*h, w, h, 0, 0, this.wi, this.he);

     
    
    pushMatrix();          
    scale(flip, 1.0);        
    image(frame, x*flip, y); 
    popMatrix();             
  }

  
  void visible(boolean b) {
    visible = b;
  }
 
 
  boolean colisionan(Sprite b) {
    
    int bx = (int)b.x+b.wi*b.flip/2;
    
    
    int mx = (int)x+wi/2*flip;
    int my = (int)y+he/2;
    
    
    return (b.visible && mx >= bx-b.wi/2 && mx <= bx+b.wi/2 && my >= b.y && my <= b.y+b.he); 
  }
 
  
  boolean dentro(float xx, float yy) {
   
    int mx = (int)x+wi/2*flip; 
    int my = (int)y+he/2;
    
   
    return (xx > mx-wi/2 && xx < mx+wi/2 && yy > my-he/2 && yy < my+he/2);
  }
 

  public Sprite clonar() {
    Sprite p = new Sprite();
    p.img = this.img;
    p.nFramesX = this.nFramesX;
    p.nFramesY = this.nFramesY;
    p.nFrame = random(nFramesX*nFramesY);
    return p;
  }  
}
