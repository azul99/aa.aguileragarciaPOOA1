class pelotaa  {
  PVector origin;
  Particle particula;
  pelotaa(int num, PVector v) {
    //particles = new ArrayList<Particle>();
    origin = v.get();
     particula = new Particle(origin.x,origin.y);
  }

  void run() {
    particula.display();
  }

  void addParticles(int n) {
  }

  boolean dead() {
    return false;
  }

}
