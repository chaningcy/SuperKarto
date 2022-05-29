PImage smallCreatureLeft, smallCreatureRight;
PImage smallCreatureDisplay;
PImage windL, windR, fire, ice, snow, fireball, food;
PImage stair, stairIce, stairWind, stairFire;
PImage windLDie, windRDie, fireDie, iceDie;
PImage cover, start1,start2, restart1, restart2, win, lose;
float rangeX,  rangeY; //stair's range ; //stair's range in every interval
int [] interval; //for every 160 height is one interval,every interval has 1~3 stairs.
final float intervalY = 160;
final int rate = 60;
final int INTERVAL_NUMBER = 43; 
final int MAX_STAIRS_NUMBER=3;
final int START_BUTTON_WIDTH = 215;
final int START_BUTTON_HEIGHT = 90;
final float START_BUTTON_X = 450;
final int START_BUTTON_Y = 680;

final int RESTART_BUTTON_WIDTH = 215;
final int RESTART_BUTTON_HEIGHT = 90;
final float RESTART_BUTTON_X = 225;
final int RESTART_BUTTON_Y = 340;

final int LIFE_X = 10;
final int LIFE_Y = 60;
String loadStairs;



boolean leftState = false;
boolean rightState = false;
float jumpUpDist = 0;

int MULTIPLE=80;


final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2, GAME_WIN = 3;
int gameState = 0;


Stairs [][] a;
Player player;
Wind [] winds;
Fire [] fires;
Ice [] ices;
Food [] foods;

PImage [] bgs = new PImage[7];
PImage life1, life2, life3;

