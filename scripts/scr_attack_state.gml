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
