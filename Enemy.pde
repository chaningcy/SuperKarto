class Enemy {
  float x, y;
  float w = 120;
  float h = 120;
  boolean alive;

  void checkCollision(Player player){
  
    if(alive && isHit(x, y, w, h, player.x, player.y, player.w - 5, player.h - 5)){
       player.hurt();  
       alive = false;
    }
  }
  

  void display(){
  }
  void update(){}

  Enemy(float x, float y){
    this.x = x;
    this.y = y;
    alive = true;
  }
}