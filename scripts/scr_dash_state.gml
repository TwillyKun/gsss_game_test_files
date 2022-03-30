///scr_move_state

//Calculate which direction the player is facing
if (len == 0) {
    dir = face*90;
}
len = spd*4;

// Get speed
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Movement
phy_position_x += hspd;
phy_position_y += vspd;

// Create dash effect, set dash sprite to current index and current image index
var dash = instance_create(x, y, obj_cbt_dash);
dash.sprite_index = sprite_index;
dash.image_index = image_index;
