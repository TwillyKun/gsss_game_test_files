///scr_move_state
//Call input script
scr_get_input();

//Set state to Dash state
if (dash_key and obj_cbt_stats.stamina >= DASH_COST) {
    state = scr_dash_state;
    //Dash distance is based on the room FPS divided by a number that can be changed here
    alarm[0] = room_speed/6;
    obj_cbt_stats.stamina -= DASH_COST;
    obj_cbt_stats.alarm[0] = room_speed;
}

//Set state to Attack State
if (attack_key) {
    image_index = 0;
    state = scr_attack_state;
}

// Get direction
dir = point_direction(0, 0, xaxis, yaxis);

// Get length
//If character is not moving, set length to 0
if (xaxis == 0 and yaxis == 0) {
    len = 0;
//If character is moving, set length to character's speed, call scr_get_face
} else {
    len = spd;
    scr_get_face();
}

// Calculate the horizontal and verticle speeds of the character
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Move the character's position on the map
phy_position_x += hspd;
phy_position_y += vspd;

// Sprite Adjustment
image_speed = .5;
//If not moving, set sprite index to 0
//Change this later to: Set sprite index to spr_cbt_idle, image_index = 0 when the Idle animation is finally made
if (len == 0) image_index = 0;

//When scr_get_face is called, face will be set to a number between 0 and 3
//See MACROS under 'Default'
switch (face) {
    case RIGHTFACE:
        sprite_index = spr_walk_right;
        break;
    case LEFTFACE:
        sprite_index = spr_walk_left;
        break;
    case UPFACE:
        sprite_index = spr_cbt_up_test;
        break;
    case DOWNFACE:
        sprite_index = spr_cbt_down_test;
        break;
}
