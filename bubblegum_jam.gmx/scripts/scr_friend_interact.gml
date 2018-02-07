//scr_friend_interact

//if player has left, resume idle
if ( distance_to_object( obj_player ) > vision ){
    speaking_progress = 0;
    state = scr_friend_idle;
}else{
    
    if (!thinking and !speaking){
        speaking = true;
        thinking = true;
        scr_make_speech_bubble();
        speech_bubble.emote = floor( random(4) );
    }else if (speaking){
        if ( obj_player.emote == emote ){
            
        }
    }
    
}
