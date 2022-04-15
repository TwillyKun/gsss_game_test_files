///scr_enemy_move_state()
//Calculate direction the enemy is moving to, have it look in the correction direction,
//and change it's position on the map

if (point_distance(x, y, targetx, targety) > spd) {
    var dir = point_direction(x, y, targetx, targety)
    var hspd = lengthdir_x(spd, dir);
    var vspd = lengthdir_y(spd, dir);
    //Prevent the sprite from swapping rapidly if the target is on the same x axis as target
    if (sign(hspd)!= 0) {
        image_xscale = sign(hspd);
    }
    phy_position_x += hspd;
    phy_position_y += vspd;
}
