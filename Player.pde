class Player{
  
  float x, y;
  float w = 80, h = 80;
  int xSpeed = 5;
  float ySpeed;
    
  int moveDirection = 0;
  int moveTimer = 96;
  int moveDuration = 96;
  int life;
  final int playerMaxLife = 5;
  
  PImage smallCreatureDisplay;
  
  void update(){
    
    if(y >= height - jumpUpDist){
      gameState = GAME_OVER;
    }
    
    if (leftState) {
      smallCreatureDisplay = smallCreatureLeft;
      x -= xSpeed;
    } else if (rightState) {
      smallCreatureDisplay = smallCreatureRight;
      x += xSpeed;
    } else if(!leftState && !rightState){
      
    } 
    
    if(x > width){
      x = - 50; // let it not abruptly display.
    }else if(x < -50){
      x = width;
    }
    
    
    if (moveTimer > 0) {
      ySpeed = (moveTimer > 48) ? map(moveTimer, 96, 49, -8, -0) : map(moveTimer, 48, 1, 0, 8);
      moveTimer --;
      //println(moveTimer);
    }
    
      y += ySpeed;

    image(smallCreatureDisplay,x, y, w, h);
    
  }

      
  void jump(){
    
    moveTimer =  moveDuration;
    
  }
  
  void hurt(){
    
    life --;
    if(life == 0){
      gameState = GAME_OVER;
    }
  
  }
  
  
  Player(){
    
    smallCreatureDisplay = smallCreatureLeft;
    x = width / 2; // in the middle
    //x = random(w,width - w);// random
    y = height - 3* h;
    life = 1;
    
  }
}