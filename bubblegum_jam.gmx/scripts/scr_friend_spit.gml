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

var xx = floor(x+hspd);
var yy = floor(y+vspd);

spit_move += spit_speed;

var spaceship = instance_place( xx, yy, obj_spaceship );
if ( spaceship != noone and !spaceship.occupied ){
    audio_sound_gain( snd_confirmation, 0.5, 0 );
    audio_play_sound(snd_confirmation, 1, false);
    spaceship.occupied = true;
    score++;
    instance_destroy();
}

var no_collision = true;
var colliders_length = ds_list_size( global.colliders );
for ( var i = 0; i < colliders_length; i++ ){
    inst = global.colliders[| i];
    //friends can fly over fences;
    if ( object_get_name(inst.object_index) != "obj_fence" ){
        var xAdjust = 0;
        var yAdjust = 0;
        if ( hspd != 0 ){
            yAdjust = 6;
        }
        if ( vspd != 0 ){
            xAdjust = 6;
        }
        if( collision_rectangle( bbox_left+xAdjust, bbox_top+yAdjust, bbox_right-xAdjust, bbox_bottom-yAdjust, inst, false, true )){
        //if ( place_meeting( xx, yy, inst )){
            no_collision = false;
            break;
        }
    }
}

if ( no_collision ){
    x = xx;
    y = yy;
}else{
    state = scr_friend_idle;    
}

if ( spit_move >= spit_distance ){
    state = scr_friend_idle;
}
