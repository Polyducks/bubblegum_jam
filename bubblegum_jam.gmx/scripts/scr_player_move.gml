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
var originalx = x;
var yy = y+vspd;
var originaly = y;

var x_fence_collision = noone;
var x_wall_collision = noone;
var y_fence_collision = noone;
var y_wall_collision = noone;
var xblock = false;
var yblock = false;

//player's original bounding box
var o_x1 = bbox_left;
var o_y1 = bbox_top;
var o_x2 = bbox_right;
var o_y2 = bbox_bottom;
//new bounding box
var n_x1 = bbox_left+hspd;
var n_y1 = bbox_top+vspd;
var n_x2 = bbox_right+hspd;
var n_y2 = bbox_bottom+vspd;

with( all ){
    if (variable_instance_exists(id, "collides") and instance_exists(self)){
        //check collide on x
        if ( !(
                bbox_left > n_x2 or
                bbox_right < n_x1 or
                bbox_top > o_y2 or
                bbox_bottom < o_y1
            )
        ){
            //break out of the intersection of the object is a fence with no collision
            if ( object_get_name(object_index) == "obj_fence" ){
                if ( obj_player.size == 32 ){
                    image_index = 1;
                    collides = false;
                    break;
                }
            }
            if ( collides ){
                xx = originalx;
            }
        }
    
        //check collide on y
        if ( !(
                bbox_left > o_x2 or
                bbox_right < o_x1 or
                bbox_top > n_y2 or
                bbox_bottom < n_y1
            )
        ){
            //break out of the intersection of the object is a fence with no collision
            if ( object_get_name(object_index) == "obj_fence" ){
                if ( obj_player.size == 32 ){
                    image_index = 1;
                    collides = false;
                    break;
                }
            }
            if ( collides ){
                yy = originaly;
            }
        }
    }
}

x = xx;
y = yy;
