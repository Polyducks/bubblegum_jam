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
audio_group_stop_all(friend_emote);
var sound_to_play = asset_get_index("snd_" + string(emote) + "_0" + string(sound_variation));
audio_sound_gain( sound_to_play, 0.8, 0 );
audio_play_sound(sound_to_play, 20, false);
