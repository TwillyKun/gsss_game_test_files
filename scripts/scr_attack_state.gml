///scr_attack_state
//Change image speed of the attack animation here
image_speed = .5;

//Check the direction the player was heading towards and choose the correct attack sprite
switch (sprite_index) {
    case spr_walk_right:
        sprite_index = spr_attack_right;
        break;
        
    case spr_walk_left:
        sprite_index = spr_attack_left;
        break;
}

//On frame 2 or more and the attack hasn't already gone through
if (image_index >= 2 and attacked == false) {
    //xx and yy represent where the damage box spawn on attack
    var xx = 0;
    var yy = 0;
    
    //Change positioning of the damage box here
    switch (sprite_index) {
        case spr_attack_right:
            xx = x+30;
            yy = y-10;
            break;
            
        case spr_attack_left:
            xx = x-30;
            yy = y-10;
            break;
        }
    
    /*Create the damage box, set the character who created as creator so that they also won't get hurt, 
    damage everything within the hitbox based on damage stat, and set attacked to True so that no more than 1 hit box will be created per attack*/
    var damage = instance_create(xx, yy, obj_damage);
    damage.creator = id;
    damage.damage = obj_cbt_stats.attack;
    attacked = true;
}
