//move away from walls that might trap us
 
var xpush = 0;
var ypush = 0;

//flags to note where the intersections are happening
var top_interaction = false;
var bottom_interaction = false;
var left_interaction = false;
var right_interaction = false;
  
with( all ){
    if (variable_instance_exists(id, "collides") and instance_exists(self)){
        var inst = instance_place( floor(x), floor(y), obj_player );
        if ( inst!= noone and collides ){
            //break out of the intersection of the object is a fence with no collision
            if ( object_get_name(object_index) == "obj_fence" ){
                if ( obj_player.size == 32 ){
                    scr_fence_destroy();
                }
            }
            if ( collides ){
                //get nearest edge
                var near_left = abs(bbox_left - inst.bbox_right);
                var near_right = abs(bbox_right - inst.bbox_left);
                var near_top = abs(bbox_top - inst.bbox_bottom);
                var near_bottom = abs(bbox_bottom - inst.bbox_top);
                
                var nearest = min( near_left, near_right, near_top, near_bottom );
                
                //push to the outside of that edge
                if ( near_left == nearest ){
                    left_interaction = true;
                    xpush -= near_left;
                }else if ( near_right == nearest ){
                    right_interaction = true;
                    xpush += near_right;
                }else if ( near_top == nearest ){
                    top_interaction = true;
                    ypush -= near_top;
                }else if ( near_bottom == nearest ){
                    bottom_interaction = true;
                    ypush += near_bottom;
                }
            }
        }
    }
}

//check the character isn't stuck between walls
if ( !( top_interaction and bottom_interaction) and
     !( left_interaction and right_interaction)){
    x+= xpush;
    y+= ypush;
}   
