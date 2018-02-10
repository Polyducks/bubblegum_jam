switch( emote ){
    case 0: //smile
        var sound_variation = ceil( random(5));
    break;
    case 1: //anger
        var sound_variation = ceil( random(5));
    break;
    case 2: //sad
        var sound_variation = ceil( random(4));
    break;
    case 3: //cheeky
        var sound_variation = ceil( random(6));
    break;
}

var sound_to_play = asset_get_index("snd_" + string(emote) + "_0" + string(sound_variation));
audio_play_sound(sound_to_play, 20, false);
