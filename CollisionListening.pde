import shiffman.box2d.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;

import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Boundary> boundaries;
ArrayList<pelotaa> systems;

Boundary wall;
void setup() {
  size(500,500);
  
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();

  box2d.setGravity(0, -50);
  systems = new ArrayList<pelotaa>();
  boundaries = new ArrayList<Boundary>();
  boundaries.add(new Boundary(50,491,80,50,0.0));
  boundaries.add(new Boundary(148,491,100,90,0.0));
    boundaries.add(new Boundary(248,491,80,50,0.0));
   boundaries.add(new Boundary(348,491,100,90,0.0));
    boundaries.add(new Boundary(448,491,80,50,0.0));
      boundaries.add(new Boundary(395,155,250,7,0.5));
  boundaries.add(new Boundary(110,115,250,7,-0.4));
  boundaries.add(new Boundary(110,250,250,7,-0.4));
    boundaries.add(new Boundary(395,295,250,7,0.5));
}
void draw() {
  background(255,255,0);
  imageMode(CORNER);
  
  box2d.step();
  for (pelotaa system: systems) {
    system.run();
    int n = (int) random(0,2);
    system.addParticles(n);
  }
  for (Boundary wall: boundaries) {
    wall.display();
    }
  }
  
void mousePressed() {
  systems.add(new pelotaa(0, new PVector(mouseX,mouseY)));
}
