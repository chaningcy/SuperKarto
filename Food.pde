class Food{

float x;
float y;
float w = 50;
float h = 50;
boolean alive=true;

 Food(float x,float y){
   this.x=x;
   this.y=y;
   
  
 }



 void isHit(){
 
    
     if(alive==true && x + w > player.x &&    
        x < player.x + player.w &&    
        y + h > player.y &&    
        y < player.y + player.h)
        {
          if(player.life<3){
            player.life++;
            
          }
           if(player.life<=3){           
            alive=false;
          }
        }    
        
  }

  void display(){
   if(alive==true){
   image(food, x, y, 50, 50);
   }
 
 }
 }