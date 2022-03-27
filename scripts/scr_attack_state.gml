///scr_attack_state
image_speed = .5;

switch (sprite_index) {
    case spr_walk_right:
        sprite_index = spr_attack_right;
        break;
        
    case spr_walk_left:
        sprite_index = spr_attack_left;
        break;
}

if (image_index >= 2 and attacked == false) {
    var damage = instance_create(x, y, obj_damage);
    damage.creator = id;
    attacked = true;
}
