///scr_player_move

right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);


if (keyboard_check(vk_right)){
    phy_position_x += spd;
}
if (keyboard_check(vk_left)){
    phy_position_x -= spd;
}
if (keyboard_check(vk_up)){
    phy_position_y -= spd;
}
if (keyboard_check(vk_down)){
    phy_position_y += spd;
}
