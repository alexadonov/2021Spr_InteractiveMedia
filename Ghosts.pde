class Ghosts {
  float xR,yR;
  int num, counter;
  PImage barista, ghost1, ghost2, ghost3, ghost4, ghost5, ghost6;
  
  Ghosts(float _x, float _y, int _num){
    xR=_x/40;
    yR=_y/20;
    num=_num;
    counter=0;
  }
  
  //barista
  void ghost1(){
    barista = loadImage("Barista.png");
    image(barista, 4.5*xR, 4.8*yR);
  }
  
  void ghost2(){
    //ghost1 = loadImage("Cutomer_1.gif");
    //image(ghost1, 20, 20);
  }
  
  void ghost3(){
    
  }
  
  void ghost4(){
    
  }
  
  void ghost5(){
    
  }
  
  void ghost6(){
    
  }
  
  void ghost7(){
    
  }
  
  void display() {
    ghost1();
    ghost2();
    ghost3();
    ghost4();
    ghost5();
    ghost6();
    ghost7();
  }
}