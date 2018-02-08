//scr_friend_idle()

//check if player is near
if ( distance_to_object( obj_player ) < vision and obj_player.eaten==noone ){
    alarm[0] = 0;
    thinking = false;
    state = scr_friend_interact;
}else{

    if ( speech_bubble != noone ){
        speaking = false;
        with(speech_bubble){
            instance_destroy();
        }
    }

    //waiting for the player to arrive
    
    //look in a random direction
    if (!thinking){
        alarm[0] = floor( random_range(30, 90));
        thinking = true;
        dir = floor(random(4));
        switch(dir){
            case 0:
                sprite_index = spr_friend_right;
                break;
            case 1:
                sprite_index = spr_friend_down;
                break;
            case 2:
                sprite_index = spr_friend_left;
                break;
            case 3:
                sprite_index = spr_friend_up;
                break;
        }
    }
    
}
