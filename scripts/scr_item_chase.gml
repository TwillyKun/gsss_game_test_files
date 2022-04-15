///scr_item_chase()

if (instance_exists(obj_cbt)) {
    var dir = point_distance(x,y, obj_cbt.x, obj_cbt.y);
    var hspd = lengthdir_x(10, dir);
    var vspd = lengthdir_y(10, dir);
    phy_position_x += hspd;
    phy_position_y += vspd;
}
