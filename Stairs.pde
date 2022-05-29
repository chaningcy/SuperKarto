class Stairs{  
  
  float x;
  float y;
  float w=120;
  float h=30;
  PImage stair;
  boolean code = true;

  
  Stairs(float x,float y,String filename){ 
    this.x=x;
    this.y=y;
    stair=loadImage(filename);                 
  }
  
  void display(){    
    image(stair,x,y,w,h);            
  }
  
  void move(){  
    
  }
  
  void checkCollision(Player player){
    
    if (player.ySpeed > 0) {       if(player.y + player.h >= y && player.y + + player.h <= y + h && player.x > x - player.w * 0.9 && player.x < x + 0.9 * w){          player.jump(); 
      }
    }   
  }
  
}