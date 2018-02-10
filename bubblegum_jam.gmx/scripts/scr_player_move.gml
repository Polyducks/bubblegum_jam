///scr_player_move

//Enlarge on space key
if ( space_key ){
    state = scr_player_enlarge;
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
        //check collides
        if ( !(
                bbox_left > n_x2 or
                bbox_right < n_x1 or
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
                var xpush = 0;
                var ypush = 0;
                //get nearest edge
                var near_left = abs(bbox_left - obj_player.bbox_right);
                var near_right = abs(bbox_right - obj_player.bbox_left);
                var near_top = abs(bbox_top - obj_player.bbox_bottom);
                var near_bottom = abs(bbox_bottom - obj_player.bbox_top);
                
                var nearest = min( near_left, near_right, near_top, near_bottom );
                //push to the outside of that edge
                if ( near_left == nearest ){
                    xpush += near_left-1;
                    xx = originalx+xpush;
                }else if ( near_right == nearest ){
                    xpush -= near_right-1;
                    xx = originalx+xpush;
                }else if ( near_top == nearest ){
                    ypush += near_top-1;
                    yy = originaly+ypush;
                }else if ( near_bottom == nearest ){
                    ypush -= near_bottom-1;
                    yy = originaly+ypush;
                }
            }
        }
        
        //check collide on x
        /*if ( !(
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
        }*/
    
        //check collide on y
        /*if ( !(
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
        }*/
    }
}

x = xx;
y = yy;
