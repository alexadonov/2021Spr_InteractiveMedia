Cafe cafe;
Furniture furniture;
CafeJuke juke;

void setup() {
  size(2000,1000);
  
  cafe = new Cafe(width, height);
  furniture = new Furniture(width, height);
  juke = new CafeJuke(width,height);
}

void draw() {
  background(0);
  
  cafe.display();
  juke.display();
  furniture.display();
}