///scr_player_enlarge()
if ( !size_changing ){
    if ( size == 16 ){
        size = 32;
    }else{
        size = 16;
    }
    size_changing = true;
    alarm[0] = 30;
}

sprite_offset_x = round( sin( alarm_get(0) ));
