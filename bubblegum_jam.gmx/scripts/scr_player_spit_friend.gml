state = scr_player_move;
if ( eaten != noone and size==16 ){
    var spit_creature = instance_create(x,y,eaten);
    spit_creature.face = face;
    spit_creature.state = scr_friend_spit;
    eaten = noone;
}
