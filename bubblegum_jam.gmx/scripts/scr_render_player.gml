//scr_render_player();
switch (face){
    case RIGHT:
        sprite_index = asset_get_index("spr_player_" + string(size) + "_right");
    break;
    case UP:
        sprite_index = asset_get_index("spr_player_" + string(size) + "_up");
    break;
    case LEFT:
        sprite_index = asset_get_index("spr_player_" + string(size) + "_left");
    break;
    case DOWN:
        sprite_index = asset_get_index("spr_player_" + string(size) + "_down");
    break;
}
