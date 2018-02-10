if ( collides ){
    image_index = 1;
    collides = false;
    var varieties_of_fence_sound = ceil( random(7));
    var sound_to_play = asset_get_index("snd_fence_0" + string(varieties_of_fence_sound));
    audio_play_sound(sound_to_play, 20, false);
}
