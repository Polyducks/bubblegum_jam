///scr_player_move

//Enlarge on space key
if ( space_key ){
    state = scr_player_enlarge;
}
if ( z_key or x_key or c_key or v_key ){
    scr_player_emote();
}


//Get the axis
var xaxis = ( right_key - left_key );
var yaxis = ( down_key - up_key );

//Get direction
dir = point_direction( 0, 0, xaxis, yaxis );

//Get the length
if ( xaxis == 0 and yaxis == 0 ){
    len = 0;
}else{
    len = spd;
    scr_get_face();
}

//Get the hspd and vspd
hspd = round(lengthdir_x( len, dir ));
vspd = round(lengthdir_y( len, dir ));

var xx = x+hspd;
var yy = y+vspd;

var inst = instance_place( floor(xx), floor(y), obj_wall );
if ( inst == noone ){
    x = xx;
}else{
    if ( bbox_right < inst.bbox_left-1 ){
        x += inst.bbox_left - bbox_right - 1;
    }else if ( bbox_left > inst.bbox_right+1 ){
        x += inst.bbox_right - bbox_left + 1;
    }
}

inst = instance_place( floor(x), floor(yy), obj_wall );
if ( inst == noone ){
    y = yy;
}else{
    if ( bbox_bottom < inst.bbox_top-1 ){
        y += inst.bbox_top - bbox_bottom - 1;
    }else if ( bbox_top > inst.bbox_bottom+1 ){
        y += inst.bbox_bottom - bbox_top + 1;
    }
}
