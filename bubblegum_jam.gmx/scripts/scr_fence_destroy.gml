if ( collides ){
    image_index = 1;
    collides = false;
    randomize();
    var varieties_of_fence_sound = ceil( random(7));
    var sound_to_play = asset_get_index("snd_fence_0" + string(varieties_of_fence_sound));
    audio_sound_gain( sound_to_play, 0.28, 0 );
    audio_play_sound(sound_to_play, 20, false);
}
