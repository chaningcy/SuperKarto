class Ice extends Enemy{

  float iceX;
  float iceY;
  int ICE_TIME = 120;
 
  boolean ball = true;

  
  void display(){
    if(alive){
      image(ice,x,y);
      stroke(3);
      fill(255,255,255);
      
      
      
      if(x>360 && ICE_TIME < 120){
        if (ball){
          image(snow, iceX, iceY, 40, 40);
        }
        iceX -= 2;  
        if(ball && isHit(iceX, iceY, 20, 20, player.x, player.y, player.w, player.h)){
          player.hurt();
          ball = false;
        }
        
        
      }else if (x<=360 && ICE_TIME< 120){
        if (ball){
          image(snow, iceX + 90, iceY, 40, 40);
        }
        iceX += 2; 
        if(ball && isHit(iceX, iceY, 20, 20, player.x, player.y, player.w, player.h)){
          player.hurt();
          ball = false;
        }
      }else if (x>360 && ICE_TIME >= 120){
          iceX += 4;    
          ball = true;
      }else if (x<=360 && ICE_TIME >= 120){
          iceX -= 4; 
          ball = true;
      }
    }else if (!alive){
      image(iceDie,x,y);
    }
  }
    
  
  
  Ice(float x,float y){
    super(x,y);
    iceX=x+10;
    iceY=y+70;
   
   
    
    
  }
 
  
  
}