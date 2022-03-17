///scr_move_state
scr_get_input();

// Get the axis
var xaxis = (right_key - left_key);
var yaxis = (down_key - up_key);

// Get direction
var dir = point_direction(0, 0, xaxis, yaxis);

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
