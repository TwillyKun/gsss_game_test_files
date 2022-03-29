///scr_enemy_stale_state()
//When the enemy hits the player, freeze, then return to Idle to choose next action
if (alarm[1] <= 0) {
    state = scr_enemy_idle_state;
}
