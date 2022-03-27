///scr_move_state
//Call input script
scr_get_input();

//Set Dash State
if (dash_key) {
    state = scr_dash_state;
    //Dash distance is based on the room FPS divided by a number that can be changed here
    alarm[0] = room_speed/6;
}

//Set Attack State
if (attack_key) {
    image_index = 0;
    state = scr_attack_state;
}

// Get direction
dir = point_direction(0, 0, xaxis, yaxis);

// Get Length
if (xaxis == 0 and yaxis == 0) {
    len = 0;
} else {
    len = spd;
}

// Get speed
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Movement
phy_position_x += hspd;
phy_position_y += vspd;

// Sprite Adjustment
image_speed = .5;
if (len == 0) image_index = 0;

// Vert Sprites
if (vspd > 0) {
    sprite_index = spr_cbt_down_test;
} else if (vspd < 0) {
    sprite_index = spr_cbt_up_test;
}

//Hori Sprites
if (hspd > 0) {
    sprite_index = spr_walk_right;
} else if (hspd < 0) {
    sprite_index = spr_walk_left;
}
