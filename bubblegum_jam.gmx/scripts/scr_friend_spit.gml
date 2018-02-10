var len = spit_speed;

var vspd = 0;
var hspd = 0;

switch(face){
    case RIGHT:
    hspd = len;
    break;
    case LEFT:
    hspd = -len;
    break;
    case UP:
    vspd = -len;
    break;
    case DOWN:
    vspd = len;
    break;
}

var xx = x+hspd;
var yy = y+vspd;

spit_move += spit_speed;

var spaceship = instance_place( floor(xx), floor(yy), obj_spaceship );
if ( spaceship != noone ){
    score++;
    instance_destroy();
}

var inst = instance_place( floor(xx), floor(yy), obj_wall );
if ( inst == noone ){
    x = xx;
    y = yy;
}else{
    state = scr_friend_idle;    
}

if ( spit_move >= spit_distance ){
    state = scr_friend_idle;
}
