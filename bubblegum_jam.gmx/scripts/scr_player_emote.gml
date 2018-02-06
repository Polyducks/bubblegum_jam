//scr_player_emote

if ( z_key ){
    emote = 0;
}else if( x_key ){
    emote = 1;
}else if( c_key ){
    emote = 2;
}else if( v_key ){
    emote = 3;
}else{
    emote = -1;
}

scr_make_speech_bubble();
