///scr_player_enlarge()
if ( !size_changing ){
    was_size = size;
    if ( was_size == 16 ){
        new_size = 32;
        audio_play_sound(snd_grow, 20, false);
    }else{
        new_size = 16;
        audio_play_sound(snd_shrink, 20, false);
    }
    size_changing = true;
    alarm[0] = 30;
}
if ( alarm_get(0) != 0 ){
    sprite_offset_x = round( sin( alarm_get(0) ));
    var new_scale = new_size / was_size
    image_xscale = lerp( 1, new_scale, 1/alarm_get(0) );
    image_yscale = image_xscale;
}
