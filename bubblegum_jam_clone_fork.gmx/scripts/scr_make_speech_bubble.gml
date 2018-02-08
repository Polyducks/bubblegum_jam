var xx = x;
var yy = y - ( sprite_get_height( sprite_index )+2 );
speech_bubble = instance_create( xx, yy, obj_gui_emote_speech );
speech_bubble.creator = self;
speech_bubble.xoffset = 0;
speech_bubble.yoffset = yy-y;
