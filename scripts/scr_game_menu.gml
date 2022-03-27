///scr_game_menu
//in game menu
switch (mpos){
    case 0: // quit to main menu
        room_goto(rom_main_menu);
        break;
    case 1: //reload current room
        room_goto(global.prev_room)
        break;
}
