//scr_friend_interact

if ( speaking_progress >= 3 ){
    //set the new state of being sucked towards the player
    state = scr_friend_suck;
}

//if player has left, resume idle
if ( distance_to_object( obj_player ) > vision or obj_player.eaten!=noone){
    speaking_progress = 0;
    state = scr_friend_idle;
}else{
    
    if (!thinking and !speaking){
        speaking = true;
        thinking = true;
        scr_make_speech_bubble();
        emote = floor( random(4) );
        speech_bubble.emote = emote;
        sprite_index = spr_friend_down;
        alarm[0]= room_speed*2;
    }else if (speaking and !celebrating and obj_player.emote!= -1){
        celebrating = true;
        if ( obj_player.emote == emote ){
            sprite_index = spr_friend_happy;
            speaking_progress++;
        }else{
            sprite_index = spr_friend_angry;
            speaking_progress = 0;
        }
        scr_destroy_speech_bubble();
        alarm[0]=room_speed;
    }
    
}
