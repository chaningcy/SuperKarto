class Fire extends Enemy{

float fireX;
float fireY;
int speed=1;
int speed_fireball = 4;
int FIRE_TIME = 30;
boolean ball = true;

void display(){
 
  if(alive){
    image(fire,x,y);
    x+=speed;

     if(FIRE_TIME < 30){
       if (ball){
         image(fireball, fireX, fireY, 40, 40);
       }
       fireX += speed_fireball;   
       if(ball && isHit(fireX, fireY, 30, 30, player.x, player.y, player.w, player.h)){
         player.hurt();
         ball = false;
       }
     }
     if(x > 720){
       x=0;
       fireX = 90;
       FIRE_TIME = 30;
       ball = true;
     }   
  }else if (!alive){
    image(fireDie,x,y);
  }
}

 Fire(float x,float y){
 super(x,y);
 fireX=x+90;
 fireY=y+55;

}
}  
  