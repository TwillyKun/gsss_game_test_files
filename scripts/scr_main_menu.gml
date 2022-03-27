///scr_main_menu
//Basic menu, new game goes to next room in list, quit kills process, others just for show
switch (mpos){
    case 0:
        room_goto_next();
        break;
    case 1:
        break;
    case 2:
        break;
    case 3:
        break;
    case 4:
        game_end();
        break;
}
