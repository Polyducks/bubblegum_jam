//what to do when a friend is being sucked up by the player
var xadjust = sign( obj_player.x - x );
var yadjust = sign( obj_player.y - y );
x += xadjust;
y += yadjust;
if ( x == obj_player.x and
     y == obj_player.y ){
     obj_player.state = scr_player_enlarge;
     //var myObj = object_get_name(self);
     //obj_player.eaten = myObj;
     obj_player.eaten = object_get_name(self);
     instance_destroy();
}
