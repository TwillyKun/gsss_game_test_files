///scr_check_for_player()

/*This script runs within every enemy script that involves movement
If the player character is within their 'sight', they will break into the Chase state
If the player leaves or was never in their 'sight', they will either stand around Idle or begin to Wander
*/

//Check if obj_cbt exists
if (instance_exists(obj_cbt)) {
    //If cbt exists, find the distance from enemy and player
    var dis = point_distance(x, y, obj_cbt.x, obj_cbt.y);
    //If the distance is less than the enemy's sightline, enter Chase state
    if (dis < sight) {
        state = scr_enemy_chase_state;
        var dir = point_direction(x, y, obj_cbt.x, obj_cbt.y);
        xaxis = lengthdir_x(1, dir);
        yaxis = lengthdir_y(1, dir);
    //If the distance is greater than the enemy's sightline, choose a random state
    } else {
        scr_enemy_choose_next_state();
    }
//If cbt doesn't exist, choose a random state
} else {
    scr_enemy_choose_next_state();
}
