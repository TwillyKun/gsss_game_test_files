///scr_enemy_choose_next_state()
//When alarm[0] of this enemy hits 0, choose a random state to enter, set a random time for the alarm, and set a random x and y
if (alarm[0] <= 0) {
    state = choose(scr_enemy_wander_state, scr_enemy_idle_state);
    alarm[0] = room_speed*irandom_range(2, 4);
    targetx = random(room_width);
    targety = random(room_height);
}