void setup(){
  size(720, 960);
  smallCreatureLeft = loadImage("img/smallCreatureLeft.png");
  smallCreatureRight = loadImage("img/smallCreatureRight.png");
  for (int i = 0; i < 7; i++){
    bgs[i]=loadImage("img/bgs/bg" +i+ ".jpg");
  }
  windL= loadImage("img/enemy/windL.png");
  windR= loadImage("img/enemy/windR.png");
  fire=loadImage("img/enemy/fire.png");
  ice=loadImage("img/enemy/ice.png");
  windLDie= loadImage("img/enemy/windL_die.png");
  windRDie= loadImage("img/enemy/windR_die.png");
  fireDie=loadImage("img/enemy/fire_die.png");
  iceDie=loadImage("img/enemy/ice_die.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  restart1 = loadImage("img/Restart1.png");
  restart2 = loadImage("img/Restart2.png");
  
  win = loadImage("img/WIN.jpg");
  lose = loadImage("img/LOSE.jpg");
  cover = loadImage("img/cover.jpg");
  
  
  life1 = loadImage("img/life/life1.png"); 
  life2 = loadImage("img/life/life2.png");
  life3 = loadImage("img/life/life3.png");
  
  stair=loadImage("img/stairs/stair.png");
  stairIce=loadImage("img/stairs/stairIce.png");
  stairWind=loadImage("img/stairs/stairWind.png");
  stairFire=loadImage("img/stairs/stairFire.png");
  
  
  fireball = loadImage("img/fireball.png");
  snow =  loadImage("img/snow.png");
  food = loadImage("img/food.png");
  
  
  
  frameRate(rate);
  
  
  initGame();
  
  
}

void initGame(){
  
  jumpUpDist = 0;
  interval = new int[INTERVAL_NUMBER];
  a = new Stairs[INTERVAL_NUMBER][MAX_STAIRS_NUMBER];
  player = new Player();
  
  
  // stairs
  
  for(int i=0;i<interval.length;i++){
     
    int Num=floor(random(1,MAX_STAIRS_NUMBER));
    interval[i]=Num;
  }
  
  for(int i=0;i<interval.length;i++){
    if(0<=i && 12>=i){
      loadStairs="stair";
    }else if(13<=i && 24>=i){
      loadStairs="stairWind";
    }else if(25<=i && 36>=i){
      loadStairs="stairIce";
    }else{
      loadStairs="stairFire";
    }
    for(int t=0;t<MAX_STAIRS_NUMBER;t++){
      rangeX=random(570);//720-W
      a[i][t]=new Stairs(rangeX,height + i*-160+rangeY,"img/stairs/"+loadStairs+".png");
      
      if(t>0){      
      while(isOverlapping(a[i][t].x,a[i][t].y,a[i][t].w,a[i][t].h,a[i][t-1].x,a[i][t-1].y,a[i][t-1].w,a[i][t-1].h)){
      a[i][t].x=random(720);
      a[i][t].y= height + i*-160; 
      
      }
     }
      if(t>1){      
      while(isOverlapping(a[i][t].x,a[i][t].y,a[i][t].w,a[i][t].h,a[i][t-2].x,a[i][t-2].y,a[i][t-2].w,a[i][t-2].h)||
      isOverlapping(a[i][t].x,a[i][t].y,a[i][t].w,a[i][t].h,a[i][t-1].x,a[i][t-1].y,a[i][t-1].w,a[i][t-1].h)){
      a[i][t].x=random(720);
      a[i][t].y= height + i*-160;           
      }
     }
    
   }  
  }
  
  //foods
  
  foods=new Food[6];
  for (int i= 0; i < foods.length; i++){
    foods[i]=new Food(a[i*8][0].x+25,a[i*8][0].y - 50);
  }
  
  // enemy
  
  winds= new Wind[3];
  
   for(int i=0;i<winds.length;i++){
     float newX=MULTIPLE*floor(random(0,6));
     float newY=height * 1 + MULTIPLE*(i*5+floor(random(0,4)));
     winds[i]=new Wind(newX,-newY);
     
   }
   
  fires= new Fire[3];
  
  for(int i=0;i<fires.length;i++){
     float newX=random(0,600);
     float newY=height * 5 + MULTIPLE*(i*5+floor(random(0,4)));
     fires[i]=new Fire(newX,-newY);
   
 }
   
  ices= new Ice[3];
  for(int i=0;i<ices.length;i++){
  float newX=random(0,600);
  float newY=height * 3 + MULTIPLE*(i*5+floor(random(0,4)));
  ices[i]=new Ice(newX,-newY);
 }
  

}



void draw(){
  
  
  switch (gameState) {

  
    case GAME_START:
    
    
    image(cover, 0, 0);
    
    image(start1, START_BUTTON_X, START_BUTTON_Y);
    if(isMouseHit(START_BUTTON_X, START_BUTTON_Y, START_BUTTON_WIDTH, START_BUTTON_HEIGHT)) {
      image(start2, START_BUTTON_X, START_BUTTON_Y);
      if(mousePressed){
        gameState = GAME_RUN;
        mousePressed = false;
      }
    }

    break;
    
    case GAME_RUN:
    
    
      //println(jumpUpDist);
      if(jumpUpDist < -960 * 6){
      }else{
      for (int i = 0; i < 7; i++){
          image(bgs[(int) jumpUpDist / 960],-960 * i , 0);
        }
      jumpUpDist += 120 / rate;}
    
      //if(player.y >= -4400){
      //  jumpUpDist += map(player.y, 0, -960 * 20, 80, 120 )/ rate; 
      //}else if (player.y < -960 * 9  && player.y < -4400){
      //  jumpUpDist += 120 / rate; 
      //}else if(player.y == -960 * 10){
        
      //}
      
      //if (player.y <= 2000){
      //  jumpUpDist += 60 / rate; 
      //}else if(player.y <= 4000){
      //  jumpUpDist += 80 / rate; 
      //}else{
      //  jumpUpDist += 110 / rate; 
      //}
      
      pushMatrix();
      translate(0, jumpUpDist);
      
     //foods
     for(int i=0;i<foods.length;i++){
  
        foods[i].isHit();
        foods[i].display();
      
      }
      
      // stairs
      
      for(int i=0;i<interval.length;i++){             
        for(int t=0;t<interval[i];t++){
          a[i][t].checkCollision(player);
          a[i][t].display(); 
            
        }   
      }
      
      // enemy
      
      
       
       for(int i=0;i<3;i++){
         winds[i].display();
         if (winds[i].alive == true){
         }
         winds[i].checkCollision(player);
       }
       
       for(int i=0;i<3;i++){
         fires[i].display();
         if (fires[i].alive == true){
           fires[i].FIRE_TIME --;
         }
           
         if(fires[i].FIRE_TIME < 0){
           fires[i].FIRE_TIME= 80;
         }
         fires[i].checkCollision(player);
       }
       
       for(int i=0;i<3;i++){
         ices[i].display();
         if (ices[i].alive == true){
           ices[i].ICE_TIME --;
         }
         if(ices[i].ICE_TIME < 0){
           ices[i].ICE_TIME = 180;
          
         }
         ices[i].checkCollision(player);
       }
      
      player.update();
      
      popMatrix();
      
      if(player.life == 3){
        image(life3, LIFE_X, LIFE_Y, 300, 75);
      }else if (player.life == 2){
        image(life2, LIFE_X, LIFE_Y, 300, 75);
      }else if (player.life == 1){
        image(life1,LIFE_X, LIFE_Y, 300, 75);
      }
      
      
      if (player.y <= - (height * 6 + player.h)){
        gameState = GAME_WIN;
      }
      
      
      
    break;
    case GAME_OVER:
    
    image(lose, 0, 0);
    image(restart1, RESTART_BUTTON_X, RESTART_BUTTON_Y);
    if(isMouseHit(RESTART_BUTTON_X, RESTART_BUTTON_Y, RESTART_BUTTON_WIDTH, RESTART_BUTTON_HEIGHT)) {
      image(restart2, RESTART_BUTTON_X, RESTART_BUTTON_Y);
      if(mousePressed){
        gameState = GAME_RUN;
        mousePressed = false;
      }
      
      initGame();
    }
    
    
    break;
    case GAME_WIN:
    
    image(win,0,0);    
    
    break;
  }
}

void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftState = true;
      rightState = false;
      break;
      case RIGHT:
      leftState = false;
      rightState = true;
      break;
    }
  }
}

void keyReleased(){
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftState = false;
      break;
      case RIGHT:
      rightState = false;
      break;
    }
  }
}

boolean isMouseHit(float bx, float by, float bw, float bh){
  return  mouseX > bx && 
        mouseX < bx + bw && 
        mouseY > by && 
        mouseY < by + bh;
}

boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh){
  return  ax + aw > bx &&    // a right edge past b left
        ax < bx + bw &&    // a left edge past b right
        ay + ah > by &&    // a top edge past b bottom
        ay < by + bh;
}