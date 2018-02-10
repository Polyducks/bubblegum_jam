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

with(all){
//    if (!is_undefined(self.collides)){
    if (variable_instance_exists(id, "collides") and instance_exists(self)){
        if (collides){
            //check new x
            if ( !(
                    bbox_left > n_x2 or
                    bbox_right < n_x1 or
                    bbox_top > o_y2 or
                    bbox_bottom < o_y1
                )
            ){
                xblock = true;
                if ( object_get_name(object_index) == "obj_fence" ){
                    x_fence_collision = self;
                }else{
                    x_wall_collision = self;
                }
            }
            //check new y
            if ( !(
                    bbox_left > o_x2 or
                    bbox_right < o_x1 or
                    bbox_top > n_y2 or
                    bbox_bottom < n_y1
                )
            ){
                yblock = true;
                if ( object_get_name(object_index) == "obj_fence" ){
                    y_fence_collision = self;
                }else{
                    y_wall_collision = self;
                }
            }
        }
    }
}

//CHECK X COLLISIONS
if ( !xblock ){
    x = xx;
//x is blocked by a fence only and big enough to crash through
}else if ( x_fence_collision!=noone and size == 32 ){
    x = xx;
    if ( instance_exists( x_fence_collision ) ){
        with ( x_fence_collision ){
            collides = false;
            image_index = 1;
        }
        x_fence_collision = noone;
    }
}else{
    var inst = noone;
    var fence_distance = 99999;
    var wall_distance = 99999;
    if ( x_fence_collision!=noone ){
        fence_distance = distance_to_object( x_fence_collision );
    }
    if ( x_wall_collision!=noone ){
        wall_distance = distance_to_object( x_wall_collision );
    }
    if ( fence_distance < wall_distance ){
        inst = x_fence_collision;
    }else{
        inst = x_wall_collision;
    }
    if ( inst!= noone ){
        if ( bbox_right < inst.bbox_left-1 ){
            x += inst.bbox_left - bbox_right - 1;
        }else if ( bbox_left > inst.bbox_right+1 ){
            x += inst.bbox_right - bbox_left + 1;
        }
    }
}

//CHECK Y COLLISIONS
if ( !yblock ){
    y = yy;
//x is blocked by a fence only and big enough to crash through
}else if ( y_fence_collision!=noone and size == 32 ){
    y = yy;
    if ( instance_exists( y_fence_collision ) ){
        with ( y_fence_collision ){
            collides = false;
            image_index = 1;
        }
        y_fence_collision = noone;
    }
}else{
    var inst = noone;
    var fence_distance = 99999;
    var wall_distance = 99999;
    if ( y_fence_collision!=noone ){
        fence_distance = distance_to_object( y_fence_collision );
    }
    if ( y_wall_collision!=noone ){
        wall_distance = distance_to_object( y_wall_collision );
    }
    if ( fence_distance < wall_distance ){
        inst = y_fence_collision;
    }else{
        inst = y_wall_collision;
    }
    if ( inst!= noone ){
        if ( bbox_bottom < inst.bbox_top-1 ){
            y += inst.bbox_top - bbox_bottom - 1;
        }else if ( bbox_top > inst.bbox_bottom+1 ){
            y += inst.bbox_bottom - bbox_top + 1;
        }
    }
}
