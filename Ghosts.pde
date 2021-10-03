class Ghosts {
  float xR, yR;
  int num, counter1, counter2, counter3, counter4, counter5;
  PImage barista, ghost1, ghost2, ghost3, ghost4, ghost5, ghost6;

  String ghostAnimate1[] = {
    //barista-12 frames
    "barista_01.png", 
    "barista_02.png", 
    "barista_03.png", 
    "barista_04.png", 
    "barista_05.png", 
    "barista_06.png", 
    "barista_07.png", 
    "barista_09.png", 
    "barista_10.png", 
    "barista_11.png", 
    "barista_12.png"
  };

  String ghostAnimate2[][] ={
    //Customer 1-6 frames
    { "CS1_01.png", 
      "CS1_02.png", 
      "CS1_03.png", 
      "CS1_04.png", 
      "CS1_05.png", 
    "CS1_06.png" }, 

    //customer 2-6 frames
    {
      "CS2_01.png", 
      "CS2_02.png", 
      "CS2_03.png", 
      "CS2_04.png", 
      "CS2_05.png", 
      "CS2_06.png"
    }
  };

  String ghostAnimate3[][] ={
    //customer 3-8 frames
    {
      "CS3_01.png", 
      "CS3_02.png", 
      "CS3_03.png", 
      "CS3_04.png", 
      "CS3_05.png", 
      "CS3_06.png", 
      "CS3_07.png", 
      "CS3_08.png"
    }, 
    //customer 5-8 frames
    {
      "CS5_01.png", 
      "CS5_02.png", 
      "CS5_03.png", 
      "CS5_04.png", 
      "CS5_05.png", 
      "CS5_06.png", 
      "CS5_07.png", 
      "CS5_08.png"
    }
  };

  String ghostAnimate4[] ={
    //Customer 4-9 frames
    "CS4_01.png", 
    "CS4_02.png", 
    "CS4_03.png", 
    "CS4_04.png", 
    "CS4_05.png", 
    "CS4_06.png", 
    "CS4_07.png", 
    "CS4_08.png", 
    "CS4_09.png", 
  };
  
  String ghostAnimate5[] ={
    //customer 6-7 frames
    "CS6_01.png", 
    "CS6_02.png", 
    "CS6_03.png", 
    "CS6_04.png", 
    "CS6_05.png", 
    "CS6_06.png", 
    "CS6_07.png", 
  };

  Ghosts(float _x, float _y, int _num) {
    xR=_x/40;
    yR=_y/20;
    num=_num;
    counter1=0;
    counter2=0;
    counter3=0;
    counter4=0;
    counter5=0;
  }

  //barista
  void ghost1() {
    barista = loadImage(ghostAnimate1[counter1]); //ghostAnimate[0][counter]
    image(barista, 0, 0);
  }

  void ghost2() {
    ghost1 = loadImage(ghostAnimate2[0][counter2]);
    image(ghost1, 0, 00);
  }

  void ghost3() {
    ghost2 = loadImage(ghostAnimate2[1][counter2]);
    image(ghost2, 0, 0);
  }



  void ghost4() {
    ghost3 = loadImage(ghostAnimate3[0][counter3]);
    image(ghost3, 0, 0);
  }

  void ghost5() {
    ghost4 = loadImage(ghostAnimate4[counter4]);
    image(ghost4, 0, 0);
  }



  void ghost6() {
    ghost5 = loadImage(ghostAnimate3[1][counter3]);
    image(ghost5, 0, 0);
  }

  void ghost7() {
    ghost6 = loadImage(ghostAnimate5[counter5]);
    image(ghost6, 0, 0);
  }

  void update(int people){
    num=people;
  }

  void display() {
    switch(num) {
    case 0:
      break;
    case 1:
      ghost1();
      break;
    case 2:
      ghost1();
      ghost2();
      break;
    case 3:
      ghost1();
      ghost2();
      ghost3();
      break;
    case 4:
      ghost1();
      ghost2();
      ghost3();
      ghost4();
      break;
    case 5:
      ghost1();
      ghost2();
      ghost3();
      ghost4();
      ghost5();
      break;
    case 6:
      ghost1();
      ghost2();
      ghost3();
      ghost4();
      ghost5();
      ghost6();
      break;
    case 7:
      ghost1();
      ghost2();
      ghost3();
      ghost4();
      ghost5();
      ghost6();
      ghost7();
    }

    if (counter1<=9) {
      counter1++;
    } else {
      counter1 = 0;
    }

    if (counter2<=4) {
      counter2++;
    } else {
      counter2 = 0;
    }

    if (counter3<=6) {
      counter3++;
    } else {
      counter3 = 0;
    }

    if (counter4<=7) {
      counter4++;
    } else {
      counter4 = 0;
    }

    if (counter5<=5) {
      counter5++;
    } else {
      counter5 = 0;
    }
  }
}
