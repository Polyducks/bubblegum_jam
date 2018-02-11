///scr_player_move

//Enlarge on space key
if ( space_key ){
    if ( size == 32 ){
        state = scr_player_enlarge;
    }
}
if ( z_key or x_key or c_key or v_key ){
    scr_player_emote();
}

if ( size == 16 ){
    spd = 3;
}else{
    spd = 2;
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

var top_collision = false;
var bottom_collision = false;
var left_collision = false;
var right_collision = false;

var colliders_length = ds_list_size( global.colliders );

for ( var i = 0; i < colliders_length; i++ ){
    var inst = global.colliders[| i];
    if ( inst.collides ){
        //if it's a fence, destroy it
        if ( object_get_name(inst.object_index) == "obj_fence" and size==32){
            if ( place_meeting( xx, yy, inst )){
                with(inst){
                    scr_fence_destroy();
                }
            }
        }
        //check if it still collides after a possible fence destruction
        if ( inst.collides ){
            //collides on the x
            if( place_meeting( xx, y, inst )){
                for ( var j = abs(hspd); j >= 0; j-- ){
                    var test_x = x+(j*xaxis);
                    if ( !place_meeting( test_x, y, inst )){
                        xx = test_x;
                        break;
                    //if no variations breaks it out of collide, don't move
                    }else if( j == 0 ){
                        xx = x;
                    }
                }
            }
            if( place_meeting( x, yy, inst )){
                for ( var j = abs(vspd); j >= 0; j-- ){
                    var test_y = y+(j*yaxis);
                    if ( !place_meeting( x, test_y, inst )){
                        yy = test_y;
                        break;
                    //if no variations breaks it out of collide, don't move
                    }else if( j == 0 ){
                        yy = y;
                    }
                }
            }
        }
    }
}

if (!(top_collision and bottom_collision) and
    !(left_collision and right_collision)){
    x = xx;
    y = yy;
}
