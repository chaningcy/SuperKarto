class Wind extends Enemy{

void display(){
  if(alive){
    if(x > 360){
      image(windL,x,y);
    }else{
      image(windR,x,y);
    }
  }else if(!alive){
    if(x > 360){
      image(windLDie,x,y);
    }else{
      image(windRDie,x,y);
    }
  }
}

 Wind(float x,float y){
 super(x,y);
}
}  
  