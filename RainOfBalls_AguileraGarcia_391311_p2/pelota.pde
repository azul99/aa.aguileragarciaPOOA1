class Particle {
  Body body;
  PVector[] trail;
boolean a = false;
  Particle(float x_, float y_) {
    a = false;
    float x = x_;
    float y = y_;
    Body body;
  float r;

  color col;
    trail = new PVector[1];
    for (int i = 0; i < trail.length; i++) {
      trail[i] = new PVector(x,y);
    }
    makeBody(new Vec2(x,y),5.2f);
  }
  void killBody() {
    box2d.destroyBody(body);
  }
 
  
  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+20) {
      killBody();
      return true;
    }
    return false;
  }
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    for (int i = 0; i < trail.length-1; i++) {
      trail[i] = trail[i+1];
    }
    trail[trail.length-1] = new PVector(pos.x,pos.y);
    beginShape();
    fill(0);
    strokeWeight(25);
    stroke(129,216,208);
    for (int i = 0; i < trail.length; i++) {
      vertex(trail[i].x,trail[i].y);
    }
    endShape();
  }
  void makeBody(Vec2 center, float r) {
    if ( a ){
    fill(1,0,0);//red
    }
  else{
    fill(1,1,1);//white
  }
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);
    body.setLinearVelocity(new Vec2(1,1));
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0;
    fd.restitution = 0.7;
    body.createFixture(fd);
  }

  void startContact() { a = true; }
  void endContact() { a = false; }
  
  
}
