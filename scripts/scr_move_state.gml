///scr_move_state
movement = MOVE;

//Set state to Dash state
if (obj_input.dash_key) {
    var xdir = lengthdir_x(8, face*90);
    var ydir = lengthdir_y(8, face*90);
    var speaker = instance_place(x+xdir, y+ydir, obj_speaker);
    if (speaker != noone) {
        //Talk
        with (speaker) {
            if (!instance_exists(dialog)) {
                dialog = instance_create(x+xoffset, y+yoffset, obj_dialog);
                dialog.text = text;
            } else {
             dialog.text_page++;
             dialog.text_count = 0;
             if (dialog.text_page > array_length_1d(dialog.text) - 1){
                    with (dialog) {
                        instance_destroy();
                    }
                }
            }
        }
    
    } else if (obj_cbt_stats.stamina >= DASH_COST) {
        //Dash
        state = scr_dash_state;
        //Dash distance is based on the room FPS divided by a number that can be changed here
        alarm[0] = room_speed/6;
        obj_cbt_stats.stamina -= DASH_COST;
        obj_cbt_stats.alarm[0] = room_speed;
    }
}

//Set state to Attack State
if (obj_input.attack_key) {
    image_index = 0;
    state = scr_attack_state;
}

//Set state to Fire State
if (obj_input.fire_key) {
    var p = instance_create(x, y, obj_projectile);
    var xforce = lengthdir_x(200, face*90);
    var yforce = lengthdir_y(200, face*90);
    p.creator = id;
    with (p) {
        physics_apply_impulse(x, y, xforce, yforce);
    }
}

//Set state to Sprint State (Toggle)
if (obj_input.sprint_key) {
    if (sprint == true) {
        sprint = false;
    } else {
        sprint = true;
    }
} else {

}

//Press up to interact
if (obj_input.up_key) {
    var xdir = lengthdir_x(8, face*90);
    var ydir = lengthdir_y(8, face*90);
    var speaker = instance_place(x+xdir, y+ydir, obj_speaker);
    if (speaker != noone) {
        //Talk
        with (speaker) {
            if (!instance_exists(dialog)) {
                dialog = instance_create(x+xoffset, y+yoffset, obj_dialog);
                dialog.text = text;
            } else {
             dialog.text_page++;
             dialog.text_count = 0;
             if (dialog.text_page > array_length_1d(dialog.text) - 1){
                    with (dialog) {
                        instance_destroy();
                    }
                }
            }
        }
    }
}

// Get direction
dir = point_direction(0, 0, obj_input.xaxis, obj_input.yaxis);

// Get length
//If character is not moving, set length to 0 and prevent sprinting
if (obj_input.xaxis == 0 and obj_input.yaxis == 0) {
    len = 0;
    sprint = false;
//If character is moving, set length to character's speed based on state, then call scr_get_face
} else {
    if (sprint == false) {
        len = spd;
    } else {
        len = spd*2;
    }
    scr_get_face();
}

// Calculate the horizontal and verticle speeds of the character
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Move the character's position on the map
phy_position_x += hspd;

/* Old code for moving character up and down
phy_position_y += vspd;
*/

// Sprite Adjustment
image_speed = .5;
if (len == 0) image_index = 0;
