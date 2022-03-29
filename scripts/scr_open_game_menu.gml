///scr_open_game_menu
scr_get_input();

var push;
push = max(keyboard_check_pressed(start), 0);

if (push == 1) room_goto(rom_game_menu);
