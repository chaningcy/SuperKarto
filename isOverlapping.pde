boolean isOverlapping(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh){
  
  if(ax + aw >= bx &&    // a right edge past b left
     ax <= bx + bw &&    // a left edge past b right
     ay + ah >= by &&    // a top edge past b bottom
     ay <= by + bh){
     return true;
     }else{
     return false;
  }
}