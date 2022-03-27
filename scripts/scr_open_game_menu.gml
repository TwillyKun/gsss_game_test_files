//Hit esc when in game to open game menu
//03/27/2022 - jdonn

var push;
push = max(keyboard_check_pressed(vk_escape), 0);

if (push == 1) room_goto(rom_game_menu);
